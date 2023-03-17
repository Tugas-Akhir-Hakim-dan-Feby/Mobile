import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
          title: Text('Halaman Bantuan'),
        ),
        body: Center(
          child: Text('page Buat Helping'),
        ),
    );
  }
}