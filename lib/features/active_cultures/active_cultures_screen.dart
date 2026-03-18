import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database/app_database.dart';
import '../cycle_list/cycle_list_providers.dart';
import '../daily_observation/daily_obs_notifier.dart';
import '../daily_observation/blastocyst/blastocyst_notifier.dart';
import '../cycle_form/cycle_form_notifier.dart';

class ActiveCulturesScreen extends ConsumerWidget {
  const ActiveCulturesScreen({super.key});

  static int _cultureDay(DateTime pickupDate) {
    final diff = DateTime.now().difference(pickupDate).inDays;
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
      appBar: AppBar(title: const Text('Active Cultures')),
      body: activeAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (cycles) => cycles.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.biotech_outlined, size: 48, color: Colors.grey[300]),
                    const SizedBox(height: 12),
                    const Text('No cycles in active culture'),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: cycles.length,
                itemBuilder: (ctx, i) {
                  final cycle = cycles[i];
                  final day = cycle.oocytePickupDate != null
                      ? _cultureDay(cycle.oocytePickupDate!)
                      : null;
                  return _ModernActiveTile(cycle: cycle, currentDay: day);
                },
              ),
      ),
    );
  }
}

class _ModernActiveTile extends ConsumerWidget {
  final IvfCycle cycle;
  final int? currentDay;
  const _ModernActiveTile({required this.cycle, required this.currentDay});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: isRecorded ? Colors.green.withValues(alpha: 0.1) : Colors.orange.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('DAY', style: TextStyle(fontSize: 10, color: isRecorded ? Colors.green[700] : Colors.orange[700])),
              Text('${currentDay ?? "?"}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isRecorded ? Colors.green[800] : Colors.orange[800])),
            ],
          ),
        ),
        title: Text('${cycle.wifeName} / ${cycle.husbandName}', style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            children: [
              Icon(isRecorded ? Icons.check_circle : Icons.pending, size: 14, color: isRecorded ? Colors.green : Colors.orange),
              const SizedBox(width: 4),
              Text(isRecorded ? 'Assessment Recorded' : 'Assessment Pending', style: TextStyle(color: isRecorded ? Colors.green[700] : Colors.orange[800], fontSize: 13)),
            ],
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.push('/cycle/${cycle.id}'),
      ),
    );
  }
}
