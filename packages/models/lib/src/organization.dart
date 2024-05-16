import 'package:equatable/equatable.dart';
import 'package:models/models.dart';

class Organization extends Equatable {
  final String id;
  final String name;
  final List<Member> members;
  final List<String> ranks;
  final List<CrimeActions> crimeActions;

  const Organization({
    required this.id,
    required this.name,
    required this.members,
    required this.ranks,
    required this.crimeActions,
  });

  Organization copyWith({
    String? id,
    String? name,
    List<Member>? members,
    List<String>? ranks,
    List<CrimeActions>? crimeActions,
  }) {
    return Organization(
      id: id ?? this.id,
      name: name ?? this.name,
      members: members ?? this.members,
      ranks: ranks ?? this.ranks,
      crimeActions: crimeActions ?? this.crimeActions,
    );
  }

  factory Organization.fromJson(Map<String, dynamic> json) {
    List<Member> memberList = [];
    for (Map<String, dynamic> m in json['members']) {
      memberList.add(Member.fromJson(m));
    }

    List<String> rankList = [];
    for (String r in json['ranks']) {
      rankList.add(r);
    }

    List<CrimeActions> crimeActionList = [];
    for (Map<String, dynamic> c in json['crimeActions']) {
      crimeActionList.add(CrimeActions.fromJson(c));
    }

    return Organization(
      id: json['id'],
      name: json['name'] ?? '',
      members: memberList,
      ranks: rankList,
      crimeActions: crimeActionList,
    );
  }

  Map<String, dynamic> toJson() {
    final memberList = [];
    for (Member m in members) {
      memberList.add(m.toJson());
    }

    final crimeActionList = [];
    for (CrimeActions c in crimeActions) {
      crimeActionList.add(c.toJson());
    }

    return {
      'id': id,
      'name': name,
      'members': memberList,
      'ranks': ranks,
      'crimeActions': crimeActionList,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        members,
        ranks,
        crimeActions,
      ];

  static List<Organization> orgSampleData = [
    Organization(
      id: 'S6IFMVGBXghqaQ2lTF74Y9fpinr2',
      name: 'Cypranos',
      members: Member.getMemberSameple(),
      ranks: const [
        'Associate',
        'Bought In',
        'Soldier',
        'Specialist',
        'Captain',
        'Bookkeeper',
        'Advisor',
        'Underboss',
        'Don',
      ],
      crimeActions: CrimeActions.crimeActionsSampleData,
    ),
  ];
}
