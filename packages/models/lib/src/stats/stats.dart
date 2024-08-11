import 'package:equatable/equatable.dart';

class MemberStats extends Equatable {
  final String name;
  final String activity;
  final int money;
  final double percentage;
  final double kickback;

  const MemberStats({
    required this.name,
    required this.activity,
    required this.money,
    required this.percentage,
    required this.kickback,
  });

  MemberStats copyWith({
    String? name,
    String? activity,
    int? money,
    double? percentage,
    double? kickback,
  }) {
    return MemberStats(
      name: name ?? this.name,
      activity: activity ?? this.activity,
      money: money ?? this.money,
      percentage: percentage ?? this.percentage,
      kickback: kickback ?? this.kickback,
    );
  }

  factory MemberStats.fromJson(Map<String, dynamic> json) {
    return MemberStats(
      name: json['name'],
      activity: json['activity'],
      money: json['money'],
      percentage: json['percentage'],
      kickback: json['kickback'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'activity': activity,
      'money': money,
      'percentage': percentage,
      'kickback': kickback,
    };
  }

  @override
  List<Object?> get props => [
        name,
        activity,
        money,
        percentage,
        kickback,
      ];
}
