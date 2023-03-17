
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}



// Hapus Kodinganya sesuaikan saja , bebas.



class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
          title: Text('Page Lupa Password'),
          
        ),
        body: Center(
          child: Text('Halaman Buat Reset Password'),
        ),
    );
  }
}