import 'package:equatable/equatable.dart';

class JokeModel extends Equatable {
  const JokeModel({
    this.id,
    this.type,
    this.setup,
    this.punchline,
  });

  final int? id;
  final String? type;
  final String? setup;
  final String? punchline;

  @override
  List<Object?> get props => [
        id,
        type,
        setup,
        punchline,
      ];
}
