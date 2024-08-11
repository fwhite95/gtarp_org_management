import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:org_management/src/blocs/dashboard/dashboard_bloc.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);

const defaultPadding = 16.0;

class Data {
  static List<String> getActions(Organization org, String crime) {
    List<String> list = [];
    for (CrimeAction c in org.crimeActions) {
      if (c.crime == crime) {
        list.add('${c.crime}: ${c.action}');
      }
    }

    return list;
  }

  // static String getPercentage(BuildContext context, String weedAction) {
  //   int percentage = 0;
  //   for (final c
  //       in context.read<DashboardBloc>().state.organization.crimeActions) {
  //     String name = '${c.crime}: ${c.action}';
  //     if (name == weedAction) {
  //       percentage = c.percentage;
  //     }
  //   }
  //   return percentage.toString();
  // }

  static String getPercentage(
    List<CrimeAction> crimeActionsList,
    String crimeActionName,
  ) {
    int percentage = 0;
    for (final c in crimeActionsList) {
      String name = '${c.crime}: ${c.action}';
      if (name == crimeActionName) {
        percentage = c.percentage;
      }
    }
    return percentage.toString();
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
