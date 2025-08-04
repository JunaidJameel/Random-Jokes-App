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
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Jokes',
                style: AppTypography.kRegular10
                    .copyWith(color: AppColors.kBlack, fontSize: 22.sp),
              ),
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
    return Obx(() {
      final controller = Get.find<JokeController>();
      final selectedCategory = controller.currentCategory.value;

      return ExpansionTile(
        title: Text(
          selectedCategory.name.capitalizeFirst ?? '',
          style: AppTypography.kSemiBold18.copyWith(color: AppColors.kBlack),
        ),
        children: JokeCategory.values.map((category) {
          final isSelected = category == selectedCategory;

          return ListTile(
            title: Text(
              category.name.capitalizeFirst ?? '',
              style: AppTypography.kRegular14.copyWith(
                fontSize: 16.sp,
                color: isSelected ? Colors.red : AppColors.kBlack,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            onTap: () {
              // only fetch if changed
              if (!isSelected) {
                controller.fetchJokeBatch(category: category);
              }
              Get.back(); // collapse tile (optional, or use custom UI)
            },
          );
        }).toList(),
      );
    });
  }
}
