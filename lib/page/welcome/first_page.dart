import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ClipRRect(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:130.0, left: 30, right:30, bottom:5),
              child: Image.asset('assets/images/logo_api.jpg'),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1, 0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: AnimationController(
                    vsync: ScaffoldMessenger.of(context),
                    duration: const Duration(milliseconds: 500),
                  )..forward(),
                  curve: Curves.easeInOut,
                )),
                child: const Text(
                  'AWF adalah organisasi nirlaba yang mengabdikan diri untuk peningkatan dan promosi teknologi pengelasan di Asia.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.8,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
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
