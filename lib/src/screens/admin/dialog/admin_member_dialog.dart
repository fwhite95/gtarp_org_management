import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:org_management/src/blocs/admin/admin_bloc.dart';
import 'package:org_management/src/blocs/dialog/dialog_cubit.dart';
import 'package:org_management/src/screens/dashboard/components/dialog/dialog_text_field.dart';

class AdminMemberDialog extends StatefulWidget {
  const AdminMemberDialog({
    super.key,
    required this.member,
    required this.nameController,
    required this.index,
  });

  final Member member;
  final TextEditingController nameController;
  final int index;

  @override
  State<AdminMemberDialog> createState() => _AdminMemberDialogState();
}

class _AdminMemberDialogState extends State<AdminMemberDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DialogCubit, DialogState>(builder: (context, state) {
      return AlertDialog(
        title: const Text('Edit Member'),
        content: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DialogTextField(
                  controller: widget.nameController,
                  hint: 'Name',
                  changed: context.read<DialogCubit>().nameChanged,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: state.rank.isEmpty ? widget.member.rank : state.rank,
                    items: context
                        .read<AdminBloc>()
                        .state
                        .organization
                        .ranks
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      print(value);
                      context.read<DialogCubit>().rankChanged(value!);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // widget.nameController.text = widget.member.name;
              // context.read<DialogCubit>().nameReset(widget.member.name);
              print(widget.nameController.text);
              Navigator.pop(context, 'Cancel');
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              print(widget.nameController.text);
              Member changedMember = Member(
                id: widget.member.id,
                name: state.name.isEmpty ? widget.member.name : state.name,
                rank: state.rank.isEmpty ? widget.member.rank : state.rank,
              );
              print(changedMember);
              context.read<AdminBloc>().add(AdminSaveMemberEvent(
                    changedMember,
                    widget.index,
                  ));

              Navigator.pop(context, 'Save');
            },
            child: const Text('Save'),
          ),
        ],
      );
    });
  }
}
