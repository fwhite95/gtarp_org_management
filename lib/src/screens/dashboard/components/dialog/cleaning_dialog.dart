import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:org_management/constants.dart';
import 'package:org_management/src/blocs/cubit/dialog_cubit.dart';
import 'package:org_management/src/blocs/dashboard/dashboard_bloc.dart';
import 'package:org_management/src/screens/dashboard/components/dialog/dialog_text_field.dart';
import 'package:uuid/uuid.dart';

cleaningDialog({
  required BuildContext context,
  required TextEditingController nameController,
  required TextEditingController moneyMadeController,
  required Uuid uuid,
  required Organization organization,
}) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => CleaningAlertDialog(
      context: context,
      nameController: nameController,
      moneyMadeController: moneyMadeController,
      uuid: uuid,
      organization: organization,
    ),
  );
}

class CleaningAlertDialog extends StatefulWidget {
  const CleaningAlertDialog({
    super.key,
    required this.context,
    required this.nameController,
    required this.moneyMadeController,
    required this.uuid,
    required this.organization,
  });

  final BuildContext context;
  final TextEditingController nameController;
  final TextEditingController moneyMadeController;
  final Uuid uuid;
  final Organization organization;

  @override
  State<CleaningAlertDialog> createState() => _CleaningAlertDialogState();
}

class _CleaningAlertDialogState extends State<CleaningAlertDialog> {
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
        value: state.cleaningAction.isEmpty
            ? Data.getActions(widget.organization, 'Cleaning').first
            : state.cleaningAction,
        items: Data.getActions(widget.organization, 'Cleaning')
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          print(value);
          context.read<DialogCubit>().cleaningActionChanged(value!);
        },
      ),
    );
  }

  Widget getPeopleWidget(List<String> nameList) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Add People: '),
          const SizedBox(
            height: 15,
          ),
          IconButton(
            onPressed: () {
              // Add people
              setState(() {
                list.add(
                  Autocomplete<String>(
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
                      context.read<DialogCubit>().peopleChanged(selection);
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
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemCount: options.length,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              });

              context.read<DialogCubit>().peopleWidgetChanged();
              print(list);
            },
            icon: const Icon(Icons.add),
          ),
        ],
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
          key: const Key('Cleaning_dialog'),
          title: const Text('Create New Action'),
          content: SingleChildScrollView(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // getName
                  getNameWidget(context, nameList),
                  const SizedBox(
                    height: 15,
                  ),
                  // getRank
                  getRankWidget(state),
                  const SizedBox(
                    height: 15,
                  ),
                  // getAction
                  getActionWidget(state),
                  const SizedBox(
                    height: 15,
                  ),
                  // Add people
                  // IconButton either creates new popup with list of people
                  // Or I create a new TextFormField to type/search
                  getPeopleWidget(nameList),
                  // Percentage

                  const SizedBox(
                    height: 15,
                  ),
                  // Added name list
                  Container(
                    child: Column(
                      children: list,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Money made
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
                context.read<DialogCubit>().peopleReset();
                Navigator.pop(context, 'Cancel');
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                print(state);
                CleaningActivity cleaningActivity = CleaningActivity(
                  crimeId: widget.uuid.v4(),
                  activity: state.cleaningAction,
                  name: state.name,
                  rank: state.rank,
                  date: DateTime.now(),
                  produced: state.money,
                  people: state.people,
                  percentage: '',
                  money: state.money,
                );
                print(cleaningActivity);
                context
                    .read<DashboardBloc>()
                    .add(DashboardCreateCleaningActivity(cleaningActivity));
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
