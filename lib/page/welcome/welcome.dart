import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:api_mobile/page/auth/login_page.dart';
import 'package:api_mobile/page/welcome/first_page.dart';
import 'package:api_mobile/page/welcome/second_page.dart';
import 'package:api_mobile/page/welcome/third_page.dart';
import 'package:api_mobile/page/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final _controller = PageController();
  int currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 500,
            child: PageView(
              controller: _controller,
              children: const [
                FirstPage(),
                SecondPage(),
                ThirdPage(),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: SlideEffect(
              activeDotColor: Color.fromARGB(255, 255, 0, 0),
              dotColor: Color.fromARGB(255, 120, 105, 110).withOpacity(0.5),
              dotHeight: 20,
              dotWidth: 20,
            ),
          ),
        ],
      ),
    );
  }
}

const colors = [
  Colors.red,
  Colors.green,
  Colors.greenAccent,
  Colors.amberAccent,
  Colors.blue,
  Colors.amber,
];
