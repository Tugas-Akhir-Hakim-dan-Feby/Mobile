import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
          title: Text('Edit Profile'),
          
        ),
        body: Center(
          child: Text('page Buat edit'),
        ),
    );
  }
}