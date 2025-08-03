import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:random_jokes/controller/joke_controller.dart';
import 'package:random_jokes/model/joke_model.dart';

class JokeSwiper extends StatefulWidget {
  const JokeSwiper({super.key});

  @override
  State<JokeSwiper> createState() => _JokeSwiperState();
}

class _JokeSwiperState extends State<JokeSwiper> {
  final CardSwiperController controller = CardSwiperController();
  final JokeController jokeController = Get.find<JokeController>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cards = jokeController.jokeHistory.map(_buildJokeCard).toList();

    return SafeArea(
      child: Column(
        children: [
          Flexible(
            child: CardSwiper(
              controller: controller,
              cardsCount: cards.length,
              onSwipe: _onSwipe,
              onUndo: _onUndo,
              numberOfCardsDisplayed: 3,
              backCardOffset: const Offset(40, 40),
              padding: const EdgeInsets.all(24.0),
              cardBuilder: (
                context,
                index,
                horizontalThresholdPercentage,
                verticalThresholdPercentage,
              ) =>
                  cards[index],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              spacing: 12,
              children: [
                FloatingActionButton(
                  onPressed: controller.undo,
                  heroTag: 'undo',
                  child: const Icon(Icons.rotate_left),
                ),
                FloatingActionButton(
                  onPressed: () => controller.swipe(CardSwiperDirection.left),
                  heroTag: 'left',
                  child: const Icon(Icons.keyboard_arrow_left),
                ),
                FloatingActionButton(
                  onPressed: () => controller.swipe(CardSwiperDirection.right),
                  heroTag: 'right',
                  child: const Icon(Icons.keyboard_arrow_right),
                ),
                FloatingActionButton(
                  onPressed: () => controller.swipe(CardSwiperDirection.top),
                  heroTag: 'top',
                  child: const Icon(Icons.keyboard_arrow_up),
                ),
                FloatingActionButton(
                  onPressed: () => controller.swipe(CardSwiperDirection.bottom),
                  heroTag: 'down',
                  child: const Icon(Icons.keyboard_arrow_down),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJokeCard(JokeModel joke) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          )
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            joke.setup,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            joke.punchline,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );

    // Auto-load new jokes if we hit the last one
    if (previousIndex == jokeController.jokeHistory.length - 1) {
      jokeController.fetchJokeBatch();
    }

    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undone from the ${direction.name}',
    );
    return true;
  }
}
