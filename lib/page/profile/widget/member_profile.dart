import 'package:flutter/material.dart';

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
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
          title: const Text('Halaman Keanggotaan'),
          
        ),
        body: const Center(
          child: Text('page Buat Membership'),
        ),
    );
  }
}