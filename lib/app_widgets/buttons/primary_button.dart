import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:random_jokes/const/app_colors.dart';
import 'package:random_jokes/const/app_typography.dart';

import '../animation/bouncing_animation.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? height;
  final double? width;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onTap,
      child: Container(
        height: height ?? 48.h,
        width: width ?? MediaQuery.sizeOf(context).width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.kBlack,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          text,
          style: AppTypography.kRegular14.copyWith(
            color: AppColors.kWhite,
            fontSize: 20.sp,
          ),
        ),
      ),
    );
  }
}
