import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:org_management/src/repositories/weed_repository.dart';

part 'dialog_state.dart';

class DialogCubit extends Cubit<DialogState> {
  final WeedRepository _weedRepository;

  DialogCubit({required WeedRepository weedRepository})
      : _weedRepository = weedRepository,
        super(DialogState.initial());

  void nameChanged(String value) {
    emit(state.copyWith(name: value, status: DialogStatus.initial));
  }

  void nameReset(String value) {
    emit(state.copyWith(name: value, status: DialogStatus.initial));
  }

  void rankChanged(String value) {
    emit(state.copyWith(rank: value, status: DialogStatus.initial));
  }

  void weedActionChanged(String value) {
    emit(state.copyWith(weedAction: value, status: DialogStatus.initial));
  }

  void moonshineActionChanged(String value) {
    emit(state.copyWith(moonshineAction: value, status: DialogStatus.initial));
  }

  void heistActionChanged(String value) {
    emit(state.copyWith(heistAction: value, status: DialogStatus.initial));
  }

  void theftActionChanged(String value) {
    emit(state.copyWith(theftAction: value, status: DialogStatus.initial));
  }

  void cleaningActionChanged(String value) {
    emit(state.copyWith(cleaningAction: value, status: DialogStatus.initial));
  }

  void bagsChanged(String value) {
    emit(state.copyWith(bags: value, status: DialogStatus.initial));
  }

  void peopleChanged(String value) {
    List<String> list = [];
    for (String p in state.people) {
      list.add(p);
    }

    list.add(value);

    emit(state.copyWith(people: list, status: DialogStatus.initial));
  }

  void peopleReset() {
    emit(state.copyWith(people: [], status: DialogStatus.initial));
  }

  void moneyChanged(String value) {
    emit(state.copyWith(money: value, status: DialogStatus.initial));
  }

  void bottlesChanged(String value) {
    emit(state.copyWith(bottles: value, status: DialogStatus.initial));
  }

  void objectsChanged(String value) {
    emit(state.copyWith(objects: value, status: DialogStatus.initial));
  }

  void peopleWidgetChanged() {
    emit(state.copyWith(status: DialogStatus.initial));
  }

  void crimeChanged(String value) {
    emit(state.copyWith(crime: value, status: DialogStatus.initial));
  }

  void actionChanged(String value) {
    emit(state.copyWith(action: value, status: DialogStatus.initial));
  }

  void percentageChanged(String value) {
    emit(state.copyWith(percentage: value, status: DialogStatus.initial));
  }
}
