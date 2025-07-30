// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../main.dart';

// class LoadingDialog extends StatelessWidget {
//   const LoadingDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: false,
//       child: Dialog(
//         backgroundColor: Colors.transparent, // Transparent dialog
//         insetPadding: EdgeInsets.zero, // Remove default padding
//         child: SizedBox.expand(
//           // Take full screen
//           child: Stack(
//             children: [
//               // Semi-transparent background
//               Opacity(
//                 opacity: 0.4,
//                 child: ModalBarrier(
//                   dismissible: false,
//                   color: Colors.black,
//                 ),
//               ),
//               // Centered loader
//               // Center(
//               //   child: SizedBox(
//               //       width: 150,
//               //       height: 150,
//               //       child: Lottie.asset(Assets.lottie.loading)),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SuccessDialog extends StatelessWidget {
//   const SuccessDialog({super.key, required this.message});
//   final String message;

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       elevation: 0,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(10),
//         ),
//       ),
//       content: SizedBox(
//           height: 45,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(
//                 Icons.check_circle_rounded,
//                 color: Colors.green,
//                 size: 35,
//               ),
//               const SizedBox(width: 10),
//               Text(
//                 message,
//                 style: const TextStyle(fontSize: 17),
//               )
//             ],
//           )),
//     );
//   }
// }

// Future<void> showLoadingDialog(
//     {required String message, bool dismissible = false}) async {
//   return Get.dialog(
//     const LoadingDialog(),
//     barrierDismissible: true,
//     navigatorKey: dialogKey,
//   );
// }

// showErrorDialog(String message) {
//   return Get.dialog(
//     AlertDialog(
//       title: Text(message),
//     ),
//     navigatorKey: dialogKey,
//   );
// }

// Future<void> showSuccessDialog({required String message}) async {
//   return Get.dialog(
//     SuccessDialog(message: message),
//     navigatorKey: dialogKey,
//   );
// }

// void hideLoadingDialog() {
//   dialogKey.currentState?.pop();
//   return;
// }

// void hideDialog() {
//   return Get.back();
// }
