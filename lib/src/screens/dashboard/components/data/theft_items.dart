import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:org_management/constants.dart';
import 'package:org_management/src/blocs/dashboard/dashboard_bloc.dart';

class TheftItems extends StatelessWidget {
  const TheftItems({
    required this.items,
    super.key,
  });

  final List<TheftActivity> items;

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
            "Theft",
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
                  label: Text("# of Objects"),
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
                (index) => itemsDataRow(
                  items[index],
                  context,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow itemsDataRow(TheftActivity crime, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(crime.name),
            ),
          ],
        ),
      ),
      DataCell(Text(crime.rank)),
      DataCell(
          Text('${crime.date.month}/${crime.date.day}/${crime.date.year}')),
      DataCell(Text(crime.objects)),
      DataCell(Text(crime.money)),
      DataCell(Text(crime.people.toString())),
      DataCell(Text(crime.percentage)),
      DataCell(
        const Icon(Icons.delete),
        onTap: () {
          context.read<DashboardBloc>().add(
                DashboardDeleteTheftActivity(crime),
              );

          context.read<DashboardBloc>().add(
                DashboardLoadTheft(crime.crimeId),
              );
        },
      ),
    ],
  );
}
