import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_jokes/const/app_utils.dart';
import 'package:random_jokes/const/extensions/extension_sizebox.dart';
import 'package:random_jokes/controller/joke_controller.dart';
import 'package:random_jokes/gen/assets.gen.dart';
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

    return Padding(
      padding: kPagePadding * 2 / 1.2,
      child: SizedBox(
        height: 400.h,
        child: Column(
          children: [
            Flexible(
              child: CardSwiper(
                controller: controller,
                cardsCount: cards.length,
                onSwipe: _onSwipe,
                onUndo: _onUndo,
                numberOfCardsDisplayed: 3,
                backCardOffset: const Offset(0, 30),
                cardBuilder: (
                  context,
                  index,
                  horizontalThresholdPercentage,
                  verticalThresholdPercentage,
                ) =>
                    cards[index],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJokeCard(JokeModel joke) {
    return Container(
      height: 400.h,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.fill,
          opacity: .1,
          colorFilter: ColorFilter.mode(
            Colors.amber[50]!, // your desired tint color
            BlendMode.dstATop,
          ),
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          )
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          30.vSpace,
          Text(
            joke.setup,
            style: GoogleFonts.robotoSlab(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          30.vSpace,
          Text(
            joke.punchline,
            style: GoogleFonts.dmSans(
              fontSize: 18.sp,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  bool _onSwipe(
      int previousIndex, int? currentIndex, CardSwiperDirection direction) {
    jokeController.nextBunchOfJokes();

    return true;
  }

  bool _onUndo(
      int? previousIndex, int currentIndex, CardSwiperDirection direction) {
    return true;
  }
}
