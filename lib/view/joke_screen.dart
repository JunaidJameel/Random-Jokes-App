import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

import 'package:random_jokes/const/app_utils.dart';
import 'package:random_jokes/const/extensions/extension_sizebox.dart';
import 'package:random_jokes/controller/joke_controller.dart';
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
        child: Obx(() {
          final state = _controller.state.value;

          if (state is Loading) return _buildLoading();
          if (state is Success) return _buildBody();
          if (state is Error) return _buildError(state.message);

          return SizedBox();
        }),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: Padding(
        padding: kPagePadding * 2,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 400.h,
            width: double.infinity,
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
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        HeaderWidget(),
        Expanded(child: JokeSwiper()),
      ],
    );
  }

  Widget _buildError(String message) {
    return Padding(
      padding: kPagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: const TextStyle(color: Colors.red)),
          20.vSpace,
        ],
      ),
    );
  }
}
