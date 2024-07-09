import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:org_management/constants.dart';
import 'package:org_management/src/blocs/admin/admin_bloc.dart';
import 'package:org_management/src/screens/admin/admin_button_row.dart';
import 'package:org_management/src/screens/admin/data/admin_actions_data.dart';
import 'package:org_management/src/screens/admin/data/admin_members_data.dart';
import 'package:org_management/src/screens/admin/data/admin_ranks_data.dart';
import 'package:org_management/src/screens/dashboard/components/header.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  Widget getAdminItems(AdminState state) {
    switch (state.status) {
      case AdminStatus.members:
        return AdminMembersData(
          members: state.organization.members,
        );
      case AdminStatus.ranks:
        return AdminRanksData(
          ranks: state.organization.ranks,
        );
      case AdminStatus.actions:
        return AdminActionsData(
          actions: state.organization.crimeActions,
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminBloc, AdminState>(
      builder: (context, state) {
        if (state.status == AdminStatus.loading) {
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
                      //flex: 5,
                      child: Column(
                        children: [
                          const AdminButtonRow(),
                          const SizedBox(
                            height: defaultPadding,
                          ),
                          // AdminMembersData(
                          //   members: [],
                          // ),
                          getAdminItems(state),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
