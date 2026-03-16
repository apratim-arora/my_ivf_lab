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
import '../../shared/widgets/metrics_card.dart';

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
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              title: Text('${cycle.wifeName} / ${cycle.husbandName}'),
              bottom: const TabBar(
                isScrollable: true,
                tabs: [
                  Tab(text: 'Summary', icon: Icon(Icons.summarize_outlined)),
                  Tab(text: 'Clinic', icon: Icon(Icons.medical_services_outlined)),
                  Tab(text: 'Lab', icon: Icon(Icons.biotech_outlined)),
                  Tab(text: 'Observations', icon: Icon(Icons.visibility_outlined)),
                  Tab(text: 'Analysis', icon: Icon(Icons.analytics_outlined)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                _SummaryTab(cycle: cycle),
                _ClinicTab(cycle: cycle),
                _LabTab(cycle: cycle),
                _ObservationsTab(cycle: cycle),
                _AnalysisTab(cycle: cycle),
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

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        MetricsCard(
          maturationRate: matRate,
          fertilizationRate: fertRate,
          blastulationRate: blastRate,
        ),
        const SizedBox(height: 16),
        _DetailCard(
          title: 'Patient Identification',
          onEdit: () => context.push('/cycle/${cycle.id}/edit/patient'),
          children: [
            _InfoRow('Wife', '${cycle.wifeName} (${cycle.wifeAge}y)'),
            _InfoRow('Husband', '${cycle.husbandName} (${cycle.husbandAge}y)'),
            if (cycle.cycleIdentifier != null) _InfoRow('Identifier', cycle.cycleIdentifier!),
          ],
        ),
        _DetailCard(
          title: 'Timing',
          onEdit: () => context.push('/cycle/${cycle.id}/edit/timing'),
          children: [
            _InfoRow('Pickup', cycle.oocytePickupDate != null ? DateFormat('dd MMM yyyy').format(cycle.oocytePickupDate!) : 'Not set'),
            _InfoRow('Pickup Time', cycle.oocytePickupTime ?? 'Not set'),
            _InfoRow('ICSI Time', cycle.icsiTime ?? 'Not set'),
          ],
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
      padding: const EdgeInsets.all(16),
      children: [
        _DetailCard(
          title: 'Female Clinical Parameters',
          onEdit: () => context.push('/cycle/${cycle.id}/edit/clinical'),
          children: [
            _InfoRow('AMH', '${cycle.amh ?? "—"} ng/ml'),
            _InfoRow('BMI', '${cycle.bmi ?? "—"}'),
          ],
        ),
        _DetailCard(
          title: 'Fertility & Treatment',
          onEdit: () => context.push('/cycle/${cycle.id}/edit/treatment'),
          children: [
            _InfoRow('Infertility Type', cycle.infertilityType ?? '—'),
            if (cycle.infertilityType == 'Other') _InfoRow('Custom Type', cycle.otherInfertilityType ?? '—'),
            _InfoRow('Stimulation Protocol', cycle.stimProtocol ?? '—'),
          ],
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
      padding: const EdgeInsets.all(16),
      children: [
        _DetailCard(
          title: 'Semen Analysis',
          onEdit: () => context.push('/cycle/${cycle.id}/edit/semen'),
          children: [
            _InfoRow('Volume', '${cycle.semenVolume ?? "—"} ml'),
            _InfoRow('Concentration', '${cycle.spermConc ?? "—"} M/ml'),
            _InfoRow('Motility', 'FP: ${cycle.motilityFp ?? "0"}%, SP: ${cycle.motilitySp ?? "0"}%, IM: ${cycle.motilityIm ?? "0"}%'),
          ],
        ),
        _DetailCard(
          title: 'Oocyte Retrieval',
          onEdit: () => context.push('/cycle/${cycle.id}/edit/retrieval'),
          children: [
            _InfoRow('OCC Recovered', '${cycle.occRecovered ?? "—"}'),
            _InfoRow('MII / MI / GV', '${cycle.oocyteMii ?? 0} / ${cycle.oocyteMi ?? 0} / ${cycle.oocyteGv ?? 0}'),
          ],
        ),
        transferAsync.when(
          loading: () => const SizedBox.shrink(),
          error: (e, _) => Text('Error: $e'),
          data: (transfer) => _DetailCard(
            title: 'Transfer & Freezing',
            onEdit: () => context.push('/cycle/${cycle.id}/edit/transfer'),
            children: [
              _InfoRow('Transferred', '${transfer?.embryosTransferred ?? 0}'),
              _InfoRow('Frozen', '${transfer?.embryosFrozen ?? 0}'),
              _InfoRow('Device', transfer?.cryoDevice ?? '—'),
              if (transfer?.transferDate != null) _InfoRow('Date', DateFormat('dd MMM yyyy').format(transfer!.transferDate!)),
            ],
          ),
        ),
      ],
    );
  }
}

class _AnalysisTab extends ConsumerWidget {
  final IvfCycle cycle;
  const _AnalysisTab({required this.cycle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matRate = ref.watch(maturationRateProvider(cycle.id));
    final fertRate = ref.watch(fertilizationRateProvider(cycle.id));
    final blastRate = ref.watch(blastulationRateProvider(cycle.id));

    final pct = NumberFormat.percentPattern()..maximumFractionDigits = 1;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Cycle KPIs', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        _KpiTile(
          label: 'Maturation Rate',
          value: matRate != null ? pct.format(matRate) : 'N/A',
          description: 'MII Oocytes / OCC Recovered',
          icon: Icons.egg_outlined,
          color: Colors.blue,
        ),
        _KpiTile(
          label: 'Fertilization Rate',
          value: fertRate != null ? pct.format(fertRate) : 'N/A',
          description: '2PN Embryos / MII Oocytes',
          icon: Icons.favorite_border,
          color: Colors.pink,
        ),
        _KpiTile(
          label: 'Blastulation Rate',
          value: blastRate != null ? pct.format(blastRate) : 'N/A',
          description: 'Total Blastocysts / 2PN Embryos',
          icon: Icons.bubble_chart_outlined,
          color: Colors.purple,
        ),
      ],
    );
  }
}

class _KpiTile extends StatelessWidget {
  final String label;
  final String value;
  final String description;
  final IconData icon;
  final Color color;

  const _KpiTile({
    required this.label,
    required this.value,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: color, size: 32),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Text(value, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class _ObservationsTab extends ConsumerWidget {
  final IvfCycle cycle;
  const _ObservationsTab({required this.cycle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        for (final day in [1, 2, 3, 5])
          _ObsTile(cycleId: cycle.id, day: day),
      ],
    );
  }
}

class _ObsTile extends ConsumerWidget {
  final int cycleId;
  final int day;
  const _ObsTile({required this.cycleId, required this.day});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isRecorded = false;
    if (day == 5) {
      final cycleData = ref.watch(cycleFormProvider(cycleId)).asData?.value;
      final grades = ref.watch(blastocystProvider(cycleId)).asData?.value;
      isRecorded = (cycleData?.totalBlastocysts != null) ||
          (grades != null && grades.isNotEmpty);
    } else {
      final obs = ref
          .watch(dailyObsProvider((cycleId: cycleId, day: day)))
          .asData
          ?.value;
      isRecorded = obs != null;
    }

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isRecorded ? Colors.green[100] : null,
          child: Text('D$day', style: TextStyle(color: isRecorded ? Colors.green[900] : null)),
        ),
        title: Text('Day $day Observations'),
        subtitle: Text(isRecorded ? 'Data recorded' : 'Pending'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => context.push('/cycle/$cycleId/day/$day'),
      ),
    );
  }
}

class _DetailCard extends StatelessWidget {
  final String title;
  final VoidCallback onEdit;
  final List<Widget> children;

  const _DetailCard({
    required this.title,
    required this.onEdit,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                IconButton(onPressed: onEdit, icon: const Icon(Icons.edit_outlined, size: 20)),
              ],
            ),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(label, style: Theme.of(context).textTheme.bodySmall)),
          Expanded(flex: 3, child: Text(value, style: Theme.of(context).textTheme.bodyMedium)),
        ],
      ),
    );
  }
}
