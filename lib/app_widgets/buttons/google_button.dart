import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:random_jokes/const/app_typography.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // Text color
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey[100]!)),
        elevation: 1, // Subtle shadow
        minimumSize: Size(double.infinity, 48.h), // Full-width button
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(
          //   Assets.icons.google.path,
          //   width: 30.w,
          // ),
          const SizedBox(width: 20),
          Text('Sign in with Google',
              style: AppTypography.kRegular14.copyWith(fontSize: 16.sp)),
        ],
      ),
    );
  }
}
