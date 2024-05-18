import 'package:equatable/equatable.dart';

class CrimeAction extends Equatable {
  final String crime;
  final String action;
  final int percentage;

  const CrimeAction({
    required this.crime,
    required this.action,
    required this.percentage,
  });

  CrimeAction copyWith({
    String? crime,
    String? action,
    int? percentage,
  }) {
    return CrimeAction(
      crime: crime ?? this.crime,
      action: action ?? this.action,
      percentage: percentage ?? this.percentage,
    );
  }

  factory CrimeAction.fromJson(Map<String, dynamic> json) {
    return CrimeAction(
      crime: json['crime'] ?? '',
      action: json['action'] ?? '',
      percentage: json['percentage'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'crime': crime,
      'action': action,
      'percentage': percentage,
    };
  }

  @override
  List<Object?> get props => [
        crime,
        action,
        percentage,
      ];

  static List<CrimeAction> crimeActionsSampleData = [
    const CrimeAction(
      crime: 'Weed',
      action: 'Grow',
      percentage: 10,
    ),
    const CrimeAction(
      crime: 'Weed',
      action: 'Distribute',
      percentage: 0,
    ),
    const CrimeAction(
      crime: 'Weed',
      action: 'Sell',
      percentage: 40,
    ),
    const CrimeAction(
      crime: 'Moonshine',
      action: 'Distill',
      percentage: 35,
    ),
    const CrimeAction(
      crime: 'Moonshine',
      action: 'Distribute',
      percentage: 0,
    ),
    const CrimeAction(
      crime: 'Moonshine',
      action: 'Sell',
      percentage: 15,
    ),
    const CrimeAction(
      crime: 'Heist',
      action: 'Laundrymat',
      percentage: 50,
    ),
    const CrimeAction(
      crime: 'Heist',
      action: 'Cash Exchange',
      percentage: 50,
    ),
    const CrimeAction(
      crime: 'Heist',
      action: 'Maze Bank',
      percentage: 50,
    ),
    const CrimeAction(
      crime: 'Theft',
      action: 'Chopping',
      percentage: 50,
    ),
    const CrimeAction(
      crime: 'Theft',
      action: 'HVAC',
      percentage: 50,
    ),
    const CrimeAction(
      crime: 'Cleaning',
      action: 'Money Run',
      percentage: 10,
    ),
  ];
}
