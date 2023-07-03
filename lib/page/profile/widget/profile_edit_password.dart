import 'dart:convert';

import 'package:api_mobile/auth/style_alert.dart';
import 'package:api_mobile/components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileEditPasswordPage extends StatefulWidget {
  const ProfileEditPasswordPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPasswordPage> createState() =>
      _ProfileEditPasswordPageState();
}

class _ProfileEditPasswordPageState extends State<ProfileEditPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _isOldVisible = false;
  bool _isNewVisible = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _hasPasswordOneNumber = false;
  bool _isPasswordEightCharacters = false;
  bool _matchConfirmationPassword = false;
  bool _matchPassword = false;

  void onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    setState(() {
      _isPasswordEightCharacters = password.length >= 8;
      _hasPasswordOneNumber = numericRegex.hasMatch(password);
      _matchPassword =
          confirmPasswordController.text.isNotEmpty &&
              password == confirmPasswordController.text;
      _matchConfirmationPassword =
          newPasswordController.text.isNotEmpty &&
              password == newPasswordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _doChangeEmail() async {
      String currentPassword = currentPasswordController.text;
      String newPassword = newPasswordController.text;
      String confirmPassword = confirmPasswordController.text;

      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(
        msg: "Memuat......",
        progressBgColor: const Color.fromARGB(0, 174, 155, 155),
        max: 100,
        barrierDismissible: true,
        hideValue: true,
      );
      final token = SpUtil.getString('token');

      if (token == null) {
        throw Exception('Token tidak ditemukan');
      }
      final response = await http.post(
        Uri.parse(
            "https://develop-ta.berobatplus.shop/api/v1/user/update-password"),
        body: {
          'current_password': currentPassword,
          'new_password': newPassword,
          'confirm_password': confirmPassword,
        },
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      progressDialog.close();
      print(response.body);
      if (response.statusCode == 200) {
        // Update password in Firebase
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          try {
            await user.updatePassword(newPassword);
          } catch (e) {
            print('Failed to update password in Firebase: $e');
          }
        }

        Alert(
          context: context,
          type: AlertType.success,
          // alertAnimation: fadeAlertAnimation,
          style: alertStyle,
          title: "password telah diperbarui",
          buttons: [
            DialogButton(
              color: const Color.fromARGB(255, 68, 233, 74),
              child: const Text(
                "Kembali",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            )
          ],
        ).show();
      } else if (response.statusCode == 400) {
        var data = json.decode(response.body);
        var errorMessages = data["messages"];
        Alert(
          context: context,
          title: errorMessages,
          type: AlertType.warning,
          buttons: [
            DialogButton(
              child: const Text(
                "coba lagi",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ).show();
      } else {
        Alert(
          context: context,
          title: "Data Gagal disimpan",
          type: AlertType.error,
        ).show();
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Ubah Password'),
        backgroundColor: const Color.fromARGB(255, 244, 17, 17),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/images/logo_api.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1),
                  BlendMode.dstATop,
                ),
              ),
            ),
            width: 290,
            height: 248,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      obscureText: _isOldVisible,
                      controller: currentPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Password Anda Saat Ini',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        prefixIcon: const Icon(Icons.lock),
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
                          return 'Masukkan password Anda saat ini.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      onChanged: (value) {
                        onPasswordChanged(value);
                      },
                      obscureText: _isNewVisible,
                      controller: newPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Password Baru',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        prefixIcon: const Icon(Icons.lock),
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
                          return 'Masukkan password baru Anda (minimal 8 karakter).';
                        }
                        if (value.length < 8) {
                          return 'Password baru harus terdiri dari minimal 8 karakter.';
                        }
                        if (!_hasPasswordOneNumber) {
                          return 'Password baru harus mengandung setidaknya satu angka.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      onChanged: (value) {
                        onPasswordChanged(value);
                      },
                      obscureText: _isNewVisible,
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Konfirmasi Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        prefixIcon: const Icon(Icons.lock),
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
                          return 'Masukkan konfirmasi password Anda (minimal 8 karakter).';
                        }
                        if (value.length < 8) {
                          return 'Konfirmasi password harus terdiri dari minimal 8 karakter.';
                        }
                        if (value != newPasswordController.text) {
                          return 'Password dan konfirmasi password tidak cocok.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: _hasPasswordOneNumber
                                ? Colors.green
                                : Colors.transparent,
                            border: _hasPasswordOneNumber
                                ? Border.all(color: Colors.transparent)
                                : Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Mengandung 1 angka / karakter unik")
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: _isPasswordEightCharacters
                                ? Colors.green
                                : Colors.transparent,
                            border: _isPasswordEightCharacters
                                ? Border.all(color: Colors.transparent)
                                : Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Password minimal 8 karakter")
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: _matchPassword
                                ? Colors.green
                                : Colors.transparent,
                            border: _matchPassword
                                ? Border.all(color: Colors.transparent)
                                : Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Password dan Konfirmasi Password Cocok")
                      ],
                    ),
                    const SizedBox(height: 20.0),
                        ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _doChangeEmail();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: maincolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Simpan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
