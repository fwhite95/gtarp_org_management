import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:org_management/constants.dart';
import 'package:org_management/src/blocs/admin/admin_bloc.dart';
import 'package:org_management/src/screens/admin/dialog/admin_action_dialog.dart';

class AdminActionsData extends StatelessWidget {
  const AdminActionsData({
    required this.actions,
    super.key,
  });

  final List<CrimeAction> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Members",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              columns: const [
                DataColumn(
                  label: Text('Crime'),
                ),
                DataColumn(
                  label: Text('Action'),
                ),
                DataColumn(
                  label: Text('Percentage'),
                ),
                DataColumn(
                  label: Text('Edit'),
                ),
                DataColumn(
                  label: Text('Delete'),
                ),
              ],
              rows: List.generate(
                actions.length,
                (index) => itemsDataRow(actions[index], context, index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow itemsDataRow(
      CrimeAction crimeAction, BuildContext context, int index) {
    TextEditingController actionController =
        TextEditingController(text: crimeAction.action);
    TextEditingController percentageController =
        TextEditingController(text: crimeAction.percentage.toString());
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(crimeAction.crime),
              ),
            ],
          ),
        ),
        DataCell(Text(crimeAction.action)),
        DataCell(Text(crimeAction.percentage.toString())),
        DataCell(
          const Icon(Icons.edit),
          onTap: () {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  return AdminActionDialog(
                    crimeAction: crimeAction,
                    actionController: actionController,
                    percentageController: percentageController,
                    index: index,
                  );
                });
          },
        ),
        DataCell(
          const Icon(Icons.delete),
          onTap: () {
            context
                .read<AdminBloc>()
                .add(AdminDeleteCrimeActionEvent(crimeAction));
          },
        ),
      ],
    );
  }
}
