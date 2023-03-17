import 'package:flutter/material.dart';
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ClipRRect(
        child:   Container(  
                child: Column(
                  children: [
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
              ),
            
      ),
    );
  }
}