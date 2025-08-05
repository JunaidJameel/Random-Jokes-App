import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:random_jokes/const/app_colors.dart';
import 'package:random_jokes/const/app_typography.dart';
import 'package:random_jokes/const/app_utils.dart';
import 'package:random_jokes/const/enum/joke_category.dart';
import 'package:random_jokes/const/extensions/extension_sizebox.dart';
import 'package:random_jokes/controller/joke_controller.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kPagePadding * 2 / 1.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.vSpace,
            Text(
              'Jokes',
              style: AppTypography.kRegular10
                  .copyWith(color: AppColors.kBlack, fontSize: 22.sp),
            ),
            _buildChangeCategory(),
            10.vSpace,
            Container(
              margin: kPagePadding,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.kBlack.withValues(alpha: .4)),
              child: Center(
                child: Text(
                  'Swipe left/right for more Jokes',
                  style: AppTypography.kRegular14
                      .copyWith(color: AppColors.kWhite),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChangeCategory() {
    final controller = Get.find<JokeController>();

    return Obx(() {
      final selectedCategory = controller.currentCategory.value;
      final isExpanded = controller.isTileExpanded.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The "title" of the tile
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(
              selectedCategory.name.capitalizeFirst ?? '',
              style:
                  AppTypography.kSemiBold18.copyWith(color: AppColors.kBlack),
            ),
            trailing: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
            ),
            onTap: () {
              controller.isTileExpanded.toggle();
            },
          ),

          // The "expanding" section
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: Column(
              children: JokeCategory.values.map((category) {
                final isSelected = category == selectedCategory;

                return ListTile(
                  title: Text(
                    category.name.capitalizeFirst ?? '',
                    style: AppTypography.kRegular14.copyWith(
                      fontSize: 16.sp,
                      color: isSelected ? Colors.red : AppColors.kBlack,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    if (!isSelected) {
                      controller.fetchJokeBatch(category: category);
                    }
                    controller.isTileExpanded.value = false;
                  },
                );
              }).toList(),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 280),
          ),
        ],
      );
    });
  }
}
