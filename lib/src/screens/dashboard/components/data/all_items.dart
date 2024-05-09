import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:org_management/constants.dart';

class AllItems extends StatelessWidget {
  const AllItems({
    required this.items,
    super.key,
  });

  final List<Crime> items;

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
            "All",
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
                  label: Text("Activity"),
                ),
                DataColumn(
                  label: Text("Produced"),
                ),
              ],
              rows: List.generate(
                items.length,
                (index) => itemsDataRow(items[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow itemsDataRow(Crime crime) {
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
      DataCell(Text(crime.activity)),
      DataCell(Text(crime.produced)),
    ],
  );
}
