import 'package:flutter/material.dart';
import 'package:org_management/constants.dart';
import 'package:org_management/src/screens/admin/dialog/admin_rank_dialog.dart';

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
                (index) => itemsDataRow(ranks[index], context, index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow itemsDataRow(String rank, BuildContext context, int index) {
    TextEditingController controller = TextEditingController(text: rank);
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
        DataCell(
          const Icon(Icons.edit),
          onTap: () {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  return AdminRankDialog(
                    rank: rank,
                    rankController: controller,
                    index: index,
                  );
                });
          },
        ),
        DataCell(
          const Icon(Icons.delete),
          onTap: () {},
        ),
      ],
    );
  }
}
