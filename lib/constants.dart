import 'package:flutter/material.dart';
import 'package:models/models.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);

const defaultPadding = 16.0;

class Data {
  static List<String> getActions(Organization org, String crime) {
    switch (crime) {
      case 'Weed':
        final CrimeActions crimeActions =
            org.crimeActions.firstWhere((value) => value.crime == crime);
        List<String> list = [];

        for (String action in crimeActions.actions) {
          list.add('$crime: $action');
        }

        return list;
      case 'Moonshine':
        final CrimeActions crimeActions =
            org.crimeActions.firstWhere((value) => value.crime == crime);
        List<String> list = [];

        for (String action in crimeActions.actions) {
          list.add('$crime: $action');
        }

        return list;
      case 'Heist':
        final CrimeActions crimeActions =
            org.crimeActions.firstWhere((value) => value.crime == crime);
        List<String> list = [];

        for (String action in crimeActions.actions) {
          list.add('$crime: $action');
        }

        return list;
      case 'Theft':
        final CrimeActions crimeActions =
            org.crimeActions.firstWhere((value) => value.crime == crime);
        List<String> list = [];

        for (String action in crimeActions.actions) {
          list.add('$crime: $action');
        }

        return list;
      case 'Cleaning':
        final CrimeActions crimeActions =
            org.crimeActions.firstWhere((value) => value.crime == crime);
        List<String> list = [];

        for (String action in crimeActions.actions) {
          list.add('$crime: $action');
        }

        return list;
      default:
        return [];
    }
  }

  static List<String> ranks = [
    'Associate',
    'Bought In',
    'Soldier',
    'Captain',
    'Bookkeeper',
    'Advisor',
    'Underboss',
    'Don',
  ];

  static List<String> weedActions = [
    'Weed: Grow',
    'Weed: Distribute',
    'Weed: Sell',
  ];

  static List<String> moonshineActions = [
    'Moonshine: Distill',
    'Moonshine: Distribute',
    'Moonshine: Sell',
  ];

  static List<String> heistActions = [
    'Heist: Laundrymat',
    'Heist: Cash Exchange',
    'Heist: Maze Bank',
  ];

  static List<String> theftActions = [
    'Theft: Chopping',
    'Theft: HVAC',
    'Theft: Grime',
    'Theft: G6',
  ];

  static List<String> cleaningActions = [
    'Cleaning: Money Run',
  ];
}
