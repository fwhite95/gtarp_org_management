import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:org_management/constants.dart';

class MoonshineStatsData {
  static Map<String, dynamic> getMoonshineList(
    List<MoonshineActivity> moonshineActivities,
    List<CrimeAction> crimeActionList,
  ) {
    List<MoonshineMemberStats> runnersList = [];
    List<MoonshineMemberStats> cooksList = [];
    List<MoonshineMemberStats> farmersList = [];
    Map<String, dynamic> map = {};

    // Run through moonshine activities
    for (final m in moonshineActivities) {
      final percentage =
          (m.percentage == '' ? 0 : double.parse(m.percentage)) / 100;
      MoonshineMemberStats moonshineMember = MoonshineMemberStats(
        name: m.name,
        activity: m.activity,
        money: int.parse(m.money),
        percentage: percentage,
        kickback: int.parse(m.money) * percentage,
        crates: int.parse(m.bottles),
        lunches: 0,
      );

      // go through runnersList, if a member already exists get the sum
      if (runnersList.any((o) => o.name == moonshineMember.name)) {
        for (final r in runnersList) {
          if (r.name == moonshineMember.name) {
            moonshineMember.copyWith(
              money: moonshineMember.money + r.money,
              crates: moonshineMember.crates + r.crates,
            );
          }
        }
      }
      runnersList.add(moonshineMember);

      const String cookCrimeAction = 'Moonshine: Large Distill';
      final cookPercentage =
          (Data.getPercentage(crimeActionList, cookCrimeAction) == ''
                  ? 0
                  : double.parse(m.percentage)) /
              100;
      MoonshineMemberStats cookMoonshineMember = MoonshineMemberStats(
        name: m.cook,
        activity: cookCrimeAction,
        money: int.parse(m.money),
        percentage: cookPercentage,
        kickback: int.parse(m.money) * cookPercentage,
        crates: int.parse(m.bottles),
        lunches: 0,
      );

      // go through cooksList, if a member already exists get the sum
      if (cooksList.any((o) => o.name == cookMoonshineMember.name)) {
        for (int i = 0; i < cooksList.length; i++) {
          if (cooksList[i].name == cookMoonshineMember.name) {
            final m = cooksList[i];
            cooksList[i] = MoonshineMemberStats(
              name: m.name,
              activity: m.activity,
              money: m.money + cookMoonshineMember.money,
              percentage: percentage,
              kickback: m.kickback + cookMoonshineMember.kickback,
              crates: m.crates + cookMoonshineMember.crates,
              lunches: m.lunches,
            );
          }
        }
      } else {
        cooksList.add(cookMoonshineMember);
      }

      const String farmCrimeAction = 'Moonshine: Large Farm';
      final farmPercentage =
          (Data.getPercentage(crimeActionList, farmCrimeAction) == ''
                  ? 0
                  : double.parse(m.percentage)) /
              100;
      MoonshineMemberStats farmMoonshineMember = MoonshineMemberStats(
        name: m.farmer,
        activity: farmCrimeAction,
        money: int.parse(m.money),
        percentage: farmPercentage,
        kickback: int.parse(m.money) * farmPercentage,
        crates: int.parse(m.bottles),
        lunches: 0,
      );

      // go through cooksList, if a member already exists get the sum
      if (farmersList.any((o) => o.name == farmMoonshineMember.name)) {
        for (int i = 0; i < farmersList.length; i++) {
          if (farmersList[i].name == farmMoonshineMember.name) {
            final m = farmersList[i];
            farmersList[i] = MoonshineMemberStats(
              name: m.name,
              activity: m.activity,
              money: m.money + farmMoonshineMember.money,
              percentage: farmPercentage,
              kickback: m.kickback + farmMoonshineMember.kickback,
              crates: m.crates + farmMoonshineMember.crates,
              lunches: m.lunches,
            );
          }
        }
      } else {
        farmersList.add(farmMoonshineMember);
      }
    }
    print('runners: $runnersList');
    print('cooks: $cooksList');
    print('farmers: $farmersList');

    map.addAll({
      'runnersList': runnersList,
      'cooksList': cooksList,
      'farmersList': farmersList,
    });

    return map;
  }

  static Map<String, dynamic> getMoonShineMoneyData(
    Map<String, dynamic> moonshineMap,
  ) {
    Map<String, dynamic> moneyData = {
      'dirtyEarned': 0,
      'totalKickback': 0,
      'totalGrossProfit': 0,
    };

    for (final MoonshineMemberStats r in moonshineMap['runnersList']) {
      moneyData['dirtyEarned'] += r.money;
      moneyData['totalKickback'] += r.kickback;
    }

    for (final MoonshineMemberStats c in moonshineMap['cooksList']) {
      moneyData['totalKickback'] += c.kickback;
    }

    for (final MoonshineMemberStats f in moonshineMap['farmersList']) {
      moneyData['totalKickback'] += f.kickback;
    }

    moneyData['totalGrossProfit'] =
        moneyData['dirtyEarned'] - moneyData['totalKickback'];

    return moneyData;
  }
}
