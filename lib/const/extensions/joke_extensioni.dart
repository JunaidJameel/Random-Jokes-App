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
