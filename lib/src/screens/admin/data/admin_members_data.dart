import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:org_management/constants.dart';

class AdminMembersData extends StatelessWidget {
  const AdminMembersData({
    required this.members,
    super.key,
  });

  final List<Member> members;

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
                  label: Text('Name'),
                ),
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
                members.length,
                (index) => itemsDataRow(members[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow itemsDataRow(Member member) {
    TextEditingController controller = TextEditingController();
    controller.text = member.name;
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(member.name),
                // child: TextField(
                //   controller: controller,
                //   decoration: InputDecoration(
                //     constraints: BoxConstraints.tightFor(
                //       width: 175,
                //     ),
                //   ),
                // ),
              ),
            ],
          ),
        ),
        DataCell(Text(member.rank)),
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

List<Member> testMembers = [
  const Member(
    id: '1234',
    name: 'Lang Buddha',
    rank: 'Don',
  ),
  const Member(
    id: '4567',
    name: 'Clark Mason',
    rank: 'Captain',
  ),
];
