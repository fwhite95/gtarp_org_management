import 'crime.dart';

class TheftActivity extends Crime {
  final String objects;
  final List<String> people;
  final String percentage;
  final String money;

  const TheftActivity({
    required super.crimeId,
    required super.activity,
    required super.name,
    required super.rank,
    required super.date,
    required super.produced,
    required this.objects,
    required this.people,
    required this.percentage,
    required this.money,
  });

  @override
  TheftActivity copyWith({
    String? crimeId,
    String? activity,
    String? name,
    String? rank,
    DateTime? date,
    String? produced,
    String? objects,
    List<String>? people,
    String? percentage,
    String? money,
  }) {
    return TheftActivity(
      crimeId: crimeId ?? this.crimeId,
      activity: activity ?? this.activity,
      name: name ?? this.name,
      rank: rank ?? this.rank,
      date: date ?? this.date,
      produced: produced ?? this.produced,
      objects: objects ?? this.objects,
      people: people ?? this.people,
      percentage: percentage ?? this.percentage,
      money: money ?? this.money,
    );
  }

  factory TheftActivity.fromJson(Map<String, dynamic> json) {
    return TheftActivity(
      crimeId: json['crimeId'],
      activity: json['activity'],
      name: json['name'],
      rank: json['rank'],
      date: DateTime.fromMillisecondsSinceEpoch(json['date'].seconds * 1000),
      produced: json['produced'],
      objects: json['objects'],
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
      'objects': objects,
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
        objects,
        produced,
        people,
        percentage,
        money,
      ];

  static List<TheftActivity> sampleTheftActivity = [
    TheftActivity(
      crimeId: '123',
      activity: 'Theft: Roof Runniing',
      name: 'Clark',
      rank: 'Bought In',
      date: DateTime(2024, 4, 3),
      objects: '10',
      people: ['Clark'],
      percentage: '60',
      money: '13400',
      produced: '10 objects: 13400',
    ),
    TheftActivity(
      crimeId: '456',
      activity: 'Theft: Chopping',
      name: 'Octo',
      rank: 'Specialist',
      date: DateTime(2024, 4, 3),
      objects: '25',
      people: [
        'Octo',
        'Kas',
      ],
      percentage: '60',
      money: '20000',
      produced: '25 objects: 20000',
    ),
  ];
}
