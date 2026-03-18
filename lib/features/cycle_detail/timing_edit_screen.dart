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

  void _save() {
    ref.read(cycleFormProvider(widget.cycleId).notifier).save(
      IvfCyclesCompanion(
        oocytePickupDate: Value(_date),
        oocytePickupTime: Value(_pickupTime),
        icsiTime: Value(_icsiTime),
      ),
    );
  }

  Future<void> _pickDate() async {
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
  }

  Future<void> _pickTime(bool isPickup) async {
    final t = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (t != null) {
      final formatted = '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';
      setState(() {
        if (isPickup) {
          _pickupTime = formatted;
        } else {
          _icsiTime = formatted;
        }
      });
      _save();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cycleAsync = ref.watch(cycleFormProvider(widget.cycleId));
    cycleAsync.whenData((c) { if (c != null) _sync(c); });

    return Scaffold(
      appBar: AppBar(title: const Text('Timing')),
      body: cycleAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (_) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ListTile(
              title: const Text('Pickup Date'),
              subtitle: Text(_date != null ? DateFormat('dd MMM yyyy').format(_date!) : 'Not set'),
              trailing: const Icon(Icons.calendar_today),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              tileColor: Colors.white,
              onTap: _pickDate,
            ),
            const SizedBox(height: 12),
            ListTile(
              title: const Text('Pickup Time'),
              subtitle: Text(_pickupTime ?? 'Not set'),
              trailing: const Icon(Icons.access_time),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              tileColor: Colors.white,
              onTap: () => _pickTime(true),
            ),
            const SizedBox(height: 12),
            ListTile(
              title: const Text('ICSI Time'),
              subtitle: Text(_icsiTime ?? 'Not set'),
              trailing: const Icon(Icons.access_time),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              tileColor: Colors.white,
              onTap: () => _pickTime(false),
            ),
          ],
        ),
      ),
    );
  }
}
