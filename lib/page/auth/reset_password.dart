import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        backgroundColor: Color.fromARGB(255, 244, 17, 17),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo_api.jpg'),
                radius: 110,
              ),
            ),

            Text(
              'Masukkan email Anda untuk mengubah kata sandi.',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                
              ),
            ),

            SizedBox(height: 20.0),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  
                ),
                prefixIcon: Icon(Icons.email),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email address';
                }
                return null;
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Send reset password link to user's email
                // Code to send reset password link goes here
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 244, 17, 17),
              ),
              child: Text('Ubah Kata Sandi'),
            ),
          ],
        ),
      ),
    );
  }
}





// class ResetPasswordPage extends StatefulWidget {
//   const ResetPasswordPage({super.key});

//   @override
//   State<ResetPasswordPage> createState() => _ResetPasswordPageState();
// }



// // Hapus Kodinganya sesuaikan saja , bebas.



// class _ResetPasswordPageState extends State<ResetPasswordPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 255, 0, 0),
//           title: Text('Page Lupa Password'),
          
//         ),
//         body: Center(
//           child: Text('Halaman Buat Reset Password'),
//         ),
//     );
//   }
// }