import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:random_jokes/const/app_colors.dart';
import 'package:random_jokes/const/app_typography.dart';

class CustomRichText extends StatelessWidget {
  final String info;
  final String title;
  final TextStyle? firstTextStyle;
  final TextStyle? secondTextStyle;

  const CustomRichText(
      {super.key,
      required this.info,
      required this.title,
      this.firstTextStyle,
      this.secondTextStyle});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: '$info ',
            style: firstTextStyle ??
                AppTypography.kMedium14
                    .copyWith(color: AppColors.kPrimary, fontSize: 16.sp),
            children: [
          TextSpan(
            text: ' $title',
            style: secondTextStyle ??
                AppTypography.kMedium14
                    .copyWith(color: AppColors.kPrimary, fontSize: 16.sp),
          )
        ]));
  }
}
