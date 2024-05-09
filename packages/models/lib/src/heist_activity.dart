import 'crime.dart';

class HeistActivity extends Crime {
  final List<String> people;
  final String percentage;
  final String money;

  const HeistActivity({
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
  HeistActivity copyWith({
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
    return HeistActivity(
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

  factory HeistActivity.fromJson(Map<String, dynamic> json) {
    return HeistActivity(
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

  static List<HeistActivity> sampleHeistActivity = [
    HeistActivity(
      crimeId: '123',
      activity: 'Heist: Maze Bank',
      name: 'Marty',
      rank: 'Bought In',
      date: DateTime(2024, 4, 3),
      people: ['Marty', 'Yuno', 'Lang', 'GiGi', 'Luciano', 'Larry'],
      percentage: '50',
      money: '100000',
      produced: '300 butcoin: 100000',
    ),
    HeistActivity(
      crimeId: '456',
      activity: 'Heist: Laundrymat',
      name: 'Clark',
      rank: 'Bought In',
      date: DateTime(2024, 4, 3),
      people: ['Clark', 'DeVito', 'Vito', 'Apple'],
      percentage: '50',
      money: '20000',
      produced: '100 butcoin: 20000',
    ),
  ];
}
