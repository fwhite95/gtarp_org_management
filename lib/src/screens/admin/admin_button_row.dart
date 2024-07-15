import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:org_management/constants.dart';
import 'package:org_management/src/blocs/admin/admin_bloc.dart';
import 'package:org_management/src/blocs/dashboard/dashboard_bloc.dart';
import 'package:org_management/src/screens/dashboard/components/dialog/dialog_widget.dart';

class AdminButtonRow extends StatefulWidget {
  const AdminButtonRow({super.key});

  @override
  State<AdminButtonRow> createState() => _AdminButtonRowState();
}

class _AdminButtonRowState extends State<AdminButtonRow> {
  String selection = 'Members';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Options: ",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding,
                ),
              ),
              onPressed: () {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) {
                      return getAdminDialog(context);
                    });
              },
              icon: const Icon(Icons.add),
              label: const Text("Add New"),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding,
                ),
              ),
              onPressed: () {
                selection = 'Members';
                context.read<AdminBloc>().add(AdminLoadMembers(
                    context.read<DashboardBloc>().state.organization,
                    selection));
              },
              icon: const Icon(Icons.people),
              label: const Text("Members"),
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding,
                ),
              ),
              onPressed: () {
                selection = 'Ranks';

                context.read<AdminBloc>().add(AdminLoadRanks(
                    context.read<DashboardBloc>().state.organization,
                    selection));
              },
              icon: const Icon(Icons.people),
              label: const Text("Ranks"),
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding,
                ),
              ),
              onPressed: () {
                selection = 'Actions';
                context.read<AdminBloc>().add(AdminLoadActions(
                    context.read<DashboardBloc>().state.organization,
                    selection));
              },
              icon: const Icon(Icons.people),
              label: const Text("Actions"),
            ),
          ],
        ),
      ],
    );
  }
}
