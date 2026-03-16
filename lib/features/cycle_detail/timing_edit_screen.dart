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

  @override
  void initState() {
    super.initState();
    final cycle = ref.read(cycleFormProvider(widget.cycleId)).asData?.value;
    if (cycle != null) {
      _date = cycle.oocytePickupDate;
      _pickupTime = cycle.oocytePickupTime;
      _icsiTime = cycle.icsiTime;
    }
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
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Timing')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            title: const Text('Pickup Date'),
            subtitle: Text(_date != null ? DateFormat('dd MMM yyyy').format(_date!) : 'Not set'),
            trailing: const Icon(Icons.calendar_today),
            onTap: _pickDate,
          ),
          ListTile(
            title: const Text('Pickup Time'),
            subtitle: Text(_pickupTime ?? 'Not set'),
            trailing: const Icon(Icons.access_time),
            onTap: () => _pickTime(true),
          ),
          ListTile(
            title: const Text('ICSI Time'),
            subtitle: Text(_icsiTime ?? 'Not set'),
            trailing: const Icon(Icons.access_time),
            onTap: () => _pickTime(false),
          ),
        ],
      ),
    );
  }
}
