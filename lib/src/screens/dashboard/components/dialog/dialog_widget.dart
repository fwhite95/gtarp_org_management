import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:org_management/src/blocs/dashboard/dashboard_bloc.dart';
import 'package:org_management/src/screens/dashboard/components/dialog/cleaning_dialog.dart';
import 'package:org_management/src/screens/dashboard/components/dialog/heist_dialog.dart';
import 'package:org_management/src/screens/dashboard/components/dialog/moonshine_dialog.dart';
import 'package:org_management/src/screens/dashboard/components/dialog/theft_dialog.dart';
import 'package:org_management/src/screens/dashboard/components/dialog/weed_dialog.dart';
import 'package:uuid/uuid.dart';

getDialog(BuildContext context, Organization org) {
  TextEditingController nameController = TextEditingController();
  TextEditingController itemController = TextEditingController();
  TextEditingController moneyMadeController = TextEditingController();
  const Uuid uuid = Uuid();
  final String crime = context.read<DashboardBloc>().state.crimeTag;

  switch (crime) {
    case 'Weed':
      return weedDialog(
        context: context,
        nameController: nameController,
        bagsController: itemController,
        moneyMadeController: moneyMadeController,
        uuid: uuid,
        organization: org,
      );
    case 'Moonshine':
      return moonshineDialog(
        context: context,
        nameController: nameController,
        bottlesController: itemController,
        moneyMadeController: moneyMadeController,
        uuid: uuid,
        organization: org,
      );
    case 'Heist':
      return heistDialog(
        context: context,
        nameController: nameController,
        moneyMadeController: moneyMadeController,
        uuid: uuid,
        organization: org,
      );
    case 'Theft':
      return theftDialog(
        context: context,
        nameController: nameController,
        objectController: itemController,
        moneyMadeController: moneyMadeController,
        uuid: uuid,
        organization: org,
      );
    case 'Cleaning':
      return cleaningDialog(
        context: context,
        nameController: nameController,
        moneyMadeController: moneyMadeController,
        uuid: uuid,
        organization: org,
      );
    default:
      return;
  }
}
