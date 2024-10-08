import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:org_management/constants.dart';
import 'package:org_management/src/blocs/dialog/dialog_cubit.dart';
import 'package:org_management/src/blocs/dashboard/dashboard_bloc.dart';
import 'package:org_management/src/screens/dashboard/components/dialog/dialog_text_field.dart';
import 'package:uuid/uuid.dart';

moonshineDialog({
  required BuildContext context,
  required TextEditingController nameController,
  required TextEditingController bottlesController,
  required TextEditingController moneyMadeController,
  required Uuid uuid,
  required Organization organization,
}) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => MoonshineAlertDialog(
      context: context,
      nameController: nameController,
      bottlesController: bottlesController,
      moneyMadeController: moneyMadeController,
      uuid: uuid,
      organization: organization,
    ),
  );
}

class MoonshineAlertDialog extends StatefulWidget {
  const MoonshineAlertDialog({
    super.key,
    required this.context,
    required this.nameController,
    required this.bottlesController,
    required this.moneyMadeController,
    required this.uuid,
    required this.organization,
  });

  final BuildContext context;
  final TextEditingController nameController;
  final TextEditingController bottlesController;
  final TextEditingController moneyMadeController;
  final Uuid uuid;
  final Organization organization;

  @override
  State<MoonshineAlertDialog> createState() => _MoonshineAlertDialogState();
}

class _MoonshineAlertDialogState extends State<MoonshineAlertDialog> {
  List<Widget> list = [];

  Widget getNameWidget(
    BuildContext context,
    List<String> nameList,
  ) {
    return Autocomplete<String>(
      optionsBuilder: (textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return nameList.where((String option) {
          return option
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        context.read<DialogCubit>().nameChanged(selection);
        Member member = widget.organization.members
            .firstWhere((element) => element.name == selection);
        context.read<DialogCubit>().rankChanged(member.rank);
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            child: SizedBox(
              height: 232,
              width: 232,
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final option = options.elementAt(index);

                  return ListTile(
                    title: Text(option),
                    onTap: () {
                      onSelected(option);
                    },
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: options.length,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget getCookWidget(
    BuildContext context,
    List<String> nameList,
  ) {
    return Autocomplete<String>(
      optionsBuilder: (textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return nameList.where((String option) {
          return option
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        context.read<DialogCubit>().cookChanged(selection);
        // Member member = widget.organization.members
        //     .firstWhere((element) => element.name == selection);
        // context.read<DialogCubit>().rankChanged(member.rank);
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            child: SizedBox(
              height: 232,
              width: 232,
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final option = options.elementAt(index);

                  return ListTile(
                    title: Text(option),
                    onTap: () {
                      onSelected(option);
                    },
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: options.length,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget getFarmerWidget(
    BuildContext context,
    List<String> nameList,
  ) {
    return Autocomplete<String>(
      optionsBuilder: (textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return nameList.where((String option) {
          return option
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        context.read<DialogCubit>().farmerChanged(selection);
        // Member member = widget.organization.members
        //     .firstWhere((element) => element.name == selection);
        // context.read<DialogCubit>().rankChanged(member.rank);
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            child: SizedBox(
              height: 232,
              width: 232,
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final option = options.elementAt(index);

                  return ListTile(
                    title: Text(option),
                    onTap: () {
                      onSelected(option);
                    },
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: options.length,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget getRankWidget(DialogState state) {
    return SizedBox(
      width: double.infinity,
      child: DropdownButton(
        value:
            state.rank.isEmpty ? widget.organization.ranks.first : state.rank,
        items: widget.organization.ranks
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
    );
  }

  Widget getActionWidget(DialogState state) {
    return SizedBox(
      width: double.infinity,
      child: DropdownButton(
        value: state.moonshineAction.isEmpty
            ? Data.getActions(widget.organization, 'Moonshine').first
            : state.moonshineAction,
        items: Data.getActions(widget.organization, 'Moonshine')
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          print(value);
          context.read<DialogCubit>().moonshineActionChanged(value!);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DialogCubit, DialogState>(
      builder: (context, state) {
        List<String> nameList = [];
        for (Member m
            in context.read<DashboardBloc>().state.organization.members) {
          nameList.add(m.name);
        }

        return AlertDialog(
          title: const Text('Create New Action'),
          content: SingleChildScrollView(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Repace textformfied with DropdownButton
                  const Text('Name: '),
                  getNameWidget(context, nameList),
                  const SizedBox(
                    height: 15,
                  ),

                  getRankWidget(state),
                  const SizedBox(
                    height: 15,
                  ),
                  // action
                  getActionWidget(state),
                  const SizedBox(
                    height: 15,
                  ),
                  DialogTextField(
                    controller: widget.bottlesController,
                    hint: 'Bottles',
                    changed: context.read<DialogCubit>().bottlesChanged,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('Cook: '),
                  getCookWidget(context, nameList),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('Farmer: '),
                  getFarmerWidget(context, nameList),
                  const SizedBox(
                    height: 15,
                  ),
                  DialogTextField(
                    controller: widget.moneyMadeController,
                    hint: 'Enter Money Made',
                    changed: context.read<DialogCubit>().moneyChanged,
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
                print(state);
                final list = context
                    .read<DashboardBloc>()
                    .state
                    .organization
                    .crimeActions;
                MoonshineActivity moonshineActivity = MoonshineActivity(
                  crimeId: widget.uuid.v4(),
                  activity: state.moonshineAction,
                  name: state.name,
                  rank: state.rank,
                  date: DateTime.now(),
                  produced: state.bottles,
                  bottles: state.bottles,
                  cook: state.cook,
                  farmer: state.farmer,
                  percentage: Data.getPercentage(list, state.moonshineAction),
                  money: state.money,
                );
                print(moonshineActivity);
                context
                    .read<DashboardBloc>()
                    .add(DashboardCreateMoonshineActivity(moonshineActivity));

                Navigator.pop(context, 'OK');
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
