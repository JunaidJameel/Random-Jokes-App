// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:noor_ul_saffa/app_widgets/loading_dialogs.dart';
// import 'package:noor_ul_saffa/const/app_colors.dart';

// class NetworkImageWidget extends StatelessWidget {
//   final String imageUrl;
//   final double width, height, borderRadius, iconSize;
//   const NetworkImageWidget(
//       {super.key,
//       required this.imageUrl,
//       this.width = 40,
//       this.height = 40,
//       this.borderRadius = 18,
//       this.iconSize = 20});

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(borderRadius),
//       child: imageUrl == '' || imageUrl == "null"
//           ? Container(
//               width: width,
//               height: height,
//               decoration: BoxDecoration(
//                 color: AppColors.kWhite,
//                 borderRadius: BorderRadius.circular(13),
//               ),
//               child: Icon(
//                 Icons.person_outline,
//                 size: iconSize,
//               ))
//           : CachedNetworkImage(
//               imageUrl: imageUrl,
//               width: width,
//               height: height,
//               imageBuilder: (context, imageProvider) => Container(
//                 width: width,
//                 height: height,
//                 decoration: BoxDecoration(
//                   color: AppColors.kWhite,
//                   image: DecorationImage(
//                     image: imageProvider,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               placeholder: (context, url) => Container(
//                 width: width,
//                 height: height,
//                 decoration: BoxDecoration(
//                   color: AppColors.kWhite,
//                   borderRadius: BorderRadius.circular(borderRadius),
//                 ),
//                 child: const Padding(
//                   padding: EdgeInsets.all(12.0),
//                   child: LoadingDialog(),
//                 ),
//               ),
//               errorWidget: (context, url, error) => Container(
//                   width: width,
//                   height: height,
//                   decoration: BoxDecoration(
//                     color: AppColors.kWhite,
//                     borderRadius: BorderRadius.circular(13),
//                   ),
//                   child: Icon(
//                     Icons.error_outline,
//                     size: iconSize,
//                   )),
//             ),
//     );
//   }
// }
