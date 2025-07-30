import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:random_jokes/const/app_colors.dart';
import 'package:random_jokes/const/app_typography.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? textSize;
  const CustomTextButton(
      {super.key, required this.text, required this.onPressed, this.textSize});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(text,
            style: AppTypography.kMedium14.copyWith(
                color: AppColors.kPrimary, fontSize: textSize ?? 16.sp)));
  }
}
