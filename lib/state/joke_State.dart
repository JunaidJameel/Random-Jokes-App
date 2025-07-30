import 'package:random_jokes/model/joke_model.dart';

sealed class JokeState {}

class Loading extends JokeState {}

class Success extends JokeState {
  final JokeModel joke;
  Success(this.joke);
}

class Error extends JokeState {
  final String message;
  Error(this.message);
}
