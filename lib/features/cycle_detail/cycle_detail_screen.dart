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
              bottom: const TabBar(
                isScrollable: true,
                tabs: [
                  Tab(text: 'SUMMARY'),
                  Tab(text: 'CLINIC'),
                  Tab(text: 'LABORATORY'),
                  Tab(text: 'TIMELINE'),
                ],
              ),
            ),
            body: Container(
              color: const Color(0xFFF2F2F7),
              child: TabBarView(
                children: [
                  _SummaryTab(cycle: cycle),
                  _ClinicTab(cycle: cycle),
                  _LabTab(cycle: cycle),
                  _TimelineTab(cycle: cycle),
                ],
              ),
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

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24),
      children: [
        const GroupingHeader(title: 'Key Metrics'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _MetricRingCard(label: 'Maturation', value: matRate, color: Colors.blue),
              _MetricRingCard(label: 'Fertilization', value: fertRate, color: Colors.pink),
              _MetricRingCard(label: 'Blastulation', value: blastRate, color: Colors.purple),
            ],
          ),
        ),

        const GroupingHeader(title: 'Patient Details'),
        CupertinoCard(
          onTap: () => context.push('/cycle/${cycle.id}/edit/patient'),
          child: Column(
            children: [
              _ModernRow(Icons.person_2_outlined, 'Wife', '${cycle.wifeName} (${cycle.wifeAge}y)'),
              const Divider(indent: 48),
              _ModernRow(Icons.person_outline, 'Husband', '${cycle.husbandName} (${cycle.husbandAge}y)'),
              if (cycle.cycleIdentifier != null && cycle.cycleIdentifier!.isNotEmpty) ...[
                const Divider(indent: 48),
                _ModernRow(Icons.tag_rounded, 'Reference ID', cycle.cycleIdentifier!),
              ],
            ],
          ),
        ),

        const GroupingHeader(title: 'Schedule'),
        CupertinoCard(
          onTap: () => context.push('/cycle/${cycle.id}/edit/timing'),
          child: Column(
            children: [
              _ModernRow(Icons.calendar_month_outlined, 'OPU Date', cycle.oocytePickupDate != null ? DateFormat('EEEE, dd MMM').format(cycle.oocytePickupDate!) : 'Not scheduled'),
              const Divider(indent: 48),
              _ModernRow(Icons.alarm_on_rounded, 'OPU Time', cycle.oocytePickupTime ?? 'Not set'),
              const Divider(indent: 48),
              _ModernRow(Icons.bolt_outlined, 'ICSI Time', cycle.icsiTime ?? 'Not set'),
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
      padding: const EdgeInsets.symmetric(vertical: 24),
      children: [
        const GroupingHeader(title: 'Clinical Data'),
        CupertinoCard(
          onTap: () => context.push('/cycle/${cycle.id}/edit/clinical'),
          child: Column(
            children: [
              _ModernRow(Icons.monitor_heart_outlined, 'AMH Level', '${cycle.amh ?? "—"} ng/ml'),
              const Divider(indent: 48),
              _ModernRow(Icons.straighten_rounded, 'Patient BMI', '${cycle.bmi ?? "—"}'),
            ],
          ),
        ),

        const GroupingHeader(title: 'Treatment Protocol'),
        CupertinoCard(
          onTap: () => context.push('/cycle/${cycle.id}/edit/treatment'),
          child: Column(
            children: [
              _ModernRow(Icons.science_outlined, 'Fertility Type', cycle.infertilityType ?? 'Unspecified'),
              if (cycle.infertilityType == 'Other') ...[
                const Divider(indent: 48),
                _ModernRow(Icons.edit_note_rounded, 'Specifics', cycle.otherInfertilityType ?? '—'),
              ],
              const Divider(indent: 48),
              _ModernRow(Icons.checklist_rtl_rounded, 'Stimulation', cycle.stimProtocol ?? 'Standard'),
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
      padding: const EdgeInsets.symmetric(vertical: 24),
      children: [
        const GroupingHeader(title: 'Semen Profile'),
        CupertinoCard(
          onTap: () => context.push('/cycle/${cycle.id}/edit/semen'),
          child: Column(
            children: [
              _ModernRow(Icons.water_drop_outlined, 'Sample Volume', '${cycle.semenVolume ?? "—"} ml'),
              const Divider(indent: 48),
              _ModernRow(Icons.biotech_outlined, 'Concentration', '${cycle.spermConc ?? "—"} M/ml'),
              const Divider(indent: 48),
              _ModernRow(Icons.auto_graph_rounded, 'Motility', 'FP: ${cycle.motilityFp ?? 0}%, SP: ${cycle.motilitySp ?? 0}%, IM: ${cycle.motilityIm ?? 0}%'),
            ],
          ),
        ),

        const GroupingHeader(title: 'Oocyte Recovery'),
        CupertinoCard(
          onTap: () => context.push('/cycle/${cycle.id}/edit/retrieval'),
          child: Column(
            children: [
              _ModernRow(Icons.egg_alt_outlined, 'OCC Recovered', '${cycle.occRecovered ?? "—"}'),
              const Divider(indent: 48),
              _ModernRow(Icons.verified_outlined, 'Oocyte Status', 'MII: ${cycle.oocyteMii ?? 0} · MI: ${cycle.oocyteMi ?? 0} · GV: ${cycle.oocyteGv ?? 0}'),
            ],
          ),
        ),

        const GroupingHeader(title: 'Cryopreservation'),
        transferAsync.when(
          loading: () => const Center(child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator())),
          error: (e, _) => Text('Error: $e'),
          data: (transfer) => CupertinoCard(
            onTap: () => context.push('/cycle/${cycle.id}/edit/transfer'),
            child: Column(
              children: [
                _ModernRow(Icons.ios_share_rounded, 'Embryos Transferred', '${transfer?.embryosTransferred ?? 0}'),
                const Divider(indent: 48),
                _ModernRow(Icons.ac_unit_rounded, 'Embryos Frozen', '${transfer?.embryosFrozen ?? 0}'),
                const Divider(indent: 48),
                _ModernRow(Icons.inventory_2_outlined, 'Storage Device', transfer?.cryoDevice ?? 'Not set'),
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
      padding: const EdgeInsets.symmetric(vertical: 24),
      children: [
        const GroupingHeader(title: 'Culture Timeline'),
        for (final day in [1, 2, 3, 5])
          _TimelineNode(cycleId: cycle.id, day: day),
      ],
    );
  }
}

class _TimelineNode extends ConsumerWidget {
  final int cycleId;
  final int day;
  const _TimelineNode({required this.cycleId, required this.day});

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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isRecorded ? Colors.green[500] : Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4))
                  ],
                ),
                child: Center(
                  child: Text('D$day', style: TextStyle(
                    color: isRecorded ? Colors.white : Colors.blue[700],
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  )),
                ),
              ),
              if (day != 5) Container(width: 2, height: 40, color: Colors.grey[300]),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: InkWell(
              onTap: () => context.push('/cycle/$cycleId/day/$day'),
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10, offset: const Offset(0, 4))
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Day $day Development', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                          const SizedBox(height: 4),
                          Text(isRecorded ? 'Assessment Completed' : 'Pending Observation', style: TextStyle(
                            color: isRecorded ? Colors.green[600] : Colors.orange[700],
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          )),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Colors.grey[300]),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricRingCard extends StatelessWidget {
  final String label;
  final double? value;
  final Color color;

  const _MetricRingCard({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    final pct = NumberFormat.percentPattern()..maximumFractionDigits = 0;

    return Container(
      width: 120,
      height: 140,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.1), blurRadius: 20, offset: const Offset(0, 10))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  value: value ?? 0,
                  backgroundColor: color.withValues(alpha: 0.1),
                  color: color,
                  strokeWidth: 6,
                  strokeCap: StrokeCap.round,
                ),
              ),
              Text(value != null ? pct.format(value) : '—', style: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              )),
            ],
          ),
          const SizedBox(height: 12),
          Text(label, style: TextStyle(
            color: Colors.grey[600],
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          )),
        ],
      ),
    );
  }
}

class _ModernRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ModernRow(this.icon, this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.grey.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, size: 20, color: Colors.blueGrey[400]),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyle(color: Colors.grey[500], fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.3)),
                const SizedBox(height: 2),
                Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black87)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
