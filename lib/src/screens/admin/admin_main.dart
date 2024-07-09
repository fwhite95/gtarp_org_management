import 'package:flutter/material.dart';
import 'package:org_management/src/screens/admin/admin_screen.dart';
import 'package:org_management/src/screens/dashboard/components/side_menu.dart';

class AdminMain extends StatelessWidget {
  const AdminMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SideMenu(),
            ),
            Expanded(
              flex: 5,
              child: AdminScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
