import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../daily_observation/daily_obs_notifier.dart';
import '../daily_observation/blastocyst/blastocyst_notifier.dart';
import 'cycle_form_notifier.dart';

final maturationRateProvider = Provider.family<double?, int>((ref, cycleId) {
  final cycle = ref.watch(cycleFormProvider(cycleId)).asData?.value;
  if (cycle == null ||
      cycle.occRecovered == null ||
      cycle.oocyteMii == null ||
      cycle.occRecovered == 0) {
    return null;
  }
  return cycle.oocyteMii! / cycle.occRecovered!;
});

final fertilizationRateProvider = Provider.family<double?, int>((ref, cycleId) {
  final cycle = ref.watch(cycleFormProvider(cycleId)).asData?.value;
  if (cycle == null || cycle.oocyteMii == null || cycle.oocyteMii == 0) return null;

  final day1Obs = ref.watch(dailyObsProvider((cycleId: cycleId, day: 1))).asData?.value;
  if (day1Obs == null || day1Obs.twoPN2PB == null) return null;

  return day1Obs.twoPN2PB! / cycle.oocyteMii!;
});

final blastulationRateProvider = Provider.family<double?, int>((ref, cycleId) {
  final day1Obs = ref.watch(dailyObsProvider((cycleId: cycleId, day: 1))).asData?.value;
  if (day1Obs == null || day1Obs.twoPN2PB == null || day1Obs.twoPN2PB == 0) {
    return null;
  }

  final cycle = ref.watch(cycleFormProvider(cycleId)).asData?.value;
  double totalBlast = 0;

  if (cycle != null && cycle.totalBlastocysts != null) {
    totalBlast = cycle.totalBlastocysts!.toDouble();
  }

  if (totalBlast == 0) {
    final grades = ref.watch(blastocystProvider(cycleId)).asData?.value;
    if (grades != null && grades.isNotEmpty) {
      totalBlast = grades.fold(0.0, (sum, g) => sum + g.count);
    }
  }

  if (totalBlast == 0) return null;
  return totalBlast / day1Obs.twoPN2PB!;
});
