import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:org_management/constants.dart';
import 'package:org_management/src/blocs/dashboard/dashboard_bloc.dart';
import 'package:org_management/src/screens/dashboard/components/dialog/dialog_widget.dart';

class ButtonRow extends StatefulWidget {
  const ButtonRow({super.key});

  @override
  State<ButtonRow> createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  String crime = 'All';

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
                getDialog(
                  context,
                  context.read<DashboardBloc>().state.organization,
                );
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
            // All
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding,
                ),
              ),
              onPressed: () {
                crime = 'All';
                context.read<DashboardBloc>().add(const DashboardLoadEvent());
              },
              icon: const Icon(Icons.all_inbox),
              label: const Text("All"),
            ),
            // Weed
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding,
                ),
              ),
              onPressed: () {
                crime = 'Weed';
                context.read<DashboardBloc>().add(DashboardLoadWeed(crime));
              },
              icon: const Icon(Icons.forest),
              label: const Text("Weed"),
            ),
            // Moonshine
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding,
                ),
              ),
              onPressed: () {
                crime = 'Moonshine';
                context
                    .read<DashboardBloc>()
                    .add(DashboardLoadMoonshine(crime));
              },
              icon: const Icon(Icons.local_drink),
              label: const Text("Moonshine"),
            ),
            // Theft
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding,
                ),
              ),
              onPressed: () {
                crime = 'Theft';
                context.read<DashboardBloc>().add(DashboardLoadTheft(crime));
              },
              icon: const Icon(Icons.radio),
              label: const Text("Theft"),
            ),
            // Heist
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding,
                ),
              ),
              onPressed: () {
                crime = 'Heist';
                context.read<DashboardBloc>().add(DashboardLoadHeist(crime));
              },
              icon: const Icon(Icons.money),
              label: const Text("Heist"),
            ),
            // Cleaning
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding,
                ),
              ),
              onPressed: () {
                crime = 'Cleaning';
                context.read<DashboardBloc>().add(DashboardLoadCleaning(crime));
              },
              icon: const Icon(Icons.cleaning_services_outlined),
              label: const Text("Cleaning"),
            ),
          ],
        ),
      ],
    );
  }
}
