// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Color.fromARGB(255, 23, 163, 146),
          ),
        ),
      ),
    );
  }
}