import 'package:get/get.dart';
import 'package:random_jokes/const/enum/joke_category.dart';
import 'package:random_jokes/services/joke_service.dart';
import 'package:random_jokes/state/joke_State.dart';
import 'package:random_jokes/model/joke_model.dart';

class JokeController extends GetxController {
  final JokeService _jokeService = JokeService();

  final Rxn<JokeState> state = Rxn<JokeState>();

  List<JokeModel> jokeHistory = [];

  int _currentIndex =
      0; // Stores jokes fetched in the current batch. Also Tracks which joke from jokeHistory is currently being shown.

  final Rx<JokeCategory> currentCategory = JokeCategory.programming.obs;
  var isTileExpanded = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchJokeBatch(); // initially loads the first joke
  }

  void fetchJokeBatch({JokeCategory? category}) async {
    state.value = Loading();
    if (category != null) {
      currentCategory.value = category;
    }
    try {
      jokeHistory = await _jokeService.fetchMultipleJokes(
        category: currentCategory.value,
      );
      _currentIndex = 0;
      state.value = Success(jokeHistory[_currentIndex]);
    } catch (e) {
      state.value = Error("Oops, couldn't load jokes");
    }
  }

  void nextBunchOfJokes() {
    if (_currentIndex < jokeHistory.length - 1) {
      _currentIndex++;

      state.value = Success(jokeHistory[_currentIndex]);
    } else {
      // Re-fetch the next batch of jokes
      fetchJokeBatch();
    }
  }
}
