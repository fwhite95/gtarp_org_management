import 'crime.dart';

class CleaningActivity extends Crime {
  final List<String> people;
  final String percentage;
  final String money;

  const CleaningActivity({
    required super.crimeId,
    required super.activity,
    required super.name,
    required super.rank,
    required super.date,
    required super.produced,
    required this.people,
    required this.percentage,
    required this.money,
  });

  @override
  CleaningActivity copyWith({
    String? crimeId,
    String? activity,
    String? name,
    String? rank,
    DateTime? date,
    String? produced,
    List<String>? people,
    String? percentage,
    String? money,
  }) {
    return CleaningActivity(
      crimeId: crimeId ?? this.crimeId,
      activity: activity ?? this.activity,
      name: name ?? this.name,
      rank: rank ?? this.rank,
      date: date ?? this.date,
      produced: produced ?? this.produced,
      people: people ?? this.people,
      percentage: percentage ?? this.percentage,
      money: money ?? this.money,
    );
  }

  factory CleaningActivity.fromJson(Map<String, dynamic> json) {
    return CleaningActivity(
      crimeId: json['crimeId'],
      activity: json['activity'],
      name: json['name'],
      rank: json['rank'],
      date: DateTime.fromMillisecondsSinceEpoch(json['date'].seconds * 1000),
      produced: json['produced'],
      people: json['people'].map<String>((i) => i.toString()).toList(),
      percentage: json['percentage'],
      money: json['money'],
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
      'people': people,
      'percentage': percentage,
      'money': money,
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
        people,
        percentage,
        money,
      ];

  static List<CleaningActivity> sampleCleaningActivity = [
    CleaningActivity(
      crimeId: '123',
      activity: 'Cleaning',
      name: 'Arush',
      rank: 'Don',
      date: DateTime(2024, 4, 3),
      people: ['Arush'],
      percentage: '10',
      money: '84000',
      produced: 'Cleaned: 84000',
    ),
    CleaningActivity(
      crimeId: '456',
      activity: 'Cleaning',
      name: 'Octo',
      rank: 'Specialist',
      date: DateTime(2024, 4, 3),
      people: ['Octo'],
      percentage: '10',
      money: '84000',
      produced: 'Cleaned: 84000',
    ),
  ];
}
