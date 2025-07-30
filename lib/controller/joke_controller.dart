import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:random_jokes/services/joke_service.dart';
import 'package:random_jokes/state/joke_State.dart';

class JokeController extends GetxController {
  final JokeService _jokeService = JokeService();

  final Rxn<JokeState> state = Rxn<JokeState>();

  @override
  void onInit() {
    super.onInit();
    fetchJoke();
  }

  void fetchJoke() async {
    state.value = Loading();

    try {
      final joke = await _jokeService.fetchJokes();
      state.value = Success(joke);
    } catch (e) {
      state.value = Error("Oops, couldn't fetch jokes");
    }
  }
}
