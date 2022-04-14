part of 'joke_bloc.dart';

abstract class JokeState extends Equatable {
  const JokeState();

  @override
  List<Object> get props => [];
}

class JokeInitial extends JokeState {}

class ProgressState extends JokeState {}

class ErrorState extends JokeState {}

class GotJokeState extends JokeState {
  const GotJokeState(this.joke);

  final JokeModel joke;

  @override
  List<Object> get props => [joke];
}
