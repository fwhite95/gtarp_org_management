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
  });

  final String name;
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

  factory DialogState.initial() {
    return const DialogState(
      name: '',
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
    );
  }

  DialogState copyWith({
    String? name,
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
  }) {
    return DialogState(
      name: name ?? this.name,
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
    );
  }

  @override
  List<Object> get props => [
        name,
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
      ];
}
