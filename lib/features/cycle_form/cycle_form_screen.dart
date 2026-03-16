import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database/app_database.dart';
import '../../shared/widgets/section_card.dart';
import '../../shared/widgets/labeled_field.dart';
import '../../shared/widgets/metrics_card.dart';
import 'cycle_form_notifier.dart';
import 'metrics_providers.dart';
import '../daily_observation/blastocyst/blastocyst_notifier.dart';
import '../transfer/transfer_notifier.dart';

class CycleFormScreen extends ConsumerStatefulWidget {
  final int? cycleId;
  const CycleFormScreen({super.key, required this.cycleId});

  @override
  ConsumerState<CycleFormScreen> createState() => _CycleFormScreenState();
}

class _CycleFormScreenState extends ConsumerState<CycleFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Patient controllers
  final _husbandName = TextEditingController();
  final _wifeName = TextEditingController();
  final _husbandAge = TextEditingController();
  final _wifeAge = TextEditingController();
  final _cycleIdentifier = TextEditingController();

  bool _patientSaved = false;
  int? _activeCycleId;

  @override
  void initState() {
    super.initState();
    _activeCycleId = widget.cycleId;
  }

  @override
  void dispose() {
    for (final c in [
      _husbandName,
      _wifeName,
      _husbandAge,
      _wifeAge,
      _cycleIdentifier,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _savePatient() async {
    if (!_formKey.currentState!.validate()) return;
    if (_activeCycleId != null) return; // already created

    final notifier = ref.read(cycleFormProvider(_activeCycleId).notifier);
    final id = await notifier.createCycle(
      husbandName: _husbandName.text.trim(),
      wifeName: _wifeName.text.trim(),
      husbandAge: int.parse(_husbandAge.text),
      wifeAge: int.parse(_wifeAge.text),
    );

    if (_cycleIdentifier.text.isNotEmpty) {
      await notifier.save(
        IvfCyclesCompanion(cycleIdentifier: Value(_cycleIdentifier.text.trim())),
      );
    }

    setState(() {
      _activeCycleId = id;
      _patientSaved = true;
    });
    // Replace route so back button goes to list, not "new"
    if (mounted) context.replace('/cycle/$id');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_activeCycleId == null ? 'New cycle' : 'Cycle record'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            // ── Patient identifiers ──────────────────────────────────────
            SectionCard(
              title: 'Patient details',
              icon: Icons.people_outline,
              initiallyExpanded: true,
              isComplete: _patientSaved || _activeCycleId != null,
              children: [
                LabeledField(
                  label: 'Wife name',
                  initialValue: _wifeName.text,
                  onChanged: (v) => _wifeName.text = v,
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Required' : null,
                ),
                LabeledField(
                  label: 'Cycle Identifier',
                  initialValue: _cycleIdentifier.text,
                  onChanged: (v) => _cycleIdentifier.text = v,
                ),
                LabeledField(
                  label: 'Husband name',
                  initialValue: _husbandName.text,
                  onChanged: (v) => _husbandName.text = v,
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Required' : null,
                ),
                Row(
                  children: [
                    Expanded(
                      child: LabeledField(
                        label: 'Wife age',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        initialValue: _wifeAge.text,
                        onChanged: (v) => _wifeAge.text = v,
                        validator: (v) =>
                            (v == null || v.isEmpty) ? 'Required' : null,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: LabeledField(
                        label: 'Husband age',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        initialValue: _husbandAge.text,
                        onChanged: (v) => _husbandAge.text = v,
                        validator: (v) =>
                            (v == null || v.isEmpty) ? 'Required' : null,
                      ),
                    ),
                  ],
                ),
                if (_activeCycleId == null) ...[
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: _savePatient,
                    child: const Text('Save & continue'),
                  ),
                ],
              ],
            ),

            // Only render remaining sections once cycle exists
            if (_activeCycleId != null) ...[
              // ── Metrics banner ────────────────────────────────────────
              _MetricsBanner(cycleId: _activeCycleId!),

              // ── Clinical parameters ───────────────────────────────────
              _ClinicalSection(cycleId: _activeCycleId!),

              // ── Semen analysis ────────────────────────────────────────
              _SemenSection(cycleId: _activeCycleId!),

              // ── Procedure timing ──────────────────────────────────────
              _TimingSection(cycleId: _activeCycleId!),

              // ── Oocyte retrieval ──────────────────────────────────────
              _OocyteSection(cycleId: _activeCycleId!),

              // ── Quick day links ───────────────────────────────────────
              _DayLinksSection(cycleId: _activeCycleId!),

              // ── Blastocyst grading ────────────────────────────────────
              _BlastSection(cycleId: _activeCycleId!),

              // ── Transfer & freezing ───────────────────────────────────
              _TransferSection(cycleId: _activeCycleId!),

              const SizedBox(height: 40),
            ],
          ],
        ),
      ),
    );
  }
}

class _MetricsBanner extends ConsumerWidget {
  final int cycleId;
  const _MetricsBanner({required this.cycleId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matRate = ref.watch(maturationRateProvider(cycleId));
    final fertRate = ref.watch(fertilizationRateProvider(cycleId));
    final blastRate = ref.watch(blastulationRateProvider(cycleId));

    return MetricsCard(
      maturationRate: matRate,
      fertilizationRate: fertRate,
      blastulationRate: blastRate,
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Sub-sections (each autosaves on field change)
// ─────────────────────────────────────────────────────────────────────────────

class _ClinicalSection extends ConsumerWidget {
  final int cycleId;
  const _ClinicalSection({required this.cycleId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cycleAsync = ref.watch(cycleFormProvider(cycleId));
    final cycle = cycleAsync.asData?.value;
    final notifier = ref.read(cycleFormProvider(cycleId).notifier);

    return SectionCard(
      title: 'Clinical parameters',
      icon: Icons.monitor_heart_outlined,
      isComplete: cycle?.amh != null || cycle?.bmi != null,
      children: [
        LabeledField(
          label: 'AMH (ng/ml)',
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          initialValue: cycle?.amh?.toString(),
          onChanged: (v) =>
              notifier.save(IvfCyclesCompanion(amh: Value(double.tryParse(v)))),
        ),
        LabeledField(
          label: 'BMI',
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          initialValue: cycle?.bmi?.toString(),
          onChanged: (v) =>
              notifier.save(IvfCyclesCompanion(bmi: Value(double.tryParse(v)))),
        ),
        const SizedBox(height: 12),
        _InfertilityDropdown(cycleId: cycleId),
        if (cycle?.infertilityType == 'Other')
          LabeledField(
            label: 'Specify infertility type',
            initialValue: cycle?.otherInfertilityType,
            onChanged:
                (v) => notifier.save(
                  IvfCyclesCompanion(
                    otherInfertilityType: Value(v.isEmpty ? null : v),
                  ),
                ),
          ),
        LabeledField(
          label: 'Stimulation protocol',
          initialValue: cycle?.stimProtocol,
          onChanged: (v) => notifier.save(
            IvfCyclesCompanion(stimProtocol: Value(v.isEmpty ? null : v)),
          ),
        ),
      ],
    );
  }
}

class _InfertilityDropdown extends ConsumerWidget {
  final int cycleId;
  const _InfertilityDropdown({required this.cycleId});

  static const _options = [
    'Primary infertility',
    'Secondary infertility',
    'Donor cycle',
    'Freeze-all cycle',
    'Other',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cycleAsync = ref.watch(cycleFormProvider(cycleId));
    final cycle = cycleAsync.asData?.value;
    final notifier = ref.read(cycleFormProvider(cycleId).notifier);

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          labelText: 'Infertility type',
          border: OutlineInputBorder(),
          isDense: true,
        ),
        initialValue: _options.contains(cycle?.infertilityType)
            ? cycle!.infertilityType
            : null,
        items: _options
            .map((o) => DropdownMenuItem(value: o, child: Text(o)))
            .toList(),
        onChanged: (v) =>
            notifier.save(IvfCyclesCompanion(infertilityType: Value(v))),
      ),
    );
  }
}

class _SemenSection extends ConsumerWidget {
  final int cycleId;
  const _SemenSection({required this.cycleId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cycleAsync = ref.watch(cycleFormProvider(cycleId));
    final cycle = cycleAsync.asData?.value;
    final notifier = ref.read(cycleFormProvider(cycleId).notifier);
    final isComplete = cycle?.semenVolume != null || cycle?.spermConc != null;

    return SectionCard(
      title: 'Semen analysis',
      icon: Icons.science_outlined,
      isComplete: isComplete,
      children: [
        Row(
          children: [
            Expanded(
              child: LabeledField(
                label: 'Volume (ml)',
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                initialValue: cycle?.semenVolume?.toString(),
                onChanged: (v) => notifier.save(
                  IvfCyclesCompanion(semenVolume: Value(double.tryParse(v))),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: LabeledField(
                label: 'Conc. (M/ml)',
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                initialValue: cycle?.spermConc?.toString(),
                onChanged: (v) => notifier.save(
                  IvfCyclesCompanion(spermConc: Value(double.tryParse(v))),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text('Motility (%)', style: Theme.of(context).textTheme.bodySmall),
        Row(
          children: [
            Expanded(
              child: LabeledField(
                label: 'FP',
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                initialValue: cycle?.motilityFp?.toString(),
                onChanged: (v) => notifier.save(
                  IvfCyclesCompanion(motilityFp: Value(double.tryParse(v))),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: LabeledField(
                label: 'SP',
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                initialValue: cycle?.motilitySp?.toString(),
                onChanged: (v) => notifier.save(
                  IvfCyclesCompanion(motilitySp: Value(double.tryParse(v))),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: LabeledField(
                label: 'Immotile',
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                initialValue: cycle?.motilityIm?.toString(),
                onChanged: (v) => notifier.save(
                  IvfCyclesCompanion(motilityIm: Value(double.tryParse(v))),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TimingSection extends ConsumerWidget {
  final int cycleId;
  const _TimingSection({required this.cycleId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cycleAsync = ref.watch(cycleFormProvider(cycleId));
    final cycle = cycleAsync.asData?.value;
    final notifier = ref.read(cycleFormProvider(cycleId).notifier);

    Future<void> pickDate() async {
      final d = await showDatePicker(
        context: context,
        initialDate: cycle?.oocytePickupDate ?? DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now().add(const Duration(days: 30)),
      );
      if (d != null) {
        notifier.save(IvfCyclesCompanion(oocytePickupDate: Value(d)));
      }
    }

    Future<void> pickTime(String field) async {
      final t = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (t != null) {
        final formatted =
            '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';
        if (field == 'pickup') {
          notifier.save(IvfCyclesCompanion(oocytePickupTime: Value(formatted)));
        } else {
          notifier.save(IvfCyclesCompanion(icsiTime: Value(formatted)));
        }
      }
    }

    return SectionCard(
      title: 'Procedure timing',
      icon: Icons.schedule_outlined,
      isComplete: cycle?.oocytePickupDate != null,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Pickup date'),
          subtitle: Text(
            cycle?.oocytePickupDate != null
                ? '${cycle!.oocytePickupDate!.day}/${cycle.oocytePickupDate!.month}/${cycle.oocytePickupDate!.year}'
                : 'Not set',
          ),
          trailing: const Icon(Icons.calendar_today_outlined),
          onTap: pickDate,
        ),
        Row(
          children: [
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Pickup time'),
                subtitle: Text(cycle?.oocytePickupTime ?? 'Not set'),
                trailing: const Icon(Icons.access_time),
                onTap: () => pickTime('pickup'),
              ),
            ),
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('ICSI time'),
                subtitle: Text(cycle?.icsiTime ?? 'Not set'),
                trailing: const Icon(Icons.access_time),
                onTap: () => pickTime('icsi'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _OocyteSection extends ConsumerWidget {
  final int cycleId;
  const _OocyteSection({required this.cycleId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cycleAsync = ref.watch(cycleFormProvider(cycleId));
    final cycle = cycleAsync.asData?.value;
    final notifier = ref.read(cycleFormProvider(cycleId).notifier);
    final isComplete = cycle?.occRecovered != null;

    final mii = cycle?.oocyteMii ?? 0;
    final mi = cycle?.oocyteMi ?? 0;
    final gv = cycle?.oocyteGv ?? 0;
    final occ = cycle?.occRecovered ?? 0;
    final showWarning = (mii + mi + gv) > occ;

    return SectionCard(
      title: 'Oocyte retrieval',
      icon: Icons.egg_outlined,
      isComplete: isComplete,
      children: [
        Row(
          children: [
            Expanded(
              child: LabeledField(
                label: 'OCC recovered',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                initialValue: cycle?.occRecovered?.toString(),
                onChanged:
                    (v) => notifier.save(
                      IvfCyclesCompanion(occRecovered: Value(int.tryParse(v))),
                    ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: LabeledField(
                label: 'MII',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                initialValue: cycle?.oocyteMii?.toString(),
                onChanged:
                    (v) => notifier.save(
                      IvfCyclesCompanion(oocyteMii: Value(int.tryParse(v))),
                    ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: LabeledField(
                label: 'MI',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                initialValue: cycle?.oocyteMi?.toString(),
                onChanged:
                    (v) => notifier.save(
                      IvfCyclesCompanion(oocyteMi: Value(int.tryParse(v))),
                    ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: LabeledField(
                label: 'GV',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                initialValue: cycle?.oocyteGv?.toString(),
                onChanged:
                    (v) => notifier.save(
                      IvfCyclesCompanion(oocyteGv: Value(int.tryParse(v))),
                    ),
              ),
            ),
          ],
        ),
        if (showWarning)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Icon(Icons.warning_amber_rounded, color: Colors.orange[700], size: 16),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    'Warning: Sum of MII+MI+GV (${mii + mi + gv}) exceeds OCC recovered ($occ)',
                    style: TextStyle(color: Colors.orange[700], fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _DayLinksSection extends StatelessWidget {
  final int cycleId;
  const _DayLinksSection({required this.cycleId});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Daily observations',
      icon: Icons.calendar_month_outlined,
      initiallyExpanded: true,
      children: [
        for (final day in [1, 2, 3, 5]) ...[
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 16,
              child: Text('D$day', style: const TextStyle(fontSize: 11)),
            ),
            title: Text('Day $day observations'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => context.push('/cycle/$cycleId/day/$day'),
          ),
        ],
      ],
    );
  }
}

class _BlastSection extends ConsumerWidget {
  final int cycleId;
  const _BlastSection({required this.cycleId});

  static const _grades = [
    '3AA',
    '4AA',
    '5AA',
    '3AB',
    '4AB',
    '3BB',
    '4BB',
    'other',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cycleAsync = ref.watch(cycleFormProvider(cycleId));
    final cycle = cycleAsync.asData?.value;
    final notifier = ref.read(cycleFormProvider(cycleId).notifier);
    final gradesAsync = ref.watch(blastocystProvider(cycleId));
    final editor = ref.read(blastocystEditorProvider(cycleId).notifier);

    return SectionCard(
      title: 'Blastocyst grading (Day 5)',
      icon: Icons.bubble_chart_outlined,
      isComplete:
          (cycle?.totalBlastocysts != null) ||
          (gradesAsync.asData?.value.isNotEmpty ?? false),
      children: [
        LabeledField(
          label: 'Total Blastocysts (Option B)',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          initialValue: cycle?.totalBlastocysts?.toString(),
          onChanged:
              (v) => notifier.save(
                IvfCyclesCompanion(totalBlastocysts: Value(int.tryParse(v))),
              ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Divider(),
        ),
        Text(
          'Individual Grades (Option A)',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 8),
        gradesAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Text('Error: $e'),
          data: (grades) {
            final gradeMap = {for (final g in grades) g.grade: g.count};
            return _GradeEditor(
              initialValues: gradeMap,
              grades: _grades,
              onSave: (map) => editor.saveGrades(map),
            );
          },
        ),
      ],
    );
  }
}

class _GradeEditor extends StatefulWidget {
  final Map<String, int> initialValues;
  final List<String> grades;
  final void Function(Map<String, int>) onSave;

  const _GradeEditor({
    required this.initialValues,
    required this.grades,
    required this.onSave,
  });

  @override
  State<_GradeEditor> createState() => _GradeEditorState();
}

class _GradeEditorState extends State<_GradeEditor> {
  late Map<String, TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = {
      for (final g in widget.grades)
        g: TextEditingController(
          text: (widget.initialValues[g] ?? 0).toString(),
        ),
    };
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  void _save() {
    final map = <String, int>{
      for (final e in _controllers.entries)
        if ((int.tryParse(e.value.text) ?? 0) > 0)
          e.key: int.parse(e.value.text),
    };
    widget.onSave(map);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: widget.grades.map((g) {
            return SizedBox(
              width: 80,
              child: TextField(
                controller: _controllers[g],
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: g,
                  border: const OutlineInputBorder(),
                  isDense: true,
                ),
                onChanged: (_) {
                  _save();
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _TransferSection extends ConsumerWidget {
  final int cycleId;
  const _TransferSection({required this.cycleId});

  static const _cryoOptions = ['Cryotop', 'Cryolock', 'Straw', 'Other'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transferAsync = ref.watch(transferProvider(cycleId));
    final editor = ref.read(transferEditorProvider(cycleId).notifier);

    return SectionCard(
      title: 'Transfer & freezing',
      icon: Icons.ac_unit_outlined,
      isComplete: transferAsync.asData?.value != null,
      children: [
        transferAsync.when(
          loading: () => const SizedBox.shrink(),
          error: (e, _) => Text('Error: $e'),
          data: (transfer) => Column(
            children: [
              LabeledField(
                label: 'Embryos transferred',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                initialValue: transfer?.embryosTransferred?.toString(),
                onChanged: (v) =>
                    editor.save(embryosTransferred: int.tryParse(v)),
              ),
              LabeledField(
                label: 'Embryos frozen',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                initialValue: transfer?.embryosFrozen?.toString(),
                onChanged: (v) => editor.save(embryosFrozen: int.tryParse(v)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Cryopreservation device',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  initialValue: _cryoOptions.contains(transfer?.cryoDevice)
                      ? transfer!.cryoDevice
                      : null,
                  items: _cryoOptions
                      .map((o) => DropdownMenuItem(value: o, child: Text(o)))
                      .toList(),
                  onChanged: (v) => editor.save(cryoDevice: v),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
