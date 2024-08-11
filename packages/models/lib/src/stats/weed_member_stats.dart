import 'package:models/src/stats/stats.dart';

class WeedMemberStats extends MemberStats {
  final int bags;

  const WeedMemberStats({
    required super.name,
    required super.activity,
    required super.money,
    required super.percentage,
    required super.kickback,
    required this.bags,
  });

  @override
  WeedMemberStats copyWith({
    String? name,
    String? activity,
    int? money,
    double? percentage,
    double? kickback,
    int? bags,
  }) {
    return WeedMemberStats(
      name: name ?? this.name,
      activity: activity ?? this.activity,
      money: money ?? this.money,
      percentage: percentage ?? this.percentage,
      kickback: kickback ?? this.kickback,
      bags: bags ?? this.bags,
    );
  }

  factory WeedMemberStats.fromJson(Map<String, dynamic> json) {
    return WeedMemberStats(
      name: json['name'],
      activity: json['activity'],
      money: json['money'],
      percentage: json['percentage'],
      kickback: json['kickback'],
      bags: json['bags'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'activity': activity,
      'money': money,
      'percentage': percentage,
      'kickback': kickback,
      'bags': bags,
    };
  }

  @override
  List<Object?> get props => [
        name,
        activity,
        money,
        percentage,
        kickback,
        bags,
      ];
}
