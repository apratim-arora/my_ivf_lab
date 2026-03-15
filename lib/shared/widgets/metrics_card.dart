import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MetricsCard extends StatelessWidget {
  final double? maturationRate;
  final double? fertilizationRate;
  final double? blastulationRate;

  const MetricsCard({
    super.key,
    this.maturationRate,
    this.fertilizationRate,
    this.blastulationRate,
  });

  @override
  Widget build(BuildContext context) {
    if (maturationRate == null &&
        fertilizationRate == null &&
        blastulationRate == null)
      return const SizedBox.shrink();

    final pct = NumberFormat.percentPattern()..maximumFractionDigits = 1;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lab metrics',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _Metric(
                  label: 'Maturation',
                  value: maturationRate != null
                      ? pct.format(maturationRate)
                      : '—',
                ),
                _Metric(
                  label: 'Fertilization',
                  value: fertilizationRate != null
                      ? pct.format(fertilizationRate)
                      : '—',
                ),
                _Metric(
                  label: 'Blastulation',
                  value: blastulationRate != null
                      ? pct.format(blastulationRate)
                      : '—',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  final String label;
  final String value;
  const _Metric({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: cs.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: cs.onPrimaryContainer),
          ),
        ],
      ),
    );
  }
}
