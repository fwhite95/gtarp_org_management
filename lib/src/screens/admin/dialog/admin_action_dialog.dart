import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:org_management/src/blocs/admin/admin_bloc.dart';
import 'package:org_management/src/blocs/dialog/dialog_cubit.dart';
import 'package:org_management/src/screens/dashboard/components/dialog/dialog_text_field.dart';

class AdminActionDialog extends StatefulWidget {
  const AdminActionDialog({
    super.key,
    required this.crimeAction,
    required this.actionController,
    required this.percentageController,
    required this.index,
  });

  final CrimeAction crimeAction;
  final TextEditingController actionController;

  final TextEditingController percentageController;
  final int index;

  @override
  State<AdminActionDialog> createState() => _AdminActionDialogState();
}

class _AdminActionDialogState extends State<AdminActionDialog> {
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
                Text(
                  widget.crimeAction.crime,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 15,
                ),
                DialogTextField(
                  controller: widget.actionController,
                  hint: 'Action',
                  changed: context.read<DialogCubit>().actionChanged,
                ),
                const SizedBox(
                  height: 15,
                ),
                DialogTextField(
                  controller: widget.percentageController,
                  hint: 'Percentage',
                  changed: context.read<DialogCubit>().percentageChanged,
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
              Navigator.pop(context, 'Cancel');
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              print(widget.actionController.text);
              CrimeAction editedCrimeAction = CrimeAction(
                crime: widget.crimeAction.crime,
                action: state.action.isEmpty
                    ? widget.crimeAction.action
                    : state.action,
                percentage: state.percentage.isEmpty
                    ? widget.crimeAction.percentage
                    : int.parse(state.percentage),
              );

              context.read<AdminBloc>().add(AdminSaveCrimeActionEvent(
                    editedCrimeAction,
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
