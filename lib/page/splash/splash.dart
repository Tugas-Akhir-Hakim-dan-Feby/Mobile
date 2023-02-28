import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:api_mobile/page/welcome/welcome.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: 'assets/images/logo_api.jpg',
        duration: 5000,
        splashTransition: SplashTransition.scaleTransition,
        // ignore: prefer_const_constructors
        backgroundColor:  Color.fromARGB(255, 158, 33, 33),
        centered: true,
        splashIconSize: double.maxFinite,
        nextScreen : const WelcomePage()
    );
  } 
}
