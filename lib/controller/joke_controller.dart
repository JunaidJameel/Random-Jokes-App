import 'package:get/get.dart';
import 'package:random_jokes/services/joke_service.dart';
import 'package:random_jokes/state/joke_State.dart';
import 'package:random_jokes/model/joke_model.dart';

class JokeController extends GetxController {
  final JokeService _jokeService = JokeService();

  final Rxn<JokeState> state = Rxn<JokeState>();

  final List<JokeModel> _jokeHistory = [];
  int _currentIndex = -1;

  @override
  void onInit() {
    super.onInit();
    fetchJoke(); // initially loads the first joke
  }

  void fetchJoke() async {
    state.value = Loading();

    try {
      final joke = await _jokeService.fetchJokes();
      _jokeHistory.add(joke);
      _currentIndex++;
      state.value = Success(joke);
    } catch (e) {
      state.value = Error("Oops, couldn't fetch jokes");
    }
  }

  void fetchPreviousJoke() {
    if (_currentIndex > 0) {
      _currentIndex--;
      final previousJoke = _jokeHistory[_currentIndex];
      state.value = Success(previousJoke);
    }
  }
}
