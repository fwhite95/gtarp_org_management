import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:org_management/constants.dart';

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
                (index) => itemsDataRow(actions[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow itemsDataRow(CrimeAction action) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(action.crime),
              ),
            ],
          ),
        ),
        DataCell(Text(action.action)),
        DataCell(Text(action.percentage.toString())),
        DataCell(
          const Icon(Icons.edit),
          onTap: () {},
        ),
        DataCell(
          const Icon(Icons.delete),
          onTap: () {},
        ),
      ],
    );
  }
}
