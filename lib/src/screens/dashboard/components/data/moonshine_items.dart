import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:org_management/constants.dart';
import 'package:org_management/src/blocs/dashboard/dashboard_bloc.dart';

class MoonshineItems extends StatelessWidget {
  const MoonshineItems({
    required this.items,
    super.key,
  });

  final List<MoonshineActivity> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Moonshine",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              columns: [
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
                  label: Text("Bottles"),
                ),
                DataColumn(
                  label: Text("Money"),
                ),
                DataColumn(
                  label: Text("Cook"),
                ),
                DataColumn(
                  label: Text("Farmer"),
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

DataRow recentFileDataRow(MoonshineActivity crime, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(Text(crime.name)),
      DataCell(Text(crime.rank)),
      DataCell(
          Text('${crime.date.month}/${crime.date.day}/${crime.date.year}')),
      DataCell(Text(crime.bottles)),
      DataCell(Text(crime.money)),
      DataCell(Text(crime.cook)),
      DataCell(Text(crime.farmer)),
      DataCell(Text(crime.percentage)),
      DataCell(
        const Icon(Icons.delete),
        onTap: () {
          context.read<DashboardBloc>().add(
                DashboardDeleteMoonshineActivity(crime),
              );
          context.read<DashboardBloc>().add(
                DashboardLoadMoonshine(crime.crimeId),
              );
        },
      ),
    ],
  );
}
