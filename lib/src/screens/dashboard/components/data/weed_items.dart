import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:org_management/constants.dart';
import 'package:org_management/src/blocs/dashboard/dashboard_bloc.dart';

class WeedItems extends StatelessWidget {
  const WeedItems({
    required this.items,
    super.key,
  });

  final List<WeedActivity> items;

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
            "Weed",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              columns: const [
                DataColumn(
                  label: Text("Name"),
                ),
                DataColumn(
                  label: Text("Rank"),
                ),
                DataColumn(
                  label: Text("Date"),
                ),
                DataColumn(
                  label: Text("Bags"),
                ),
                DataColumn(
                  label: Text("Money"),
                ),
                DataColumn(
                  label: Text("People"),
                ),
                DataColumn(
                  label: Text("Percentage"),
                ),
                DataColumn(
                  label: Text("Delete"),
                ),
              ],
              rows: List.generate(
                items.length,
                (index) => recentFileDataRow(items[index], context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(WeedActivity crime, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(Text(crime.name)),
      DataCell(Text(crime.rank)),
      DataCell(
          Text('${crime.date.month}/${crime.date.day}/${crime.date.year}')),
      DataCell(Text(crime.bags)),
      DataCell(Text(crime.money)),
      DataCell(Text(crime.people.toString())),
      DataCell(Text(crime.percentage)),
      DataCell(
        const Icon(Icons.delete),
        onTap: () {
          context.read<DashboardBloc>().add(
                DashboardDeleteWeedActivity(crime),
              );

          context.read<DashboardBloc>().add(
                DashboardLoadWeed(crime.crimeId),
              );
        },
      ),
    ],
  );
}
