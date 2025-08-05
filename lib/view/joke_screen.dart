import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:random_jokes/const/app_colors.dart';
import 'package:random_jokes/const/app_typography.dart';

import 'package:random_jokes/const/app_utils.dart';
import 'package:random_jokes/const/enum/joke_category.dart';
import 'package:random_jokes/const/extensions/extension_sizebox.dart';
import 'package:random_jokes/const/gradient.dart';
import 'package:random_jokes/controller/joke_controller.dart';
import 'package:random_jokes/gen/assets.gen.dart';
import 'package:random_jokes/state/joke_State.dart';
import 'package:random_jokes/view/widget/header.dart';
import 'package:random_jokes/view/widget/joke_swiper_card.dart';
import 'package:shimmer/shimmer.dart';

class JokeScreen extends StatelessWidget {
  JokeScreen({super.key});

  final JokeController _controller = Get.put(JokeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: JokeCategoryGradients.getGradient(
                    _controller.currentCategory.value)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderWidget(),
                Obx(() {
                  final state = _controller.state.value;

                  if (state is Loading) return _buildLoading();
                  if (state is Success) return _buildJokeCard();
                  if (state is Error) return _buildError(state.message);

                  return SizedBox();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(120.0),
            child: Lottie.asset(
              Assets.lottie.loading,
              delegates: LottieDelegates(
                values: [
                  ValueDelegate.color(
                    const ['**'],
                    value: AppColors.kBlack,
                  ),
                ],
              ),
            )));
  }

  Widget _buildJokeCard() {
    return JokeSwiper();
  }

  Widget _buildError(String message) {
    return Padding(
      padding: kPagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message,
              style: AppTypography.kSemiBold16.copyWith(color: Colors.red)),
          20.vSpace,
        ],
      ),
    );
  }
}
