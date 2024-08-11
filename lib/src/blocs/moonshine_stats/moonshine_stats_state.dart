part of 'moonshine_stats_bloc.dart';

enum MoonshineStatsStatus {
  initial,
  loading,
  error,
  payWeek,
  day,
  week,
  month,
}

class MoonshineStatsState extends Equatable {
  const MoonshineStatsState({
    this.status = MoonshineStatsStatus.initial,
    this.activities = const [],
    this.totalDirtyEarned = '',
    this.totalKickback = '',
    this.totalGrossProfit = '',
    this.kickbackFromActivity = const [],
    this.lunchesGrown = '',
    this.bottlesCooked = '',
    this.bottlesRan = '',
    this.farmersList = const [],
    this.cooksList = const [],
    this.runnersList = const [],
  });

  final MoonshineStatsStatus status;
  final List<MoonshineActivity> activities;

  // Stats (likely unsaved in db)
  final String totalDirtyEarned;
  final String totalKickback;
  final String totalGrossProfit;
  final List<Map<String, dynamic>> kickbackFromActivity;

  final String lunchesGrown;
  final String bottlesCooked;
  final String bottlesRan;

  final List<MoonshineMemberStats> farmersList;
  final List<MoonshineMemberStats> cooksList;
  final List<MoonshineMemberStats> runnersList;

  MoonshineStatsState copyWith({
    MoonshineStatsStatus? status,
    List<MoonshineActivity>? activities,
    List<Map<String, dynamic>>? memberMoney,
    String? totalDirtyEarned,
    String? totalKickback,
    String? totalGrossProfit,
    List<Map<String, dynamic>>? kickbackFromActivity,
    String? lunchesGrown,
    String? bottlesCooked,
    String? bottlesRan,
    List<MoonshineMemberStats>? farmersList,
    List<MoonshineMemberStats>? cooksList,
    List<MoonshineMemberStats>? runnersList,
  }) {
    return MoonshineStatsState(
      status: status ?? this.status,
      activities: activities ?? this.activities,
      totalDirtyEarned: totalDirtyEarned ?? this.totalDirtyEarned,
      totalKickback: totalKickback ?? this.totalKickback,
      totalGrossProfit: totalGrossProfit ?? this.totalGrossProfit,
      kickbackFromActivity: kickbackFromActivity ?? this.kickbackFromActivity,
      lunchesGrown: lunchesGrown ?? this.lunchesGrown,
      bottlesCooked: bottlesCooked ?? this.bottlesCooked,
      bottlesRan: bottlesRan ?? this.bottlesRan,
      farmersList: farmersList ?? this.farmersList,
      cooksList: cooksList ?? this.cooksList,
      runnersList: runnersList ?? this.runnersList,
    );
  }

  @override
  List<Object> get props => [
        status,
        activities,
        totalDirtyEarned,
        totalKickback,
        totalGrossProfit,
        kickbackFromActivity,
        lunchesGrown,
        bottlesCooked,
        bottlesRan,
        farmersList,
        cooksList,
        runnersList,
      ];
}
