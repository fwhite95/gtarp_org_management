import 'crime.dart';

class MoonshineActivity extends Crime {
  final String bottles;
  final String percentage;
  final String money;
  final String cook;
  final String farmer;

  const MoonshineActivity({
    required super.crimeId,
    required super.activity,
    required super.name,
    required super.rank,
    required super.date,
    required super.produced,
    required this.bottles,
    required this.percentage,
    required this.money,
    required this.cook,
    required this.farmer,
  });

  @override
  MoonshineActivity copyWith({
    String? crimeId,
    String? activity,
    String? name,
    String? rank,
    DateTime? date,
    String? produced,
    String? bottles,
    String? percentage,
    String? money,
    String? cook,
    String? farmer,
  }) {
    return MoonshineActivity(
      crimeId: crimeId ?? this.crimeId,
      activity: activity ?? this.activity,
      name: name ?? this.name,
      rank: rank ?? this.rank,
      date: date ?? this.date,
      produced: produced ?? this.produced,
      bottles: bottles ?? this.bottles,
      percentage: percentage ?? this.percentage,
      money: money ?? this.money,
      cook: cook ?? this.cook,
      farmer: farmer ?? this.farmer,
    );
  }

  factory MoonshineActivity.fromJson(Map<String, dynamic> json) {
    return MoonshineActivity(
      crimeId: json['crimeId'],
      activity: json['activity'],
      name: json['name'],
      rank: json['rank'],
      date: DateTime.fromMillisecondsSinceEpoch(json['date'].seconds * 1000),
      produced: json['produced'],
      bottles: json['bottles'],
      percentage: json['percentage'],
      money: json['money'],
      cook: json['cook'],
      farmer: json['farmer'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'crimeId': crimeId,
      'activity': activity,
      'name': name,
      'rank': rank,
      'date': date,
      'produced': produced,
      'bottles': bottles,
      'percentage': percentage,
      'money': money,
      'cook': cook,
      'farmer': farmer,
    };
  }

  @override
  List<Object?> get props => [
        crimeId,
        activity,
        name,
        rank,
        date,
        bottles,
        produced,
        percentage,
        money,
        cook,
        farmer,
      ];
}
