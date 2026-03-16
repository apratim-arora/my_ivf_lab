import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../data/database/app_database.dart';
import 'cycle_list_providers.dart';

class CycleListScreen extends ConsumerStatefulWidget {
  const CycleListScreen({super.key});

  @override
  ConsumerState<CycleListScreen> createState() => _CycleListScreenState();
}

class _CycleListScreenState extends ConsumerState<CycleListScreen> {
  final _searchCtrl = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cyclesAsync = ref.watch(cycleListProvider(_query));

    return Scaffold(
      appBar: AppBar(
        title: const Text('IVF cycles'),
        actions: [
          IconButton(
            icon: const Icon(Icons.biotech_outlined),
            tooltip: 'Active cultures',
            onPressed: () => context.push('/active'),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: TextField(
              controller: _searchCtrl,
              decoration: InputDecoration(
                hintText: 'Search by name or identifier…',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _query.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchCtrl.clear();
                          setState(() => _query = '');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                isDense: true,
                filled: true,
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
        ),
      ),
      body: cyclesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (cycles) => cycles.isEmpty
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.science_outlined,
                      size: 64,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    const SizedBox(height: 16),
                    const Text('No cycles yet'),
                    const SizedBox(height: 8),
                    FilledButton.tonal(
                      onPressed: () => context.push('/cycle/new'),
                      child: const Text('Create first cycle'),
                    ),
                  ],
                ),
              )
            : ListView.separated(
                itemCount: cycles.length,
                separatorBuilder: (_, _) =>
                    const Divider(height: 1, indent: 72),
                itemBuilder: (ctx, i) => _CycleTile(cycle: cycles[i]),
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/cycle/new'),
        icon: const Icon(Icons.add),
        label: const Text('New cycle'),
      ),
    );
  }
}

class _CycleTile extends StatelessWidget {
  final IvfCycle cycle;
  const _CycleTile({required this.cycle});

  @override
  Widget build(BuildContext context) {
    final pickupStr = cycle.oocytePickupDate != null
        ? DateFormat('dd MMM yyyy').format(cycle.oocytePickupDate!)
        : 'No pickup date';

    int? currentDay;
    if (cycle.oocytePickupDate != null) {
      final diff = DateTime.now().difference(cycle.oocytePickupDate!).inDays;
      if (diff >= 0 && diff <= 6) {
        currentDay = diff == 0 ? 1 : (diff == 1 ? 2 : (diff == 2 ? 3 : 5));
      }
    }

    return ListTile(
      leading: CircleAvatar(child: Text(cycle.wifeName[0].toUpperCase())),
      title: Text('${cycle.wifeName}  /  ${cycle.husbandName}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (cycle.cycleIdentifier != null &&
              cycle.cycleIdentifier!.isNotEmpty)
            Text(
              'ID: ${cycle.cycleIdentifier}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          Text('$pickupStr${currentDay != null ? "  ·  Day $currentDay" : ""}'),
        ],
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => context.push('/cycle/${cycle.id}'),
    );
  }
}
