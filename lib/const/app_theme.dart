import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:random_jokes/const/app_colors.dart';
import 'package:random_jokes/const/app_typography.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.kScaffoldColor,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    focusColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
    ),
    textTheme: TextTheme(
      bodyLarge: AppTypography.kSemiBold16.copyWith(color: Colors.black),
      bodyMedium: AppTypography.kRegular14.copyWith(color: Colors.black87),
      bodySmall: AppTypography.kRegular12.copyWith(color: Colors.black54),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF5F5F5),
      hintStyle: AppTypography.kRegular14.copyWith(color: AppColors.kGrey),
      labelStyle: AppTypography.kRegular14.copyWith(color: AppColors.kGrey),
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12.r),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.kPrimary,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red.withValues(alpha: 0.7)),
        borderRadius: BorderRadius.circular(12.r),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(12.r),
      ),
      errorStyle: AppTypography.kRegular14.copyWith(color: Colors.red),
      alignLabelWithHint: true,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.kPrimary, // Define this in your AppColors
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
    ),
  );
}
