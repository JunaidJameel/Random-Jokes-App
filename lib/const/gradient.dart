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
          Color(0xFFE1F5FE),
          Color(0xFFB3E5FC),
          Color(0xFF81D4FA),
        ];
      case JokeCategory.random:
        return [
          Color(0xFFEDE7F6),
          Color(0xFFD1C4E9),
          Color(0xFFB39DDB),
        ];
      case JokeCategory.knockKnock:
        return [
          Color(0xFFFFF9C4),
          Color(0xFFFFE082),
          Color(0xFFFF7043),
        ];
    }
  }
}
