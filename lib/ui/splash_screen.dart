import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smash_it/constants/text_constants.dart';

class SplashScreen extends StatelessWidget {
  final isLoading = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: AnimatedTextKit(
              totalRepeatCount: 5,
              onFinished: () {
                isLoading.value = true;
              },
              animatedTexts: [
                TyperAnimatedText('Hit it out of the park...',
                    textStyle: TextConstants.kSplashText),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
