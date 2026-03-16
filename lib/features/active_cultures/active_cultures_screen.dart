import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../data/database/app_database.dart';
import '../cycle_list/cycle_list_providers.dart';
import '../daily_observation/daily_obs_notifier.dart';
import '../daily_observation/blastocyst/blastocyst_notifier.dart';
import '../cycle_form/cycle_form_notifier.dart';

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

class _ActiveCultureTile extends ConsumerWidget {
  final IvfCycle cycle;
  final int? currentDay;
  const _ActiveCultureTile({required this.cycle, required this.currentDay});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final dayLabel = currentDay != null ? 'Day $currentDay' : 'Unknown day';
    final pickupStr = cycle.oocytePickupDate != null
        ? DateFormat('dd MMM').format(cycle.oocytePickupDate!)
        : '';

    bool isRecorded = false;
    if (currentDay != null) {
      if (currentDay == 5) {
        final cycleData = ref.watch(cycleFormProvider(cycle.id)).asData?.value;
        final grades = ref.watch(blastocystProvider(cycle.id)).asData?.value;
        isRecorded = (cycleData?.totalBlastocysts != null) ||
            (grades != null && grades.isNotEmpty);
      } else {
        final obs = ref
            .watch(dailyObsProvider((cycleId: cycle.id, day: currentDay!)))
            .asData
            ?.value;
        isRecorded = obs != null;
      }
    }
    final statusLabel = isRecorded ? 'Recorded' : 'Pending';
    final statusColor = isRecorded ? Colors.green : Colors.orange;

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
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pickup: $pickupStr · $dayLabel'),
            Text(
              statusLabel,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            isRecorded ? Icons.edit_note : Icons.add_circle_outline,
            color: cs.primary,
          ),
          tooltip: isRecorded ? 'Edit observation' : 'Enter observation',
          onPressed: currentDay != null
              ? () => context.push('/cycle/${cycle.id}/day/$currentDay')
              : null,
        ),
        onTap: () => context.push('/cycle/${cycle.id}'),
      ),
    );
  }
}
