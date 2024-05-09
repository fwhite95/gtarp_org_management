import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Member extends Equatable {
  final String id;
  final String name;
  final String rank;

  const Member({
    required this.id,
    required this.name,
    required this.rank,
  });

  Member copyWith({
    String? id,
    String? name,
    String? rank,
  }) {
    return Member(
      id: id ?? this.id,
      name: name ?? this.name,
      rank: rank ?? this.rank,
    );
  }

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'],
      name: json['name'] ?? '',
      rank: json['rank'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'rank': rank,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        rank,
      ];

  static getMemberSameple() {
    Uuid uuid = const Uuid();
    List<Member> memberSampleData = [
      Member(
        id: uuid.v4(),
        name: 'Lang Buddha',
        rank: 'Don',
      ),
      Member(
        id: uuid.v4(),
        name: 'Arush',
        rank: 'Don',
      ),
      Member(
        id: uuid.v4(),
        name: 'Luciano DiCenzo',
        rank: 'Don',
      ),
      Member(
        id: uuid.v4(),
        name: 'Tony Coreleone',
        rank: 'Don',
      ),
      Member(
        id: uuid.v4(),
        name: 'Harry Brown',
        rank: 'Don',
      ),
      Member(
        id: uuid.v4(),
        name: 'Giovanna Gambino',
        rank: 'Treasurer',
      ),
      Member(
        id: uuid.v4(),
        name: 'Marty Banks',
        rank: 'Captain',
      ),
      Member(
        id: uuid.v4(),
        name: 'Clark Mason',
        rank: 'Captain',
      ),
      Member(
        id: uuid.v4(),
        name: 'Teddy Bosco',
        rank: 'Captain',
      ),
      Member(
        id: uuid.v4(),
        name: 'Vito DiCenzo',
        rank: 'Captain',
      ),
      Member(
        id: uuid.v4(),
        name: 'Yuno Sykk',
        rank: 'Specialist',
      ),
      Member(
        id: uuid.v4(),
        name: 'Octo S',
        rank: 'Specialist',
      ),
      Member(
        id: uuid.v4(),
        name: 'Larry Knox',
        rank: 'Bought In',
      ),
      Member(
        id: uuid.v4(),
        name: 'Simon Cunningham',
        rank: 'Bought In',
      ),
      Member(
        id: uuid.v4(),
        name: 'Ilya K',
        rank: 'Bought In',
      ),
      Member(
        id: uuid.v4(),
        name: 'Leon Edwards',
        rank: 'Bought In',
      ),
      Member(
        id: uuid.v4(),
        name: 'Donnie Jones',
        rank: 'Bought In',
      ),
      Member(
        id: uuid.v4(),
        name: 'Matteo S',
        rank: 'Bought In',
      ),
      Member(
        id: uuid.v4(),
        name: 'Tommy DeVito',
        rank: 'Bought In',
      ),
      Member(
        id: uuid.v4(),
        name: 'Santana',
        rank: 'Associate',
      ),
      Member(
        id: uuid.v4(),
        name: 'Beau B',
        rank: 'Associate',
      ),
      Member(
        id: uuid.v4(),
        name: 'Jacyn',
        rank: 'Associate',
      ),
    ];
    return memberSampleData;
  }
}
