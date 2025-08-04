import 'package:flutter/material.dart';
import 'package:random_jokes/const/enum/joke_category.dart';

class JokeCategoryGradients {
  static List<Color> getGradient(JokeCategory category) {
    switch (category) {
      case JokeCategory.programming:
        return [
          Color(0xFFD0EBDD),
          Color(0xFFFFE0B2),
          Color(0xFFEBD4D4),
        ];
      case JokeCategory.general:
        return [
          Color(0xFFDDDAD0),
          Color(0xFFB3E5FC),
          Color(0xFF58A0C8),
        ];
      case JokeCategory.random:
        return [
          Color(0xFFF5CBCB),
          Color(0xFFFFEAEA),
          Color(0xFFB39DDB),
        ];
      case JokeCategory.knockKnock:
        return [
          Color(0xFFFFF9C4),
          Color(0xFFF9CB99),
          Color(0xFF689B8A),
        ];
    }
  }
}
