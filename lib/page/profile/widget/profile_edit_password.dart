import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileEditPasswordPage extends StatefulWidget {
  const ProfileEditPasswordPage({super.key});

  @override
  State<ProfileEditPasswordPage> createState() => _ProfileEditPasswordPageState();
}

class _ProfileEditPasswordPageState extends State<ProfileEditPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
          title: Text('Halaman Edit Kata Sandi'),
          
        ),
        body: Center(
          child: Text('page Buat Ubah Password'),
        ),
    );
  }
}