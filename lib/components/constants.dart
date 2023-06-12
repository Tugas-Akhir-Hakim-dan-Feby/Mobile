import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

dynamic mainColor = const Color.fromARGB(220, 255, 190, 38);
// dynamic greenColor = const Color.fromRGBO(67, 238, 135, 1);
dynamic greyColor = const Color.fromARGB(255, 116, 116, 116);
var kMainColor = const Color.fromARGB(220, 255, 190, 38);
var kFontColor = const Color.fromARGB(255, 57, 62, 70);
var kBackground = const Color.fromARGB(255, 247, 247, 247);
var redColor = const Color.fromARGB(255, 255, 95, 84);
var greenColor = const Color.fromARGB(255, 107, 246, 121);
var greenSecond = const Color.fromARGB(255, 196, 255, 176);
var purpleColor = const Color.fromARGB(255, 176, 192, 255);

  Widget colorizeAnimation() {
    const colorizeColors = [
      Color.fromARGB(255, 255, 17, 0),
      Color.fromARGB(255, 242, 36, 36),
      Color.fromARGB(255, 248, 52, 52),
      Color.fromARGB(255, 244, 144, 144),
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 33.0,
      fontWeight: FontWeight.bold,
    );
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              'API',
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),
          ],
        ),
      ),
    );
  }

