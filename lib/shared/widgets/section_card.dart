import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isComplete;
  final List<Widget> children;
  final bool initiallyExpanded;

  const SectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
    this.isComplete = false,
    this.initiallyExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ExpansionTile(
        initiallyExpanded: initiallyExpanded,
        leading: Icon(
          icon,
          color: isComplete ? cs.primary : cs.onSurfaceVariant,
        ),
        title: Text(title),
        trailing: isComplete
            ? Icon(Icons.check_circle_rounded, color: cs.primary, size: 20)
            : const Icon(Icons.expand_more),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
