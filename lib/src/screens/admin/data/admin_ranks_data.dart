import 'package:flutter/material.dart';
import 'package:org_management/constants.dart';

class AdminRanksData extends StatelessWidget {
  const AdminRanksData({
    required this.ranks,
    super.key,
  });

  final List<String> ranks;

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
            "Ranks",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              columns: const [
                DataColumn(
                  label: Text('Rank'),
                ),
                DataColumn(
                  label: Text('Edit'),
                ),
                DataColumn(
                  label: Text('Delete'),
                ),
              ],
              rows: List.generate(
                ranks.length,
                (index) => itemsDataRow(ranks[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow itemsDataRow(String rank) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(rank),
              ),
            ],
          ),
        ),
        //DataCell(Text(member.rank)),
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

List<String> testRanks = [
  'Don',
  'Captain',
];
