import 'package:dio/dio.dart';
import 'package:kate_test_task/data/beans/joke_bean.dart';

class JokeApi {
  static const _randomJokeUrl = 'https://joke.api.gkamelo.xyz/random';
  static const _apiKey = 'QUtFhHPnlQ5f13LDVpQL3a54XgQzTlCJa1PMSB3o';
  static const _apiKeyHeader = 'x-api-key';

  final _dio = Dio(
    BaseOptions(
      headers: {
        _apiKeyHeader: _apiKey,
      },
    ),
  );

  Future<JokeBean> getRandomJoke() async {
    final response = await _dio.get(_randomJokeUrl);

    return JokeBean.fromJson(response.data);
  }
}
