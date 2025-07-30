// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AppUtils {
//   static putAllControllers() {
//     Get.put(UserController());
//   }

//   static removeAllControllers() {
//     Get.delete<CartController>(force: true);
//   }

//   static void showSnackBar(String title, String message,
//       {Color backgroundColor = Colors.black}) {
//     Get.snackbar(
//       title,
//       message,
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: backgroundColor,
//       colorText: Colors.white,
//       margin: const EdgeInsets.all(16),
//       borderRadius: 10,
//       duration: const Duration(seconds: 3),
//     );
//   }
// }

import 'package:flutter/material.dart';

const kPagePadding = EdgeInsets.symmetric(horizontal: 20);
const kLeftPadding = EdgeInsets.only(left: 20);
const kRightPadding = EdgeInsets.only(right: 20);

// Future<T?> callFutureFunctionWithLoadingOverlay<T>({
//   required Future<T> Function() asyncFunction,
//   bool showOverLay = true,
// }) async {
//   T? result;
//   if (!showOverLay) {
//     try {
//       result = await asyncFunction();
//     } catch (e) {
//       AppUtils.showSnackBar("Error", _getFriendlyErrorMessage(e));
//     }
//     return result;
//   } else {
//     await Get.showOverlay(
//       asyncFunction: () async {
//         try {
//           result = await asyncFunction();
//         } catch (e) {
//           AppUtils.showSnackBar("Error", _getFriendlyErrorMessage(e));
//         }
//       },
//       loadingWidget: const LoadingDialog(),
//     );
//     return result;
//   }
// }

// /// Convert Firebase errors to user-friendly messages
// String _getFriendlyErrorMessage(dynamic error) {
//   if (error is FirebaseAuthException) {
//     switch (error.code) {
//       case 'invalid-email':
//         return 'The email address is invalid.';
//       case 'user-disabled':
//         return 'This account has been disabled.';
//       case 'user-not-found':
//         return 'No user found with this email.';
//       case 'wrong-password':
//         return 'Incorrect password. Please try again.';
//       case 'email-already-in-use':
//         return 'This email is already registered.';
//       case 'weak-password':
//         return 'The password is too weak.';
//       case 'invalid-credential':
//         return 'Something went wrong during login. Please try again.';
//       default:
//         return 'An unexpected error occurred. Please try again.';
//     }
//   } else {
//     return 'An error occurred. Please try again.';
//   }
// }
