import 'package:flutter/material.dart';
import 'package:random_jokes/const/app_colors.dart';
import 'package:random_jokes/const/app_typography.dart';
import 'package:random_jokes/const/app_utils.dart';
import 'package:random_jokes/const/extensions/extension_sizebox.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kPagePadding * 2 / .8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.vSpace,
            Text(
              'Jokes',
              style:
                  AppTypography.kSemiBold18.copyWith(color: AppColors.kBlack),
            ),
            Container(
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
}
