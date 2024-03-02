import 'dart:ui' show PointerDeviceKind;

import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/src/controller/home_controller.dart';
import 'package:flutter_japanese_restaurant_app/src/view/screen/authen_screen.dart';
import 'package:get/get.dart';

final HomeController homeController = Get.put(HomeController());

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        theme: homeController.theme.value,
        home: const AuthenScreen(),
      );
    });
  }
}
