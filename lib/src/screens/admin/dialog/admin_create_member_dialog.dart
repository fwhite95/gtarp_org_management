import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:org_management/src/blocs/admin/admin_bloc.dart';
import 'package:org_management/src/blocs/dialog/dialog_cubit.dart';
import 'package:org_management/src/screens/dashboard/components/dialog/dialog_text_field.dart';
import 'package:uuid/uuid.dart';

class AdminCreateMemberDialog extends StatefulWidget {
  const AdminCreateMemberDialog({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  State<AdminCreateMemberDialog> createState() =>
      _AdminCreateMemberDialogDialogState();
}

class _AdminCreateMemberDialogDialogState
    extends State<AdminCreateMemberDialog> {
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
                    value: state.rank.isEmpty
                        ? context
                            .read<AdminBloc>()
                            .state
                            .organization
                            .ranks
                            .first
                        : state.rank,
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
              print(widget.nameController.text);
              Navigator.pop(context, 'Cancel');
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              print(widget.nameController.text);
              Uuid uuid = const Uuid();
              Member newMember = Member(
                id: uuid.v4(),
                name: state.name,
                rank: state.rank.isEmpty
                    ? context.read<AdminBloc>().state.organization.ranks.first
                    : state.rank,
              );
              print(newMember);
              context.read<AdminBloc>().add(AdminCreateMemberEvent(newMember));

              Navigator.pop(context, 'Save');
            },
            child: const Text('Save'),
          ),
        ],
      );
    });
  }
}
