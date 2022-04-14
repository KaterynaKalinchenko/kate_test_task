import 'package:kate_test_task/data/converters/joke_converter.dart';
import 'package:kate_test_task/data/models/joke_model.dart';
import 'package:kate_test_task/data/network/joke_api.dart';

class JokeModule {
  final _jokeApi = JokeApi();
  final _jokeConv = JokeConverter();

  Future<JokeModel> getRandomJoke() =>
      _jokeApi.getRandomJoke().then(_jokeConv.toLocal);
}
