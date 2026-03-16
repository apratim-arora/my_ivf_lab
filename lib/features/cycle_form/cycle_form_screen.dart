import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'cycle_form_notifier.dart';
import '../../shared/widgets/labeled_field.dart';

class CycleFormScreen extends ConsumerStatefulWidget {
  final int? cycleId;
  const CycleFormScreen({super.key, required this.cycleId});

  @override
  ConsumerState<CycleFormScreen> createState() => _CycleFormScreenState();
}

class _CycleFormScreenState extends ConsumerState<CycleFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _husbandName = TextEditingController();
  final _wifeName = TextEditingController();
  final _husbandAge = TextEditingController();
  final _wifeAge = TextEditingController();

  @override
  void dispose() {
    _husbandName.dispose();
    _wifeName.dispose();
    _husbandAge.dispose();
    _wifeAge.dispose();
    super.dispose();
  }

  Future<void> _create() async {
    if (!_formKey.currentState!.validate()) return;

    final notifier = ref.read(cycleFormProvider(null).notifier);
    final id = await notifier.createCycle(
      husbandName: _husbandName.text.trim(),
      wifeName: _wifeName.text.trim(),
      husbandAge: int.parse(_husbandAge.text),
      wifeAge: int.parse(_wifeAge.text),
    );

    if (mounted) {
      context.replace('/cycle/$id');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New IVF Cycle'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              'Enter mandatory patient details to start a new cycle.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            LabeledField(
              label: 'Wife Name',
              controller: _wifeName,
              onChanged: (_) {},
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
            ),
            LabeledField(
              label: 'Husband Name',
              controller: _husbandName,
              onChanged: (_) {},
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: LabeledField(
                    label: 'Wife Age',
                    controller: _wifeAge,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (_) {},
                    validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: LabeledField(
                    label: 'Husband Age',
                    controller: _husbandAge,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (_) {},
                    validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            FilledButton.icon(
              onPressed: _create,
              icon: const Icon(Icons.add),
              label: const Text('Create Cycle Record'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
