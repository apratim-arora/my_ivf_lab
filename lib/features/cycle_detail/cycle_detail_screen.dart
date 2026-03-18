import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../data/database/app_database.dart';
import '../cycle_form/cycle_form_notifier.dart';
import '../cycle_form/metrics_providers.dart';
import '../daily_observation/blastocyst/blastocyst_notifier.dart';
import '../daily_observation/daily_obs_notifier.dart';
import '../transfer/transfer_notifier.dart';
import '../../shared/widgets/modern_components.dart';

class CycleDetailScreen extends ConsumerWidget {
  final int cycleId;
  const CycleDetailScreen({super.key, required this.cycleId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cycleAsync = ref.watch(cycleFormProvider(cycleId));

    return cycleAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (cycle) {
        if (cycle == null) return const Scaffold(body: Center(child: Text('Cycle not found')));

        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: Text('${cycle.wifeName} / ${cycle.husbandName}'),
              bottom: TabBar(
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Theme.of(context).primaryColor,
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: 'Summary'),
                  Tab(text: 'Clinic'),
                  Tab(text: 'Laboratory'),
                  Tab(text: 'Timeline'),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                _SummaryTab(cycle: cycle),
                _ClinicTab(cycle: cycle),
                _LabTab(cycle: cycle),
                _TimelineTab(cycle: cycle),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SummaryTab extends ConsumerWidget {
  final IvfCycle cycle;
  const _SummaryTab({required this.cycle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matRate = ref.watch(maturationRateProvider(cycle.id));
    final fertRate = ref.watch(fertilizationRateProvider(cycle.id));
    final blastRate = ref.watch(blastulationRateProvider(cycle.id));

    final pct = NumberFormat.percentPattern()..maximumFractionDigits = 1;

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      children: [
        const GroupingHeader(title: 'Key Performance Indicators'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _KpiCard(label: 'Maturation', value: matRate != null ? pct.format(matRate) : '—', color: Colors.blue),
              _KpiCard(label: 'Fertilization', value: fertRate != null ? pct.format(fertRate) : '—', color: Colors.pink),
              _KpiCard(label: 'Blastulation', value: blastRate != null ? pct.format(blastRate) : '—', color: Colors.purple),
            ],
          ),
        ),

        const GroupingHeader(title: 'Patient Information'),
        CupertinoCard(
          onTap: () => context.push('/cycle/${cycle.id}/edit/patient'),
          child: Column(
            children: [
              _ModernInfoRow(Icons.person_outline, 'Wife', '${cycle.wifeName} (${cycle.wifeAge}y)'),
              const Divider(indent: 40),
              _ModernInfoRow(Icons.person_outline, 'Husband', '${cycle.husbandName} (${cycle.husbandAge}y)'),
              if (cycle.cycleIdentifier != null) ...[
                const Divider(indent: 40),
                _ModernInfoRow(Icons.fingerprint, 'Cycle ID', cycle.cycleIdentifier!),
              ],
            ],
          ),
        ),

        const GroupingHeader(title: 'Procedure Timing'),
        CupertinoCard(
          onTap: () => context.push('/cycle/${cycle.id}/edit/timing'),
          child: Column(
            children: [
              _ModernInfoRow(Icons.calendar_today_outlined, 'Pickup Date', cycle.oocytePickupDate != null ? DateFormat('dd MMM yyyy').format(cycle.oocytePickupDate!) : 'Not set'),
              const Divider(indent: 40),
              _ModernInfoRow(Icons.access_time, 'Pickup Time', cycle.oocytePickupTime ?? 'Not set'),
              const Divider(indent: 40),
              _ModernInfoRow(Icons.bolt_outlined, 'ICSI Time', cycle.icsiTime ?? 'Not set'),
            ],
          ),
        ),
      ],
    );
  }
}

class _ClinicTab extends StatelessWidget {
  final IvfCycle cycle;
  const _ClinicTab({required this.cycle});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      children: [
        const GroupingHeader(title: 'Wife Clinicals'),
        CupertinoCard(
          onTap: () => context.push('/cycle/${cycle.id}/edit/clinical'),
          child: Column(
            children: [
              _ModernInfoRow(Icons.monitor_heart_outlined, 'AMH Level', '${cycle.amh ?? "—"} ng/ml'),
              const Divider(indent: 40),
              _ModernInfoRow(Icons.straighten, 'BMI', '${cycle.bmi ?? "—"}'),
            ],
          ),
        ),

        const GroupingHeader(title: 'Treatment Details'),
        CupertinoCard(
          onTap: () => context.push('/cycle/${cycle.id}/edit/treatment'),
          child: Column(
            children: [
              _ModernInfoRow(Icons.vaccines_outlined, 'Infertility', cycle.infertilityType ?? '—'),
              if (cycle.infertilityType == 'Other') ...[
                const Divider(indent: 40),
                _ModernInfoRow(Icons.edit_note, 'Specify', cycle.otherInfertilityType ?? '—'),
              ],
              const Divider(indent: 40),
              _ModernInfoRow(Icons.list_alt, 'Protocol', cycle.stimProtocol ?? '—'),
            ],
          ),
        ),
      ],
    );
  }
}

class _LabTab extends ConsumerWidget {
  final IvfCycle cycle;
  const _LabTab({required this.cycle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transferAsync = ref.watch(transferProvider(cycle.id));

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      children: [
        const GroupingHeader(title: 'Semen Analysis'),
        CupertinoCard(
          onTap: () => context.push('/cycle/${cycle.id}/edit/semen'),
          child: Column(
            children: [
              _ModernInfoRow(Icons.water_drop_outlined, 'Volume', '${cycle.semenVolume ?? "—"} ml'),
              const Divider(indent: 40),
              _ModernInfoRow(Icons.science_outlined, 'Conc.', '${cycle.spermConc ?? "—"} M/ml'),
              const Divider(indent: 40),
              _ModernInfoRow(Icons.speed, 'Motility', 'FP: ${cycle.motilityFp ?? 0}%, SP: ${cycle.motilitySp ?? 0}%, IM: ${cycle.motilityIm ?? 0}%'),
            ],
          ),
        ),

        const GroupingHeader(title: 'Oocyte Retrieval'),
        CupertinoCard(
          onTap: () => context.push('/cycle/${cycle.id}/edit/retrieval'),
          child: Column(
            children: [
              _ModernInfoRow(Icons.egg_outlined, 'Recovered', '${cycle.occRecovered ?? "—"}'),
              const Divider(indent: 40),
              _ModernInfoRow(Icons.check_circle_outline, 'MII / MI / GV', '${cycle.oocyteMii ?? 0} / ${cycle.oocyteMi ?? 0} / ${cycle.oocyteGv ?? 0}'),
            ],
          ),
        ),

        const GroupingHeader(title: 'Final Outcome'),
        transferAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Text('Error: $e'),
          data: (transfer) => CupertinoCard(
            onTap: () => context.push('/cycle/${cycle.id}/edit/transfer'),
            child: Column(
              children: [
                _ModernInfoRow(Icons.outbox, 'Transferred', '${transfer?.embryosTransferred ?? 0}'),
                const Divider(indent: 40),
                _ModernInfoRow(Icons.ac_unit, 'Frozen', '${transfer?.embryosFrozen ?? 0}'),
                const Divider(indent: 40),
                _ModernInfoRow(Icons.inventory_2_outlined, 'Device', transfer?.cryoDevice ?? '—'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TimelineTab extends ConsumerWidget {
  final IvfCycle cycle;
  const _TimelineTab({required this.cycle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      children: [
        const GroupingHeader(title: 'Developmental Milestones'),
        for (final day in [1, 2, 3, 5])
          _TimelineTile(cycleId: cycle.id, day: day),
      ],
    );
  }
}

class _TimelineTile extends ConsumerWidget {
  final int cycleId;
  final int day;
  const _TimelineTile({required this.cycleId, required this.day});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isRecorded = false;
    if (day == 5) {
      final cycleData = ref.watch(cycleFormProvider(cycleId)).asData?.value;
      final grades = ref.watch(blastocystProvider(cycleId)).asData?.value;
      isRecorded = (cycleData?.totalBlastocysts != null) || (grades != null && grades.isNotEmpty);
    } else {
      final obs = ref.watch(dailyObsProvider((cycleId: cycleId, day: day))).asData?.value;
      isRecorded = obs != null;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: isRecorded ? Border.all(color: Colors.green.withValues(alpha: 0.2)) : null,
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isRecorded ? Colors.green.withValues(alpha: 0.1) : Colors.blue.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text('D$day', style: TextStyle(
              color: isRecorded ? Colors.green[700] : Colors.blue[700],
              fontWeight: FontWeight.bold,
            )),
          ),
        ),
        title: Text('Day $day Observations', style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(isRecorded ? 'Observations recorded' : 'Pending assessment', style: TextStyle(
          color: isRecorded ? Colors.green[700] : Colors.orange[700],
          fontSize: 12,
        )),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () => context.push('/cycle/$cycleId/day/$day'),
      ),
    );
  }
}

class _KpiCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _KpiCard({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: color.withValues(alpha: 0.8), fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class _ModernInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ModernInfoRow(this.icon, this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[400]),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyle(color: Colors.grey[500], fontSize: 11, fontWeight: FontWeight.w500)),
                Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
