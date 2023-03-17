import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MemberProfilePage extends StatefulWidget {
  const MemberProfilePage({super.key});

  @override
  State<MemberProfilePage> createState() => _MemberProfilePageState();
}

class _MemberProfilePageState extends State<MemberProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
          title: Text('Halaman Keanggotaan'),
          
        ),
        body: Center(
          child: Text('page Buat Membership'),
        ),
    );
  }
}