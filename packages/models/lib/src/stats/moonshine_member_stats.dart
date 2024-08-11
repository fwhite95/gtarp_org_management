import 'package:models/src/stats/stats.dart';

class MoonshineMemberStats extends MemberStats {
  final int crates;
  final int lunches;

  const MoonshineMemberStats({
    required super.name,
    required super.activity,
    required super.money,
    required super.percentage,
    required super.kickback,
    required this.crates,
    required this.lunches,
  });

  @override
  MoonshineMemberStats copyWith({
    String? name,
    String? activity,
    int? money,
    double? percentage,
    double? kickback,
    int? crates,
    int? lunches,
  }) {
    return MoonshineMemberStats(
      name: name ?? this.name,
      activity: activity ?? this.activity,
      money: money ?? this.money,
      percentage: percentage ?? this.percentage,
      kickback: kickback ?? this.kickback,
      crates: crates ?? this.crates,
      lunches: lunches ?? this.lunches,
    );
  }

  factory MoonshineMemberStats.fromJson(Map<String, dynamic> json) {
    return MoonshineMemberStats(
      name: json['name'],
      activity: json['activity'],
      money: json['money'],
      percentage: json['percentage'],
      kickback: json['kickback'],
      crates: json['crates'],
      lunches: json['lunches'],
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
      'crates': crates,
      'lunches': lunches,
    };
  }

  @override
  List<Object?> get props => [
        name,
        activity,
        money,
        percentage,
        kickback,
        crates,
        lunches,
      ];
}
