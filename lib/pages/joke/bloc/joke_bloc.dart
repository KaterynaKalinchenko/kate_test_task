import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kate_test_task/data/models/joke_model.dart';
import 'package:kate_test_task/data/providers/joke_provider.dart';
import 'package:kate_test_task/extensions/emitter_ext.dart';

part 'joke_event.dart';

part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  JokeBloc() : super(JokeInitial()) {
    on<GetJokeEvent>((event, emit) async => emit.async(_getRandomJoke()));
  }

  final _jokeProvider = JokeProvider();

  Stream<JokeState> _getRandomJoke() async* {
    yield ProgressState();
    try {
      yield await _jokeProvider.getRandomJoke().then(GotJokeState.new);
    } catch (e) {
      yield ErrorState();
    }
  }
}
