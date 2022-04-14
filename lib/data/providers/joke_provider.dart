import 'package:kate_test_task/data/models/joke_model.dart';
import 'package:kate_test_task/data/modules/joke_module.dart';

class JokeProvider {
  final _jokeModule = JokeModule();

  Future<JokeModel> getRandomJoke() => _jokeModule.getRandomJoke();
}
