import 'package:random_jokes/const/enum/joke_category.dart';

extension JokeCategoryExtension on JokeCategory {
  String get path {
    switch (this) {
      case JokeCategory.random:
        return 'random_ten';

      case JokeCategory.general:
        return 'jokes/general/ten';

      case JokeCategory.programming:
        return 'jokes/programming/ten';

      case JokeCategory.knockKnock:
        return 'jokes/knock-knock/ten';
    }
  }
}

extension JokeCategoryLabel on JokeCategory {
  String get label {
    switch (this) {
      case JokeCategory.random:
        return 'Random';
      case JokeCategory.general:
        return 'General';
      case JokeCategory.programming:
        return 'Programming';
      case JokeCategory.knockKnock:
        return 'Knock Knock';
    }
  }
}
