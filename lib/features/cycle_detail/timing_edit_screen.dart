import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../data/database/app_database.dart';
import '../cycle_form/cycle_form_notifier.dart';

class TimingEditScreen extends ConsumerStatefulWidget {
  final int cycleId;
  const TimingEditScreen({super.key, required this.cycleId});

  @override
  ConsumerState<TimingEditScreen> createState() => _TimingEditScreenState();
}

class _TimingEditScreenState extends ConsumerState<TimingEditScreen> {
  DateTime? _date;
  String? _pickupTime;
  String? _icsiTime;
  bool _initialized = false;

  void _sync(IvfCycle cycle) {
    if (_initialized) return;
    _date = cycle.oocytePickupDate;
    _pickupTime = cycle.oocytePickupTime;
    _icsiTime = cycle.icsiTime;
    _initialized = true;
  }

  Future<void> _save({bool showFeedback = false}) async {
    await ref.read(cycleFormProvider(widget.cycleId).notifier).save(
      IvfCyclesCompanion(
        oocytePickupDate: Value(_date),
        oocytePickupTime: Value(_pickupTime),
        icsiTime: Value(_icsiTime),
      ),
    );
    if (showFeedback && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Timing updated'), duration: Duration(seconds: 1)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cycleAsync = ref.watch(cycleFormProvider(widget.cycleId));

    // Crucial: Only sync if data is present and we haven't initialized yet
    cycleAsync.whenData((c) {
      if (c != null && !_initialized) {
        setState(() => _sync(c));
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Procedure Timing'),
        actions: [
          TextButton(
            onPressed: () async {
              await _save();
              if (mounted) Navigator.pop(context);
            },
            child: const Text('Done', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: cycleAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (_) => ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _SelectionTile(
              label: 'Pickup Date',
              value: _date != null ? DateFormat('dd MMM yyyy').format(_date!) : 'Select Date',
              icon: Icons.calendar_today,
              onTap: () async {
                final d = await showDatePicker(
                  context: context,
                  initialDate: _date ?? DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (d != null) {
                  setState(() => _date = d);
                  _save();
                }
              },
            ),
            const SizedBox(height: 16),
            _SelectionTile(
              label: 'Pickup Time',
              value: _pickupTime ?? 'Select Time',
              icon: Icons.access_time,
              onTap: () async {
                final t = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                if (t != null) {
                  setState(() => _pickupTime = '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}');
                  _save();
                }
              },
            ),
            const SizedBox(height: 16),
            _SelectionTile(
              label: 'ICSI Time',
              value: _icsiTime ?? 'Select Time',
              icon: Icons.bolt,
              onTap: () async {
                final t = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                if (t != null) {
                  setState(() => _icsiTime = '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}');
                  _save();
                }
              },
            ),
            const SizedBox(height: 40),
            FilledButton(
              onPressed: () => _save(showFeedback: true),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectionTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final VoidCallback onTap;

  const _SelectionTile({required this.label, required this.value, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
        ),
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).primaryColor),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                  const SizedBox(height: 2),
                  Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
