import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:org_management/constants.dart';
import 'package:org_management/src/blocs/dashboard/dashboard_bloc.dart';
import 'package:org_management/src/screens/dashboard/components/data/cleaning_items.dart';
import 'package:org_management/src/screens/dashboard/components/data/heist_items.dart';
import 'package:org_management/src/screens/dashboard/components/data/moonshine_items.dart';
import 'package:org_management/src/screens/dashboard/components/data/theft_items.dart';
import 'package:org_management/src/screens/dashboard/components/data/weed_items.dart';
import 'package:org_management/src/screens/dashboard/components/header.dart';
import 'package:org_management/src/screens/dashboard/components/button_row.dart';
import 'package:org_management/src/screens/dashboard/components/data/all_items.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Widget getItemsDashboard(DashboardStatus status, DashboardState state) {
    if (status == DashboardStatus.loaded) {
      return AllItems(
        items: state.activities,
      );
    } else if (state.status == DashboardStatus.weed) {
      return WeedItems(
        items: state.activities as List<WeedActivity>,
      );
    } else if (state.status == DashboardStatus.moonshine) {
      return MoonshineItems(
        items: state.activities as List<MoonshineActivity>,
      );
    } else if (state.status == DashboardStatus.heist) {
      return HeistItems(
        items: state.activities as List<HeistActivity>,
      );
    } else if (state.status == DashboardStatus.theft) {
      return TheftItems(
        items: state.activities as List<TheftActivity>,
      );
    } else if (state.status == DashboardStatus.cleaning) {
      return CleaningItems(
        items: state.activities as List<CleaningActivity>,
      );
    } else {
      return const Center(
        child: Text('Something went wrong'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
      if (state.status == DashboardStatus.loading ||
          state.status == DashboardStatus.intial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              const Header(),
              const SizedBox(
                height: defaultPadding,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        const ButtonRow(),
                        const SizedBox(
                          height: defaultPadding,
                        ),
                        getItemsDashboard(state.status, state),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
