import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:org_management/src/blocs/auth/auth_cubit.dart';
import 'package:org_management/src/blocs/weed_stats/weed_stats_bloc.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Icon(Icons.start),
          ),
          DrawerListTile(
            title: 'Dashboard',
            icon: Icons.dashboard,
            press: () {
              context.goNamed(
                'dashboard',
              );
            },
          ),
          DrawerListTile(
            title: 'Farming',
            icon: Icons.payment,
            press: () {
              String uid = context.read<AuthCubit>().state.uid;
              context.read<WeedStatsBloc>().add(WeedStatsLoadPayWeekEvent(
                    uid,
                  ));
              context.goNamed(
                'weed_stats',
              );
            },
          ),
          DrawerListTile(
            title: 'Cooking',
            icon: Icons.task,
            press: () {},
          ),
          DrawerListTile(
            title: 'Mechanic',
            icon: Icons.document_scanner,
            press: () {},
          ),
          DrawerListTile(
            title: 'Collection',
            icon: Icons.money,
            press: () {},
          ),
          DrawerListTile(
            title: 'Cleaning',
            icon: Icons.cleaning_services_outlined,
            press: () {},
          ),
          DrawerListTile(
            title: 'Admin',
            icon: Icons.admin_panel_settings,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.press,
    required this.icon,
  });

  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        size: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
