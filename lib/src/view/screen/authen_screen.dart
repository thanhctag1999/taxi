import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/core/app_color.dart';
import 'package:flutter_japanese_restaurant_app/core/app_extension.dart';
import 'package:flutter_japanese_restaurant_app/src/controller/authen_controller.dart';
import 'package:flutter_japanese_restaurant_app/src/view/widget/login.dart';
import 'package:flutter_japanese_restaurant_app/src/view/widget/sinup.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenScreen extends StatelessWidget {
  const AuthenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authenController = Get.put(AuthenController());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.snapchat_rounded,
                color: Colors.black,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Snail",
                style: GoogleFonts.poppins(),
              )
            ],
          ).fadeAnimation(0.2),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 350,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(30)),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              onTap: () {
                                authenController.screen.value = 0;
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: authenController.screen.value == 0
                                      ? LightThemeColor.accent
                                      : Colors.grey.shade300,
                                ),
                                child: Text(
                                  "Sign In",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                authenController.screen.value = 1;
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: authenController.screen.value == 1
                                      ? LightThemeColor.accent
                                      : Colors.grey.shade300,
                                ),
                                child: Text(
                                  "Sign up",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ).fadeAnimation(0.2),
                ),
                const SizedBox(
                  height: 100,
                ),
                Obx(
                  () => authenController.screen.value == 0
                      ? LoginScreen()
                      : SignUpScreen(),
                ).fadeAnimation(0.4)
              ],
            ),
          ),
        ));
  }
}
