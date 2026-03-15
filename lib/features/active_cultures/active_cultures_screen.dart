import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../data/database/app_database.dart';
import '../cycle_list/cycle_list_providers.dart';

class ActiveCulturesScreen extends ConsumerWidget {
  const ActiveCulturesScreen({super.key});

  static int _cultureDay(DateTime pickupDate) {
    final diff = DateTime.now().difference(pickupDate).inDays;
    // Map elapsed days to culture day: 0→1, 1→2, 2→3, 4→5
    if (diff <= 0) return 1;
    if (diff == 1) return 2;
    if (diff == 2) return 3;
    if (diff >= 4) return 5;
    return diff;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeAsync = ref.watch(activeCyclesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Active cultures')),
      body: activeAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (cycles) => cycles.isEmpty
            ? const Center(child: Text('No active cultures'))
            : ListView.builder(
                itemCount: cycles.length,
                itemBuilder: (ctx, i) {
                  final cycle = cycles[i];
                  final day = cycle.oocytePickupDate != null
                      ? _cultureDay(cycle.oocytePickupDate!)
                      : null;
                  return _ActiveCultureTile(cycle: cycle, currentDay: day);
                },
              ),
      ),
    );
  }
}

class _ActiveCultureTile extends StatelessWidget {
  final IvfCycle cycle;
  final int? currentDay;
  const _ActiveCultureTile({required this.cycle, required this.currentDay});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final dayLabel = currentDay != null ? 'Day $currentDay' : 'Unknown day';
    final pickupStr = cycle.oocytePickupDate != null
        ? DateFormat('dd MMM').format(cycle.oocytePickupDate!)
        : '';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: cs.primaryContainer,
          child: Text(
            'D${currentDay ?? '?'}',
            style: TextStyle(
              color: cs.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text('${cycle.wifeName}  /  ${cycle.husbandName}'),
        subtitle: Text('Pickup: $pickupStr  ·  $dayLabel observation pending'),
        trailing: IconButton(
          icon: const Icon(Icons.add_circle_outline),
          tooltip: 'Enter observation',
          onPressed: currentDay != null
              ? () => context.push('/cycle/${cycle.id}/day/$currentDay')
              : null,
        ),
        onTap: () => context.push('/cycle/${cycle.id}'),
      ),
    );
  }
}
