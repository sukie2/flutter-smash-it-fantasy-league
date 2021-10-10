import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smash_it/constants/color_constants.dart';
import 'package:smash_it/constants/string_constants.dart';
import 'package:smash_it/constants/text_constants.dart';

class SplashScreen extends StatelessWidget {
  final isLoading = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FantasyColors.PrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            Strings.app_name,
            style: GoogleFonts.bebasNeue(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 1),
          ),
          SizedBox(height: 20),
          Image.asset("images/logo.png"),
          AnimatedTextKit(
            totalRepeatCount: 5,
            onFinished: () {
              isLoading.value = true;
            },
            animatedTexts: [
              TyperAnimatedText('Hit it out of the park...',
                  textStyle: TextConstants.kSplashText),
            ],
          ),
        ],
      ),
    );
  }
}
