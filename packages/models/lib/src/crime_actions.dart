import 'package:equatable/equatable.dart';

class CrimeActions extends Equatable {
  final String crime;
  final List<String> actions;

  const CrimeActions({
    required this.crime,
    required this.actions,
  });

  CrimeActions copyWith({
    String? crime,
    List<String>? actions,
  }) {
    return CrimeActions(
      crime: crime ?? this.crime,
      actions: actions ?? this.actions,
    );
  }

  factory CrimeActions.fromJson(Map<String, dynamic> json) {
    List<String> actionsList = [];
    for (String a in json['actions']) {
      actionsList.add(a);
    }

    return CrimeActions(
      crime: json['crime'] ?? '',
      actions: actionsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'crime': crime,
      'actions': actions,
    };
  }

  @override
  List<Object?> get props => [
        crime,
        actions,
      ];

  static List<CrimeActions> crimeActionsSampleData = [
    const CrimeActions(
      crime: 'Weed',
      actions: [
        'Grow',
        'Distribute',
        'Sell',
      ],
    ),
    const CrimeActions(
      crime: 'Moonshine',
      actions: [
        'Distill',
        'Distribute',
        'Sell',
      ],
    ),
    const CrimeActions(
      crime: 'Heist',
      actions: [
        'Laundrymat',
        'Cash Exchange',
        'Maze Bank',
      ],
    ),
    const CrimeActions(
      crime: 'Theft',
      actions: [
        'Chopping',
        'HVAC',
      ],
    ),
    const CrimeActions(
      crime: 'Cleaning',
      actions: [
        'Money Run',
      ],
    ),
  ];
}
