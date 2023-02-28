import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // color: Colors.black,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/welcome.png', ),
                          fit: BoxFit.fill)),
                ),
              ),
              Positioned(
                height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/nama_aplikasi.png', ))),
                ),
              ),
              Positioned(
                top: 400,
                width: MediaQuery.of(context).size.width,
                // ignore: avoid_unnecessary_containers
                child: Container(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    // onPressed: () {
                    //   Navigator.pushNamed(context, 'login_page');
                    // },
                    onPressed: () {
                      Navigator.pushNamed(context, 'login_page');
                    },
                    child: const Text('Get Started',
                        style: TextStyle(
                            color: Color.fromARGB(213, 116, 113, 94))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}