import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:org_management/constants.dart';
import 'package:org_management/src/blocs/admin/admin_bloc.dart';
import 'package:org_management/src/screens/admin/dialog/admin_member_dialog.dart';

class AdminMembersData extends StatefulWidget {
  const AdminMembersData({
    required this.members,
    super.key,
  });

  final List<Member> members;

  @override
  State<AdminMembersData> createState() => _AdminMembersDataState();
}

class _AdminMembersDataState extends State<AdminMembersData> {
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
                  widget.members.length,
                  (index) =>
                      itemsDataRow(widget.members[index], context, index)),
            ),
          ),
        ],
      ),
    );
  }

  DataRow itemsDataRow(Member member, BuildContext context, int index) {
    TextEditingController controller = TextEditingController(text: member.name);
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(member.name),
              ),
            ],
          ),
        ),
        DataCell(Text(member.rank)),
        DataCell(
          const Icon(Icons.edit),
          onTap: () {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  return AdminMemberDialog(
                    member: member,
                    nameController: controller,
                    index: index,
                  );
                });
          },
        ),
        DataCell(
          const Icon(Icons.delete),
          onTap: () {
            context.read<AdminBloc>().add(AdminDeleteMemberEvent(member));
          },
        ),
      ],
    );
  }
}
