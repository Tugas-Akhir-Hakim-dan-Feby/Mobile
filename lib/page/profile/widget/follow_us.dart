import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FollowUsPage extends StatefulWidget {
  const FollowUsPage({super.key});

  @override
  State<FollowUsPage> createState() => _FollowUsPageState();
}

class _FollowUsPageState extends State<FollowUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
          title: Text('Halaman Ikuti Kami'),
          
        ),
        body: Center(
          child: Text('page Buat Follow Us'),
        ),
    );
  }
}