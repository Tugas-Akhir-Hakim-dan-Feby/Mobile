
import 'package:flutter/material.dart';
class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Color.fromARGB(255, 233, 0, 0),
          ),
        ),
      ),
    );
  }
}