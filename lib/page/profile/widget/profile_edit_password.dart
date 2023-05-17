import 'package:api_mobile/auth/style_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:http/http.dart' as http;

class ProfileEditPasswordPage extends StatefulWidget {
  const ProfileEditPasswordPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPasswordPage> createState() =>
      _ProfileEditPasswordPageState();
}

class _ProfileEditPasswordPageState extends State<ProfileEditPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isLoading = false;
  bool _isOldVisible = false;
  bool _isNewVisible = false;
  String _errorMessage = '';
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');

    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) _hasPasswordOneNumber = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future _doChangeEmail() async {
      String password = _newPasswordController.text;

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
              "https://develop-ta.berobatplus.shop/api/v1/user/update-password"),
          body: {
            'password': password,
          },
          headers: {
            'Accept': 'application/json'
          });

      progressDialog.close();
      print(response.body);
      if (response.statusCode == 201) {
        // ignore: use_build_context_synchronously
        Alert(
            context: context,
            title: "Cek Email Anda",
            desc: "Cek Pesan Email Anda untuk Membuat Password",
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
      } else if (response.statusCode == 400) {
        print(response.statusCode);
        // ignore: use_build_context_synchronously
        Alert(
            context: context,
            title: "Email Sudah Terdaftar",
            type: AlertType.warning,
            buttons: [
              DialogButton(
                child: const Text(
                  "Ganti Email",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pop(context);
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

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('update password'),
        backgroundColor: Color.fromARGB(255, 244, 17, 17),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo_api.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  onChanged: (password) => onPasswordChanged(password),
                  obscureText: _isOldVisible,
                  controller: _currentPasswordController,
                  decoration: InputDecoration(
                    labelText: 'password anda saat ini',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isOldVisible = !_isOldVisible;
                        });
                      },
                      icon: _isOldVisible
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'masukan pasword anda saat ini.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (password) => onPasswordChanged(password),
                  obscureText: _isNewVisible,
                  controller: _newPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Password baru',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isNewVisible = !_isNewVisible;
                        });
                      },
                      icon: _isNewVisible
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                    ),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'tolong masukan password baru anda.';
                  //   }
                  //   if (value.length < 8) {
                  //     return 'Password must be at least 8 characters long.';
                  //   }
                  //   return null;
                  // },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (password) => onPasswordChanged(password),
                  obscureText: _isNewVisible,
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isNewVisible = !_isNewVisible;
                        });
                      },
                      icon: _isNewVisible
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your new password.';
                    }
                    if (value != _newPasswordController.text) {
                      return 'Passwords do not match.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),

                // ElevatedButton(
                //   onPressed: _isLoading ? null : _handleChangePassword,
                //   child: _isLoading
                //       ? CircularProgressIndicator()
                //       : Text('ubah password'),
                //   style: ElevatedButton.styleFrom(
                //     primary: Colors.red, // warna latar belakang tombol
                //     onPrimary: Colors.white, // warna teks pada tombol
                //   ),
                // ),
                ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    _doChangeEmail();
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    // ignore: use_full_hex_values_for_flutter_colors
                    backgroundColor: const Color(0xffff80849),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleChangePassword() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    if (_formKey.currentState!.validate()) {
      await Future.delayed(Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });
      // Show notification
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('password telah diganti.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 10),
        ),
      );
    }
  }
}


// class _ProfileEditPasswordPageState extends State<ProfileEditPasswordPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 255, 0, 0),
//           title: Text('Halaman Edit Kata Sandi'),
          
//         ),
//         body: Center(
//           child: Text('page Buat Ubah Password'),
//         ),
//     );
//   }
// }