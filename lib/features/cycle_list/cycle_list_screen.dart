import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../data/database/app_database.dart';
import '../cycle_list/cycle_list_providers.dart';

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
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: const Text('Embryology Lab'),
            actions: [
              IconButton(
                icon: const Icon(Icons.biotech),
                onPressed: () => context.push('/active'),
                tooltip: 'Active Cultures',
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: SearchBar(
                controller: _searchCtrl,
                hintText: 'Search patient or ID...',
                elevation: const WidgetStatePropertyAll(0),
                backgroundColor: WidgetStatePropertyAll(Colors.grey.withValues(alpha: 0.1)),
                onChanged: (v) => setState(() => _query = v),
                leading: const Icon(Icons.search, color: Colors.grey),
                trailing: [
                  if (_query.isNotEmpty)
                    IconButton(icon: const Icon(Icons.close), onPressed: () {
                      _searchCtrl.clear();
                      setState(() => _query = '');
                    }),
                ],
              ),
            ),
          ),
          cyclesAsync.when(
            loading: () => const SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
            error: (e, _) => SliverFillRemaining(child: Center(child: Text('Error: $e'))),
            data: (cycles) => cycles.isEmpty
              ? _EmptyCycles(onNew: () => context.push('/cycle/new'))
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) => _ModernCycleTile(cycle: cycles[i]),
                    childCount: cycles.length,
                  ),
                ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/cycle/new'),
        icon: const Icon(Icons.add),
        label: const Text('New Cycle'),
        elevation: 2,
      ),
    );
  }
}

class _ModernCycleTile extends StatelessWidget {
  final IvfCycle cycle;
  const _ModernCycleTile({required this.cycle});

  @override
  Widget build(BuildContext context) {
    final dateStr = cycle.oocytePickupDate != null
        ? DateFormat('dd MMM yyyy').format(cycle.oocytePickupDate!)
        : 'Created ${DateFormat('dd MMM').format(cycle.createdAt)}';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              cycle.wifeName[0].toUpperCase(),
              style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        title: Text('${cycle.wifeName} / ${cycle.husbandName}', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (cycle.cycleIdentifier != null)
              Text('ID: ${cycle.cycleIdentifier}', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
            Text(dateStr, style: TextStyle(color: Colors.grey[500], fontSize: 13)),
          ],
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () => context.push('/cycle/${cycle.id}'),
      ),
    );
  }
}

class _EmptyCycles extends StatelessWidget {
  final VoidCallback onNew;
  const _EmptyCycles({required this.onNew});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.science_outlined, size: 64, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text('No cycles found', style: TextStyle(color: Colors.grey[600], fontSize: 18)),
          const SizedBox(height: 8),
          TextButton(onPressed: onNew, child: const Text('Create your first cycle')),
        ],
      ),
    );
  }
}
