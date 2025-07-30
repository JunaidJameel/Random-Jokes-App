import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:random_jokes/app_widgets/buttons/primary_button.dart';
import 'package:random_jokes/const/app_typography.dart';
import 'package:random_jokes/const/app_utils.dart';
import 'package:random_jokes/const/extensions/extension_sizebox.dart';
import 'package:random_jokes/controller/joke_controller.dart';
import 'package:random_jokes/model/joke_model.dart';
import 'package:random_jokes/state/joke_State.dart';

class JokeScreen extends StatelessWidget {
  JokeScreen({super.key});

  final JokeController _controller = Get.put(JokeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Random Joke")),
      body: Center(
        child: Obx(() {
          final state = _controller.state.value;

          if (state is Loading) return _buildLoading();
          if (state is Success) return _buildJoke(state.joke);
          if (state is Error) return _buildError(state.message);

          return SizedBox(); // default if state is null
        }),
      ),
    );
  }

  Widget _buildLoading() {
    return const CircularProgressIndicator();
  }

  Widget _buildJoke(JokeModel joke) {
    return Padding(
      padding: kPagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${joke.setup}\n\n${joke.punchline}',
            textAlign: TextAlign.center,
            style: AppTypography.kRegular14.copyWith(fontSize: 18.sp),
          ),
          20.vSpace,
          PrimaryButton(
            text: 'Get Another',
            onTap: Get.find<JokeController>().fetchJoke,
          )
        ],
      ),
    );
  }

  Widget _buildError(String message) {
    return Padding(
      padding: kPagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: const TextStyle(color: Colors.red)),
          const SizedBox(height: 20),
          PrimaryButton(
            text: 'Retry',
            onTap: Get.find<JokeController>().fetchJoke,
          )
        ],
      ),
    );
  }
}
