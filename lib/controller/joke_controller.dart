import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:random_jokes/const/enum/joke_category.dart';
import 'package:random_jokes/services/joke_service.dart';
import 'package:random_jokes/state/joke_State.dart';
import 'package:random_jokes/model/joke_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    _initializeCategoryAndFetchJokes();
  }

  void _initializeCategoryAndFetchJokes() async {
    final savedCategory = await loadSavedCategory();
    currentCategory.value = savedCategory;
    fetchJokeBatch(category: savedCategory);
  }

  void fetchJokeBatch({JokeCategory? category}) async {
    state.value = Loading();
    if (category != null) {
      currentCategory.value = category;
      await saveSelectedCategory(category);
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

  // save SelectedCategory to local db via Shared Preferences

  Future<void> saveSelectedCategory(JokeCategory category) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('selectedCategory', category.name);
  }

  Future<JokeCategory> loadSavedCategory() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString('selectedCategory');
    return JokeCategory.values.firstWhere((e) => e.name == saved,
        orElse: () => JokeCategory.programming);
  }
}
