import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ClipRRect(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 110.0, left: 30, right: 30, bottom: 0),
              child: Image.asset('assets/images/iiw.png'),
            ),
            const SizedBox(height: 50), // Menambah jarak antara gambar dan teks
            Expanded(
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: AnimationController(
                    vsync: ScaffoldMessenger.of(context),
                    duration: const Duration(milliseconds: 500),
                  )..forward(),
                  curve: Curves.easeInOut,
                )),
                child: const Text(
                  'Institut Pengelasan Internasional adalah badan ilmiah dan teknik internasional untuk pengelasan, mematri dan teknologi terkait',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(69,181,222,1.000)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
