import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:org_management/src/blocs/admin/admin_bloc.dart';
import 'package:org_management/src/blocs/dialog/dialog_cubit.dart';
import 'package:org_management/src/screens/dashboard/components/dialog/dialog_text_field.dart';
import 'package:uuid/uuid.dart';

class AdminCreateRankDialog extends StatefulWidget {
  const AdminCreateRankDialog({
    super.key,
    required this.rankController,
  });

  final TextEditingController rankController;

  @override
  State<AdminCreateRankDialog> createState() => _AdminCreateRankDialogState();
}

class _AdminCreateRankDialogState extends State<AdminCreateRankDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DialogCubit, DialogState>(builder: (context, state) {
      return AlertDialog(
        title: const Text('Edit Rank'),
        content: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DialogTextField(
                  controller: widget.rankController,
                  hint: 'Rank',
                  changed: context.read<DialogCubit>().rankChanged,
                ),
                const SizedBox(
                  height: 15,
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
              print(widget.rankController.text);
              Navigator.pop(context, 'Cancel');
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              print(widget.rankController.text);
              context.read<AdminBloc>().add(AdminCreateRankEvent(state.rank));

              Navigator.pop(context, 'Save');
            },
            child: const Text('Save'),
          ),
        ],
      );
    });
  }
}
