import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:org_management/src/blocs/admin/admin_bloc.dart';
import 'package:org_management/src/blocs/dialog/dialog_cubit.dart';
import 'package:org_management/src/screens/dashboard/components/dialog/dialog_text_field.dart';

class AdminRankDialog extends StatefulWidget {
  const AdminRankDialog({
    super.key,
    required this.rank,
    required this.rankController,
    required this.index,
  });

  final String rank;
  final TextEditingController rankController;
  final int index;

  @override
  State<AdminRankDialog> createState() => _AdminRankDialogState();
}

class _AdminRankDialogState extends State<AdminRankDialog> {
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
              Navigator.pop(context, 'Cancel');
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<AdminBloc>().add(AdminSaveRankEvent(
                    state.rank,
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
