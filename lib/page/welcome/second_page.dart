// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ClipRRect(
        child: Container(
          child: Column(
            children: [
              Padding(
                // padding: const EdgeInsets.all(30),
                padding: const EdgeInsets.only(top:200.0, left: 30, right:30, bottom:60),
                child: Image.asset('assets/images/awf.jpg'),
              ),
              const SizedBox(height: 50), // Menambah jarak antara gambar dan teks
              Expanded(
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
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
                      color: Color.fromRGBO(183, 173, 173, 1),
                    ),
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
