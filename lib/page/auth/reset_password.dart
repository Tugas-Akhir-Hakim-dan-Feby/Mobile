import 'package:api_mobile/auth/style_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sn_progress_dialog/options/completed.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:http/http.dart' as http;

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController txtResetEmail = TextEditingController();
  final GlobalKey<FlutterPwValidatorState> validatorKey =
      GlobalKey<FlutterPwValidatorState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Future _doResetPassword() async {
      String email = txtResetEmail.text;
      // ignore: unused_local_variable
      if (email.isEmpty) {
        Alert(
                context: context,
                title: "Email Tidak Boleh Kosong",
                type: AlertType.error)
            .show();
        return;
      }
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(
        msg: "Memuat......",
        progressBgColor: const Color.fromARGB(0, 174, 155, 155),
        max: 100,
        barrierDismissible: true,
        hideValue: true,
        completed: Completed(),
      );
      // final response = await http.post(Uri.parse(AppConfig.getUrl()), body: {
      final response = await http.post(
          Uri.parse(
              "https://develop-ta.berobatplus.shop/api/v1/auth/forgot-password"),
          body: {
            'email': email,
          },
          headers: {
            'Accept': 'application/json'
          });

      progressDialog.close();
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        print(response.statusCode);
        // ignore: use_build_context_synchronously
        Alert(
            context: context,
            title: "Cek Email Anda untuk Merubah Kata Sandi",
            // desc: "periksa email anda",
            alertAnimation: fadeAlertAnimation,
            image: Image.asset("assets/images/email.png"),
            buttons: [
              DialogButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              )
            ]).show();
      } else if (response.statusCode == 422) {
        print(response.statusCode);
        // ignore: use_build_context_synchronously
        Alert(
            context: context,
            title: "Email Belum Terdaftar",
            type: AlertType.warning,
            buttons: [
              DialogButton(
                child: const Text(
                  "Kembali",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ]).show();
      } else {
        // ignore: use_build_context_synchronously
        Alert(
                context: context,
                title: "Data Gagal disimpan",
                type: AlertType.error)
            .show();
      }
    }

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
            Form(
              key: _formKey,
              child: TextFormField(
                controller: txtResetEmail,
                validator: (value) {
                  // Check if this field is empty
                  if (value == null || value.isEmpty) {
                    return 'Email Harus di isi';
                  }
                  // using regular expression
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Masukan Email yang Valid";
                  }
                  // the email is valid
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      const Color.fromARGB(255, 228, 226, 226).withOpacity(0.4),
                  hintText: "Masukan alamat email anda",
                  labelText: "Email",
                  icon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
                style: TextStyle(
                  fontSize: 18.0,
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
                ),
              ),
            ),

            // TextFormField(
            //   controller: txtResetEmail,
            //   validator: (value) {
            //                       // Check if this field is empty
            //                       if (value == null || value.isEmpty) {
            //                         return 'Email Harus di isi';
            //                       }
            //                       // using regular expression
            //                       if (!RegExp(r'\S+@\S+\.\S+')
            //                           .hasMatch(value)) {
            //                         return "Masukan Email yang Valid";
            //                       }
            //                       // the email is valid
            //                       return null;
            //                     },
            //   decoration: InputDecoration(
            //     hintText: 'Email',
            //     filled: true,
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10.0),
            //     ),
            //     prefixIcon: Icon(Icons.email),
            //   ),
            // ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _doResetPassword();
                }
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
