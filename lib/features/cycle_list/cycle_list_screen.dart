import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../data/database/app_database.dart';
import '../cycle_list/cycle_list_providers.dart';
import '../daily_observation/daily_obs_notifier.dart';
import '../daily_observation/blastocyst/blastocyst_notifier.dart';
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
    final activeAsync = ref.watch(activeCyclesProvider);

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

          // Dashboard / Reminders Section
          if (_query.isEmpty)
            activeAsync.when(
              data: (active) => SliverToBoxAdapter(
                child: _DashboardSection(cycles: active),
              ),
              loading: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
              error: (err, stack) =>
                  const SliverToBoxAdapter(child: SizedBox.shrink()),
            ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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

class _DashboardSection extends StatelessWidget {
  final List<IvfCycle> cycles;
  const _DashboardSection({required this.cycles});

  @override
  Widget build(BuildContext context) {
    // Logic to filter for "Today's Tasks"
    final now = DateTime.now();
    final todayTasks = <_TaskItem>[];

    for (final cycle in cycles) {
      if (cycle.oocytePickupDate == null) continue;

      final diff = now.difference(cycle.oocytePickupDate!).inDays;
      if (diff == 0) {
        todayTasks.add(_TaskItem(
          cycle: cycle,
          task: 'OPU Today',
          day: 0,
          color: Colors.blue,
        ));
      } else if (diff == 1) {
        todayTasks.add(_TaskItem(
          cycle: cycle,
          task: 'Day 1 Fertilization',
          day: 1,
          color: Colors.pink,
        ));
      } else if (diff == 2) {
        todayTasks.add(_TaskItem(
          cycle: cycle,
          task: 'Day 2 Cleavage',
          day: 2,
          color: Colors.orange,
        ));
      } else if (diff == 3) {
        todayTasks.add(_TaskItem(
          cycle: cycle,
          task: 'Day 3 Cleavage',
          day: 3,
          color: Colors.deepOrange,
        ));
      } else if (diff == 5) {
        todayTasks.add(_TaskItem(
          cycle: cycle,
          task: 'Day 5 Blastocyst',
          day: 5,
          color: Colors.purple,
        ));
      }
    }

    if (todayTasks.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
          child: Text("TODAY'S TASKS", style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.grey[600], fontWeight: FontWeight.bold, letterSpacing: 1.2)),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: todayTasks.length,
            itemBuilder: (ctx, i) => _TaskCard(item: todayTasks[i]),
          ),
        ),
      ],
    );
  }
}

class _TaskItem {
  final IvfCycle cycle;
  final String task;
  final int day;
  final Color color;
  _TaskItem({required this.cycle, required this.task, required this.day, required this.color});
}

class _TaskCard extends ConsumerWidget {
  final _TaskItem item;
  const _TaskCard({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDone = false;
    if (item.day == 0) {
      isDone = item.cycle.occRecovered != null;
    } else if (item.day == 5) {
      final grades = ref.watch(blastocystProvider(item.cycle.id)).asData?.value;
      isDone = (item.cycle.totalBlastocysts != null) || (grades != null && grades.isNotEmpty);
    } else {
      final obs = ref.watch(dailyObsProvider((cycleId: item.cycle.id, day: item.day))).asData?.value;
      isDone = obs != null;
    }

    return GestureDetector(
      onTap: () => context.push('/cycle/${item.cycle.id}${item.day > 0 ? "/day/${item.day}" : ""}'),
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12, bottom: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDone ? Colors.green[50] : item.color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
          border: isDone ? Border.all(color: Colors.green[200]!) : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(isDone ? Icons.check_circle : Icons.error_outline, size: 16, color: isDone ? Colors.green[700] : item.color),
                const SizedBox(width: 4),
                Text(isDone ? 'DONE' : 'DUE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: isDone ? Colors.green[700] : item.color)),
              ],
            ),
            const Spacer(),
            Text(item.cycle.wifeName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
            Text(item.task, style: TextStyle(fontSize: 11, color: Colors.grey[700])),
          ],
        ),
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
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10, offset: const Offset(0, 4))
        ],
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
            if (cycle.cycleIdentifier != null && cycle.cycleIdentifier!.isNotEmpty)
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
