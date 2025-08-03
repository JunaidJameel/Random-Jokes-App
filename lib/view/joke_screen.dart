import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:random_jokes/app_widgets/buttons/primary_button.dart';
import 'package:random_jokes/const/app_typography.dart';
import 'package:random_jokes/const/app_utils.dart';
import 'package:random_jokes/controller/joke_controller.dart';
import 'package:random_jokes/model/joke_model.dart';
import 'package:random_jokes/state/joke_State.dart';
import 'package:random_jokes/view/widget/joke_card.dart';

class JokeScreen extends StatelessWidget {
  JokeScreen({super.key});

  final JokeController _controller = Get.put(JokeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFD0EBDD),
              Color(0xFFFFE0B2),
              Color(0xFFEBD4D4),
            ],
          ),
        ),
        child: Center(
          child: Obx(() {
            final state = _controller.state.value;

            if (state is Loading) return _buildLoading();
            if (state is Success) return _buildJoke(state.joke, _controller);
            if (state is Error) return _buildError(state.message);

            return SizedBox();
          }),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const CircularProgressIndicator();
  }

  Widget _buildJoke(JokeModel joke, JokeController controller) {
    return controller.jokeHistory.isEmpty
        ? Text('List is Empety Now')
        : SizedBox(
            height: 400,
            width: 300,
            child: Stack(
              children: [
                // tinder Card
                JokeSwiper()
              ],
            ),
          );
  }

  // Widget _buildJoke(JokeModel joke, JokeController controller) {
  //   return Padding(
  //     padding: kPagePadding,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         // Text(joke.setup,
  //         //     textAlign: TextAlign.center,
  //         //     style: AppTypography.kSemiBold18.copyWith(fontSize: 24.sp)),
  //         // 30.vSpace,
  //         // Text(joke.punchline,
  //         //     style: AppTypography.kSemiBold16.copyWith(fontSize: 18.sp)),
  //         // 20.vSpace,
  //         // PrimaryButton(
  //         //   text: 'Get Another',
  //         //   onTap: Get.find<JokeController>().fetchJoke,
  //         // )

  //         // ListView.builder(
  //         //     shrinkWrap: true,
  //         //     itemCount: controller.jokeHistory.length,
  //         //     itemBuilder: (_, index) {
  //         //       final currentJoke = _controller.jokeHistory[index];
  //         //       return Text(currentJoke.setup);
  //         //     })

  //         // SwipeDeck(
  //         //   startIndex: 0,
  //         //   emptyIndicator: const Center(
  //         //     child: Text("Nothing Here"),
  //         //   ),
  //         //   cardSpreadInDegrees: 1,
  //         //   onSwipeLeft: () {
  //         //     // Handle left swipe
  //         //   },
  //         //   onSwipeRight: () {
  //         //     // Handle right swipe
  //         //   },
  //         //   onChange: (index) {
  //         //     print("Swiped to card #$index");
  //         //   },
  //         //   widgets: _controller.jokeHistory.map((joke) {
  //         //     return GestureDetector(
  //         //       onTap: () {
  //         //         print(joke.fullJoke);
  //         //       },
  //         //       child: Container(
  //         //         margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  //         //         padding: EdgeInsets.all(20),
  //         //         decoration: BoxDecoration(
  //         //           color: Colors.white.withOpacity(0.9),
  //         //           borderRadius: BorderRadius.circular(20),
  //         //           boxShadow: [
  //         //             BoxShadow(
  //         //               color: Colors.black12,
  //         //               blurRadius: 10,
  //         //               offset: Offset(0, 5),
  //         //             )
  //         //           ],
  //         //         ),
  //         //         child: Column(
  //         //           mainAxisAlignment: MainAxisAlignment.center,
  //         //           children: [
  //         //             Text(
  //         //               joke.setup,
  //         //               style: AppTypography.kSemiBold18.copyWith(fontSize: 22),
  //         //               textAlign: TextAlign.center,
  //         //             ),
  //         //             SizedBox(height: 16),
  //         //             Text(
  //         //               joke.punchline,
  //         //               style: AppTypography.kSemiBold16.copyWith(fontSize: 18),
  //         //               textAlign: TextAlign.center,
  //         //             ),
  //         //           ],
  //         //         ),
  //         //       ),
  //         //     );
  //         //   }).toList(),

  //       ],
  //     ),
  //   );
  // }

  Widget _buildError(String message) {
    return Padding(
      padding: kPagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: const TextStyle(color: Colors.red)),
          const SizedBox(height: 20),
          // PrimaryButton(
          //   text: 'Retry One more',
          //   onTap: Get.find<JokeController>().fetchJoke,
          // )
        ],
      ),
    );
  }
}
