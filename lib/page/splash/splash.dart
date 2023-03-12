import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:api_mobile/page/auth/login.dart';
import 'package:api_mobile/page/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  int currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PageView(

            scrollDirection: Axis.horizontal,
            children: [
              Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Image.asset('assets/images/logo_api.jpg'),
                    ),
                    const Center(
                      child: Text(
                        'API',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: Text(
                        'asosiasi pengelasan indonesia',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Image.asset('assets/images/welder.png'),
                    ),
                    const Center(
                      child: Text(
                        'API',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: Text(
                        'asosiasi pengelasan indonesia',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    const Center(
                      child: Text(
                        'API',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: Text(
                        'asosiasi pengelasan indonesia',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                
                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     ElevatedButton(
                //         onPressed: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => LoginScreen()));
                //         },
                //         child: Text('login')),
                //   ],
                // ),
              ),
            ],

          ),
        ],
      ),
    );
    // return AnimatedSplashScreen(
    //     splash: 'assets/images/logo_api.jpg',
    //     duration: 5000,
    //     splashTransition: SplashTransition.scaleTransition,
    //     backgroundColor:  Color.fromARGB(255, 158, 33, 33),
    //     centered: true,
    //     splashIconSize: double.maxFinite,
    //     nextScreen : const WelcomePage()
    // );
  }
}
