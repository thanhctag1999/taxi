import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/core/app_color.dart';
import 'package:flutter_japanese_restaurant_app/core/app_extension.dart';
import 'package:flutter_japanese_restaurant_app/src/controller/authen_controller.dart';
import 'package:flutter_japanese_restaurant_app/src/view/screen/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

var authenController = Get.put(AuthenController());
Widget LoginScreen() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.alternate_email_rounded),
            hintText: ("Email or Phone"),
            hintStyle: GoogleFonts.poppins(),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 2,
                color: LightThemeColor.accent,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ).fadeAnimation(0.4),
        const SizedBox(
          height: 20,
        ),
        Obx(
          () => TextField(
            obscureText: !authenController.visiblePass.value,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.shield_rounded),
              suffixIcon: authenController.visiblePass.value
                  ? IconButton(
                      onPressed: () {
                        authenController.visiblePass.value =
                            !authenController.visiblePass.value;
                      },
                      icon: const FaIcon(FontAwesomeIcons.eye))
                  : IconButton(
                      onPressed: () {
                        authenController.visiblePass.value =
                            !authenController.visiblePass.value;
                      },
                      icon: const FaIcon(FontAwesomeIcons.eyeSlash)),
              hintText: ("Password"),
              hintStyle: GoogleFonts.poppins(),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: LightThemeColor.accent,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ).fadeAnimation(0.4),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Forgot Password?",
              style: GoogleFonts.poppins(),
            )
          ],
        ).fadeAnimation(0.4),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Remember me", style: GoogleFonts.poppins()),
            Obx(
              () => CupertinoSwitch(
                activeColor: LightThemeColor.accent,
                value: authenController.switchValue.value,
                onChanged: (value) {
                  authenController.switchValue.value = value;
                },
              ),
            ),
          ],
        ).fadeAnimation(0.4),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Get.to(const HomeScreen());
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              "Sign In",
              style: GoogleFonts.poppins(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ).fadeAnimation(0.4)
      ],
    ),
  );
}
