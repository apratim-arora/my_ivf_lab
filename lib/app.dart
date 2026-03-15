import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/cycle_list/cycle_list_screen.dart';
import 'features/cycle_form/cycle_form_screen.dart';
import 'features/daily_observation/daily_obs_screen.dart';
import 'features/active_cultures/active_cultures_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (_, _) => const CycleListScreen()),
    GoRoute(
      path: '/cycle/new',
      builder: (_, _) => const CycleFormScreen(cycleId: null),
    ),
    GoRoute(
      path: '/cycle/:id',
      builder: (_, state) =>
          CycleFormScreen(cycleId: int.parse(state.pathParameters['id']!)),
    ),
    GoRoute(
      path: '/cycle/:id/day/:day',
      builder: (_, state) => DailyObsScreen(
        cycleId: int.parse(state.pathParameters['id']!),
        day: int.parse(state.pathParameters['day']!),
      ),
    ),
    GoRoute(path: '/active', builder: (_, _) => const ActiveCulturesScreen()),
  ],
);

class EmbryologyApp extends StatelessWidget {
  const EmbryologyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'EmbryoLog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B6CA8)),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1B6CA8),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
