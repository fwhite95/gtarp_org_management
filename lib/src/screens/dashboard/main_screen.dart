import 'package:flutter/material.dart';
import 'package:org_management/src/screens/dashboard/dashboard_screen.dart';
import 'package:org_management/src/screens/dashboard/components/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              // default flex 1 so 1/6 part of the screen
              child: SideMenu(),
            ),
            Expanded(
              // takes 5/6 of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
