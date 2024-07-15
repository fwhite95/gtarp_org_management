import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:org_management/src/blocs/admin/admin_bloc.dart';
import 'package:org_management/src/blocs/dialog/dialog_cubit.dart';
import 'package:org_management/src/screens/dashboard/components/dialog/dialog_text_field.dart';

class AdminCreateCrimeActionDialog extends StatefulWidget {
  const AdminCreateCrimeActionDialog({
    super.key,
    required this.actionController,
    required this.percentageController,
  });

  final TextEditingController actionController;
  final TextEditingController percentageController;

  @override
  State<AdminCreateCrimeActionDialog> createState() =>
      _AdminCreateCrimeActionDialogState();
}

class _AdminCreateCrimeActionDialogState
    extends State<AdminCreateCrimeActionDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DialogCubit, DialogState>(builder: (context, state) {
      List<String> crimeList = context
          .read<AdminBloc>()
          .state
          .organization
          .crimeActions
          .map((value) => value.crime)
          .toList();
      crimeList = crimeList.toSet().toList();
      return AlertDialog(
        title: const Text('Edit Rank'),
        content: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: state.crime.isEmpty ? crimeList.first : state.crime,
                    items:
                        crimeList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      print(value);
                      context.read<DialogCubit>().crimeChanged(value!);
                    },
                  ),
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
              Navigator.pop(context, 'Cancel');
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              CrimeAction newCrimeAction = CrimeAction(
                crime: state.crime,
                action: state.action.isEmpty ? '' : state.action,
                percentage:
                    state.percentage.isEmpty ? 0 : int.parse(state.percentage),
              );

              context.read<AdminBloc>().add(AdminCreateCrimeActionEvent(
                    newCrimeAction,
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
