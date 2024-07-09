import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:org_management/constants.dart';
import 'package:org_management/src/blocs/admin/admin_bloc.dart';
import 'package:org_management/src/blocs/auth/auth_cubit.dart';
import 'package:org_management/src/blocs/dashboard/dashboard_bloc.dart';

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
              onPressed: () {},
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
                    context.read<DashboardBloc>().state.organization));
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
                // context
                //     .read<AdminBloc>()
                //     .add(AdminLoadEvent(context.read<AuthCubit>().state.uid));
                context.read<AdminBloc>().add(AdminLoadRanks(
                    context.read<DashboardBloc>().state.organization));

                // context
                //     .read<AdminBloc>()
                //     .add(AdminLoadMembers('YNOzPInJtURUjhCluLS4PwUBK4Q2'));
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
                    context.read<DashboardBloc>().state.organization));
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
