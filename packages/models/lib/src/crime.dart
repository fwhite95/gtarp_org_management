import 'package:equatable/equatable.dart';

class Crime extends Equatable {
  final String crimeId;
  final String activity;
  final String name;
  final String rank;
  final DateTime date;
  final String produced;

  const Crime({
    required this.crimeId,
    required this.activity,
    required this.name,
    required this.rank,
    required this.date,
    required this.produced,
  });

  Crime copyWith({
    String? crimeId,
    String? activity,
    String? name,
    String? rank,
    DateTime? date,
    String? produced,
  }) {
    return Crime(
      crimeId: crimeId ?? this.crimeId,
      activity: activity ?? this.activity,
      name: name ?? this.name,
      rank: rank ?? this.rank,
      date: date ?? this.date,
      produced: produced ?? this.produced,
    );
  }

  factory Crime.fromJson(Map<String, dynamic> json) {
    return Crime(
      crimeId: json['crimeId'],
      activity: json['activity'],
      name: json['name'],
      rank: json['rank'],
      date: json['date'],
      produced: json['produced'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'crimeId': crimeId,
      'activity': activity,
      'name': name,
      'rank': rank,
      'date': date,
      'produced': produced,
    };
  }

  @override
  List<Object?> get props => [
        crimeId,
        activity,
        name,
        rank,
        date,
        produced,
      ];
}
