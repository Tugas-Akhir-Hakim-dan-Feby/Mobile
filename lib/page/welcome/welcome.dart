import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
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
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 700,
                child: PageView(
                  controller: _controller,
                  children: const [
                    FirstPage(),
                    SecondPage(),
                    ThirdPage(),
                  ],
                  onPageChanged: (index) {
                    setState(() {
                      currentPosition = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () => _controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut),
                    icon: currentPosition == 0
                        ? SizedBox(
                            width: 24,
                            height: 24,
                            child: Icon(
                              Icons.numbers_outlined,
                              color: Colors.white,
                            ),
                          )
                        : Icon(Icons.arrow_back_ios),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: SlideEffect(
                      activeDotColor: Color.fromARGB(255, 255, 0, 0),
                      dotColor:
                          Color.fromARGB(255, 120, 105, 110).withOpacity(0.5),
                      dotHeight: 20,
                      dotWidth: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (currentPosition == 2) {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(builder: (context) => LoginPage()),
                        // );
                        Navigator.pushNamed(context, 'login_page');
                      } else {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      }
                    },
                    child: Icon(
                      currentPosition == 2
                          ? Icons.done
                          : Icons.arrow_forward_ios,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 70,
            right: 40,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'login_page');
              },
              child: Container(
                width: 75,
                height: 35,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 0, 0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: ColorizeAnimatedTextKit(
                    onTap: () {
                      Navigator.pushNamed(context, 'login_page');
                    },
                    text: ['Lewati'],
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    colors: [
                      Colors.white,
                      Colors.white,
                      Colors.red,
                      Colors.yellow,
                      Colors.green,
                      Colors.blue,
                      Colors.purple,
                    ],
                    textAlign: TextAlign.center,
                    repeatForever: true,
                    speed: Duration(milliseconds: 500),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
