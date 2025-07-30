import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:random_jokes/const/app_theme.dart';
import 'package:random_jokes/view/joke_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: GetMaterialApp(
                builder: (context, child) {
                  final MediaQueryData data = MediaQuery.of(context);
                  return MediaQuery(
                      data: data.copyWith(
                          textScaler: const TextScaler.linear(1.0)),
                      child: child!);
                },
                useInheritedMediaQuery: true,
                title: 'Random Jokes',
                debugShowCheckedModeBanner: false,
                scrollBehavior: const ScrollBehavior()
                    .copyWith(physics: const BouncingScrollPhysics()),
                defaultTransition: Transition.downToUp,
                theme: AppTheme.lightTheme,
                home: JokeScreen(),
                navigatorKey: navigatorKey,
                scaffoldMessengerKey: scaffoldMessengerKey,
              ));
        });
  }
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
