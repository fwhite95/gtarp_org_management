import 'crime.dart';

class WeedActivity extends Crime {
  final String bags;
  final List<String> people;
  final String percentage;
  final String money;

  const WeedActivity({
    required super.crimeId,
    required super.activity,
    required super.name,
    required super.rank,
    required super.date,
    required super.produced,
    required this.bags,
    required this.people,
    required this.percentage,
    required this.money,
  });

  @override
  WeedActivity copyWith({
    String? crimeId,
    String? activity,
    String? name,
    String? rank,
    DateTime? date,
    String? produced,
    String? bags,
    List<String>? people,
    String? percentage,
    String? money,
  }) {
    return WeedActivity(
      crimeId: crimeId ?? this.crimeId,
      activity: activity ?? this.activity,
      name: name ?? this.name,
      rank: rank ?? this.rank,
      date: date ?? this.date,
      produced: produced ?? this.produced,
      bags: bags ?? this.bags,
      people: people ?? this.people,
      percentage: percentage ?? this.percentage,
      money: money ?? this.money,
    );
  }

  factory WeedActivity.fromJson(Map<String, dynamic> json) {
    return WeedActivity(
      crimeId: json['crimeId'],
      activity: json['activity'],
      name: json['name'],
      rank: json['rank'],
      date: DateTime.fromMillisecondsSinceEpoch(json['date'].seconds * 1000),
      produced: json['produced'],
      bags: json['bags'],
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
      'bags': bags,
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
        bags,
        produced,
        people,
        percentage,
        money,
      ];

  static List<WeedActivity> sampleWeedActivity = [
    WeedActivity(
      crimeId: '123',
      activity: 'Weed: Distribution',
      name: 'Luciano',
      rank: 'Don',
      date: DateTime(2024, 4, 3),
      bags: '200',
      people: ['Luciano', 'DeVito'],
      percentage: '',
      money: '13400',
      produced: '200 bags: 13400',
    ),
    WeedActivity(
      crimeId: '456',
      activity: 'Weed: Selling',
      name: 'Speedy',
      rank: 'Don',
      date: DateTime(2024, 4, 3),
      bags: '200',
      people: [
        'Speedy',
      ],
      percentage: '55',
      money: '15000',
      produced: '200 bags: 15000',
    ),
    WeedActivity(
      crimeId: '789',
      activity: 'Weed: Growing',
      name: 'Teddy',
      rank: 'Captain',
      date: DateTime(2024, 4, 3),
      bags: '1008',
      people: [
        'Teddy',
      ],
      percentage: '20',
      money: '',
      produced: '1008 bags',
    ),
  ];
}
