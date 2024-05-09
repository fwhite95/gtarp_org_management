import 'crime.dart';

class MoonshineActivity extends Crime {
  final String bottles;
  final List<String> people;
  final String percentage;
  final String money;

  const MoonshineActivity({
    required super.crimeId,
    required super.activity,
    required super.name,
    required super.rank,
    required super.date,
    required super.produced,
    required this.bottles,
    required this.people,
    required this.percentage,
    required this.money,
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
    List<String>? people,
    String? percentage,
    String? money,
  }) {
    return MoonshineActivity(
      crimeId: crimeId ?? this.crimeId,
      activity: activity ?? this.activity,
      name: name ?? this.name,
      rank: rank ?? this.rank,
      date: date ?? this.date,
      produced: produced ?? this.produced,
      bottles: bottles ?? this.bottles,
      people: people ?? this.people,
      percentage: percentage ?? this.percentage,
      money: money ?? this.money,
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
      'bottles': bottles,
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
        bottles,
        produced,
        people,
        percentage,
        money,
      ];

  static List<MoonshineActivity> sampleMoonshineActivity = [
    MoonshineActivity(
      crimeId: '123',
      activity: 'Moonshine: Distribution',
      name: 'Luciano',
      rank: 'Don',
      date: DateTime(2024, 4, 3),
      bottles: '30',
      people: ['Luciano', 'DeVito'],
      percentage: '',
      money: '',
      produced: '30 bottles',
    ),
    MoonshineActivity(
      crimeId: '456',
      activity: 'Moonshine: Selling',
      name: 'DeVito',
      rank: 'Bought In',
      date: DateTime(2024, 4, 3),
      bottles: '30',
      people: [
        'DeVito',
      ],
      percentage: '30',
      money: '5625',
      produced: '30 bottles: 2500',
    ),
    MoonshineActivity(
      crimeId: '789',
      activity: 'Moonshine: Distilling',
      name: 'Donnie',
      rank: 'Associate',
      date: DateTime(2024, 4, 3),
      bottles: '100',
      people: [
        'Donnie',
      ],
      percentage: '30',
      money: '',
      produced: '100 bottles',
    ),
  ];
}
