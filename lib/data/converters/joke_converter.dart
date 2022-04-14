import 'package:kate_test_task/data/beans/joke_bean.dart';
import 'package:kate_test_task/data/models/joke_model.dart';

class JokeConverter {
  JokeModel toLocal(JokeBean jokeBean) {
    return JokeModel(
      id: jokeBean.id,
      type: jokeBean.type,
      setup: jokeBean.setup,
      punchline: jokeBean.punchline,
    );
  }

  JokeBean toExternal(JokeModel jokeBean) {
    return JokeBean(
      id: jokeBean.id,
      type: jokeBean.type,
      setup: jokeBean.setup,
      punchline: jokeBean.punchline,
    );
  }
}
