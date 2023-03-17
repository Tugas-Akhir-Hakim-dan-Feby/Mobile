import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Certificate extends StatefulWidget {
  const Certificate({super.key});

  @override
  State<Certificate> createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
          title: Text('Page Sertifikat'),
          
        ),
        body: Center(
          child: Text('Halaman Buat Sertifikat'),
        ),
    );
  }
}