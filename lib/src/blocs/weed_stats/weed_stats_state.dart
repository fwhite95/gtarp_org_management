part of 'weed_stats_bloc.dart';

enum WeedStatsStatus {
  initial,
  loading,
  error,
  payWeek,
  day,
  week,
  month,
}

class WeedStatsState extends Equatable {
  const WeedStatsState({
    this.status = WeedStatsStatus.initial,
    this.activities = const [],
    this.organization = const Organization(
      id: '',
      name: '',
      members: [],
      ranks: [],
      crimeActions: [],
    ),
    this.memberMoney = const [],
    this.totalDirtyEarned = '',
    this.totalKickback = '',
    this.totalGrossProfit = '',
    this.kickbackFromActivity = const [],
    this.bagsGrown = '',
    this.bagsDistributed = '',
  });

  final WeedStatsStatus status;
  final List<WeedActivity> activities;
  final Organization organization;

  // Stats (likely unsaved in db)
  final List<Map<String, dynamic>> memberMoney;
  final String totalDirtyEarned;
  final String totalKickback;
  final String totalGrossProfit;
  final List<Map<String, dynamic>> kickbackFromActivity;
  final String bagsGrown;
  final String bagsDistributed;

  WeedStatsState copyWith({
    WeedStatsStatus? status,
    List<WeedActivity>? activities,
    Organization? organization,
    List<Map<String, dynamic>>? memberMoney,
    String? totalDirtyEarned,
    String? totalKickback,
    String? totalGrossProfit,
    List<Map<String, dynamic>>? kickbackFromActivity,
    String? bagsGrown,
    String? bagsDistributed,
  }) {
    return WeedStatsState(
      status: status ?? this.status,
      activities: activities ?? this.activities,
      organization: organization ?? this.organization,
      memberMoney: memberMoney ?? this.memberMoney,
      totalDirtyEarned: totalDirtyEarned ?? this.totalDirtyEarned,
      totalKickback: totalKickback ?? this.totalKickback,
      totalGrossProfit: totalGrossProfit ?? this.totalGrossProfit,
      kickbackFromActivity: kickbackFromActivity ?? this.kickbackFromActivity,
      bagsGrown: bagsGrown ?? this.bagsGrown,
      bagsDistributed: bagsDistributed ?? this.bagsDistributed,
    );
  }

  @override
  List<Object> get props => [
        status,
        activities,
        organization,
        memberMoney,
        totalDirtyEarned,
        totalKickback,
        totalGrossProfit,
        kickbackFromActivity,
        bagsGrown,
        bagsDistributed,
      ];
}
