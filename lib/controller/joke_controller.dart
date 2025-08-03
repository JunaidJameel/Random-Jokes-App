import 'package:get/get.dart';
import 'package:random_jokes/services/joke_service.dart';
import 'package:random_jokes/state/joke_State.dart';
import 'package:random_jokes/model/joke_model.dart';

class JokeController extends GetxController {
  final JokeService _jokeService = JokeService();

  final Rxn<JokeState> state = Rxn<JokeState>();

  List<JokeModel> jokeHistory = [];

  int _currentIndex = 0;

  @override
  void onInit() {
    super.onInit();
    fetchJokeBatch(); // initially loads the first joke
  }

  void fetchJokeBatch() async {
    state.value = Loading();

    try {
      jokeHistory = await _jokeService.fetchMultipleJokes();
      _currentIndex = 0;
      _currentIndex++;
      state.value = Success(jokeHistory[_currentIndex]);
    } catch (e) {
      state.value = Error("Oops, couldn't load jokes");
    }
  }

  void nextJoke() {
    if (_currentIndex < jokeHistory.length - 1) {
      _currentIndex++;

      state.value = Success(jokeHistory[_currentIndex]);
    } else {
      // Re-fetch the next batch of jokes
      fetchJokeBatch();
    }
  }
}
