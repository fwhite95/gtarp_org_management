part of 'weed_stats_bloc.dart';

abstract class WeedStatsEvent extends Equatable {
  const WeedStatsEvent();

  @override
  List<Object> get props => [];
}

class WeedStatsLoadPayWeekEvent extends WeedStatsEvent {
  const WeedStatsLoadPayWeekEvent(this.orgId);
  final String orgId;

  @override
  List<Object> get props => [
        orgId,
      ];
}
