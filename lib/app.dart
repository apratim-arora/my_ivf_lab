import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/cycle_list/cycle_list_screen.dart';
import 'features/cycle_form/cycle_form_screen.dart';
import 'features/daily_observation/daily_obs_screen.dart';
import 'features/active_cultures/active_cultures_screen.dart';
import 'features/cycle_detail/cycle_detail_screen.dart';
import 'features/cycle_detail/patient_edit_screen.dart';
import 'features/cycle_detail/clinical_edit_screen.dart';
import 'features/cycle_detail/semen_edit_screen.dart';
import 'features/cycle_detail/retrieval_edit_screen.dart';
import 'features/cycle_detail/treatment_edit_screen.dart';
import 'features/cycle_detail/timing_edit_screen.dart';
import 'features/cycle_detail/transfer_edit_screen.dart';

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
          CycleDetailScreen(cycleId: int.parse(state.pathParameters['id']!)),
    ),
    // Edit sub-routes
    GoRoute(
      path: '/cycle/:id/edit/patient',
      builder: (_, state) =>
          PatientEditScreen(cycleId: int.parse(state.pathParameters['id']!)),
    ),
    GoRoute(
      path: '/cycle/:id/edit/clinical',
      builder: (_, state) =>
          ClinicalEditScreen(cycleId: int.parse(state.pathParameters['id']!)),
    ),
    GoRoute(
      path: '/cycle/:id/edit/semen',
      builder: (_, state) =>
          SemenEditScreen(cycleId: int.parse(state.pathParameters['id']!)),
    ),
    GoRoute(
      path: '/cycle/:id/edit/retrieval',
      builder: (_, state) =>
          RetrievalEditScreen(cycleId: int.parse(state.pathParameters['id']!)),
    ),
    GoRoute(
      path: '/cycle/:id/edit/treatment',
      builder: (_, state) =>
          TreatmentEditScreen(cycleId: int.parse(state.pathParameters['id']!)),
    ),
    GoRoute(
      path: '/cycle/:id/edit/timing',
      builder: (_, state) =>
          TimingEditScreen(cycleId: int.parse(state.pathParameters['id']!)),
    ),
    GoRoute(
      path: '/cycle/:id/edit/transfer',
      builder: (_, state) =>
          TransferEditScreen(cycleId: int.parse(state.pathParameters['id']!)),
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
