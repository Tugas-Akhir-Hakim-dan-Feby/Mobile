import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TermsConditionPage extends StatefulWidget {
  const TermsConditionPage({super.key});

  @override
  State<TermsConditionPage> createState() => _TermsConditionPageState();
}

class _TermsConditionPageState extends State<TermsConditionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        title: Text('Halaman Syarat & Ketentuan'),
      ),
      body: Center(
        child: Text('page Buat Syarat & Ketentuan'),
      ),
    );
  }
}
