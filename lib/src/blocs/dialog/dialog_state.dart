part of 'dialog_cubit.dart';

enum DialogStatus {
  initial,
  submitting,
  success,
  error,
}

class DialogState extends Equatable {
  const DialogState({
    required this.name,
    required this.cook,
    required this.farmer,
    required this.rank,
    required this.weedAction,
    required this.moonshineAction,
    required this.heistAction,
    required this.theftAction,
    required this.cleaningAction,
    required this.bags,
    required this.people,
    required this.money,
    required this.status,
    required this.bottles,
    required this.objects,
    required this.action,
    required this.crime,
    required this.percentage,
  });

  final String name;
  final String cook;
  final String farmer;
  final String rank;
  final String weedAction;
  final String moonshineAction;
  final String heistAction;
  final String theftAction;
  final String cleaningAction;
  final String bags;
  final List<String> people;
  final String money;
  final DialogStatus status;
  final String bottles;
  final String objects;
  final String action;
  final String crime;
  final String percentage;

  factory DialogState.initial() {
    return const DialogState(
      name: '',
      cook: '',
      farmer: '',
      rank: '',
      weedAction: '',
      bags: '',
      people: [],
      money: '',
      status: DialogStatus.initial,
      bottles: '',
      objects: '',
      moonshineAction: '',
      heistAction: '',
      theftAction: '',
      cleaningAction: '',
      crime: '',
      action: '',
      percentage: '',
    );
  }

  DialogState copyWith({
    String? name,
    String? cook,
    String? farmer,
    String? rank,
    String? weedAction,
    String? moonshineAction,
    String? heistAction,
    String? theftAction,
    String? cleaningAction,
    String? bags,
    List<String>? people,
    String? money,
    DialogStatus? status,
    String? bottles,
    String? objects,
    String? crime,
    String? action,
    String? percentage,
  }) {
    return DialogState(
      name: name ?? this.name,
      cook: cook ?? this.cook,
      farmer: farmer ?? this.farmer,
      rank: rank ?? this.rank,
      weedAction: weedAction ?? this.weedAction,
      bags: bags ?? this.bags,
      people: people ?? this.people,
      money: money ?? this.money,
      status: status ?? this.status,
      bottles: bottles ?? this.bottles,
      objects: objects ?? this.objects,
      moonshineAction: moonshineAction ?? this.moonshineAction,
      heistAction: heistAction ?? this.heistAction,
      theftAction: theftAction ?? this.theftAction,
      cleaningAction: cleaningAction ?? this.cleaningAction,
      crime: crime ?? this.crime,
      action: action ?? this.action,
      percentage: percentage ?? this.percentage,
    );
  }

  @override
  List<Object> get props => [
        name,
        cook,
        farmer,
        rank,
        weedAction,
        bags,
        people,
        money,
        status,
        bottles,
        moonshineAction,
        heistAction,
        theftAction,
        cleaningAction,
        objects,
        crime,
        action,
        percentage,
      ];
}
