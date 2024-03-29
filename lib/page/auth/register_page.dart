// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, duplicate_ignore, use_build_context_synchronously
import 'package:api_mobile/auth/style_alert.dart';
import 'package:api_mobile/components/constants.dart';
import 'package:api_mobile/connection/app_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  final GlobalKey<FlutterPwValidatorState> validatorKey =
      GlobalKey<FlutterPwValidatorState>();
  final _formKey = GlobalKey<FormState>();
  bool _isVisible = false;
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
  Future _doRegister() async {
  String name = txtUsername.text;
  String email = txtEmail.text;
  String password = txtPassword.text;

  if (name.isEmpty || email.isEmpty) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Data tidak boleh kosong"),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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

  final response = await http.post(
    Uri.parse('${AppConfig.getUrl()}auth/register'),
    body: {
      'name': name,
      'email': email,
      'password': password,
      'retype_password': password,
    },
    headers: {
      'Accept': 'application/json',
    },
  );

  progressDialog.close();
  print(response.body);

  if (response.statusCode == 201) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userCredential.user != null) {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      final CollectionReference usersRef = _firestore.collection('users');
      final userId = userCredential.user!.uid;
      final userData = {
        'email': email,
        'name': name,
        'createdAt': DateTime.now(),
      };
      await usersRef.doc(userId).set(userData);

      await userCredential.user!.updateDisplayName(name);

      Alert(
        context: context,
        title: "Cek Email Anda",
        desc: "Cek Pesan Email Anda untuk Verifikasi",
        alertAnimation: fadeAlertAnimation,
        image: Image.asset("assets/images/email.png"),
        buttons: [
          DialogButton(
            child: const Text("OK"),
            onPressed: () {
              Get.offAndToNamed('/login_page');
            },
          ),
        ],
      ).show().then((value) {
              Get.offAndToNamed('/login_page');
      });
    } else {
      Alert(
        context: context,
        title: "Data Gagal disimpan",
        type: AlertType.error,
      ).show();
    }
  } else if (response.statusCode == 422) {
    print(response.statusCode);
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
        ),
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

    final deviceHeight = MediaQuery.of(context).size.height;
    // final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              // height: deviceHeight * 0.2,
              height: MediaQuery.of(context).size.height * 0.2,
              child: const FittedBox(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logo_api.jpg'),
                  // radius: 120,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Container(
                // height: deviceHeight * 0.609,
                height: deviceHeight * 0.733,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: LayoutBuilder(
                  builder: (ctx, constraints) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          colorizeAnimation(),
                          const Text(
                            ' Daftar Menjadi Bagian dari Asosiasi Pengelasan Indonesia',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.05,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Center(
                              child: TextFormField(
                                controller: txtUsername,
                                validator: (value) {
                                  // Check if this field is empty
                                  if (value == null || value.isEmpty) {
                                    return 'Nama Harus di isi';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 228, 226, 226)
                                          .withOpacity(0.4),
                                  hintText: "Masukan Nama Anda",
                                  labelText: "Nama",
                                  icon: const Icon(Icons.people),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                ),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: const Color.fromARGB(255, 0, 0, 0)
                                      .withOpacity(0.4),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.04,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Center(
                              child: TextFormField(
                                controller: txtEmail,
                                validator: (value) {
                                  // Check if this field is empty
                                  if (value == null || value.isEmpty) {
                                    return 'Email Harus di isi';
                                  }
                                  // using regular expression
                                  if (!RegExp(r'\S+@\S+\.\S+')
                                      .hasMatch(value)) {
                                    return "Masukan Email yang Valid";
                                  }
                                  // the email is valid
                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 228, 226, 226)
                                          .withOpacity(0.4),
                                  hintText: "Masukan alamat email anda",
                                  labelText: "Email",
                                  icon: const Icon(Icons.email),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                ),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: const Color.fromARGB(255, 0, 0, 0)
                                      .withOpacity(0.4),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.04,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Column(
                              children: [
                                Center(
                                  child: TextFormField(
                                    controller: txtPassword,
                                    // obscureText: _isVisible ? false : true,
                                    onChanged: (password) =>
                                        onPasswordChanged(password),
                                    obscureText: _isVisible,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Kata Sandi harus di isi';
                                      }
                                      // Check if the password meets the minimum length requirement
                                      if (value.length < 8) {
                                        return 'Kata Sandi minimal 8 karakter';
                                      }
                                      // Check if the password contains at least one number
                                      if (!RegExp(r'\d').hasMatch(value)) {
                                        return 'Kata Sandi harus mengandung setidaknya satu angka';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                              255, 228, 226, 226)
                                          .withOpacity(0.4),
                                      hintText: "Masukan Kata Sandi",
                                      labelText: "Kata Sandi",
                                      icon: const Icon(Icons.key),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isVisible = !_isVisible;
                                          });
                                        },
                                        icon: _isVisible
                                            ? const Icon(
                                                Icons.visibility,
                                                color: Colors.red,
                                              )
                                            : const Icon(
                                                Icons.visibility_off,
                                                color: Colors.grey,
                                              ),
                                        // icon: Icon(
                                        //   _isVisible
                                        //       ? Icons.visibility
                                        //       : Icons.visibility_off,
                                        //   color: Color.fromARGB(255, 158, 158, 158),
                                        // ),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: _isPasswordEightCharacters
                                              ? Colors.green
                                              : Colors.transparent,
                                          border: _isPasswordEightCharacters
                                              ? Border.all(
                                                  color: Colors.transparent)
                                              : Border.all(
                                                  color: Colors.grey.shade400),
                                          borderRadius:
                                              BorderRadius.circular(50)),
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
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: _hasPasswordOneNumber
                                              ? Colors.green
                                              : Colors.transparent,
                                          border: _hasPasswordOneNumber
                                              ? Border.all(
                                                  color: Colors.transparent)
                                              : Border.all(
                                                  color: Colors.grey.shade400),
                                          borderRadius:
                                              BorderRadius.circular(50)),
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
                                    const Text("Mengandung 1 angka /  karakter unik")
                                  ],
                                ),
                                // SizedBox(
                                //   height: constraints.maxHeight *0.02,
                                // ),
                                //     new FlutterPwValidator(
                                //     key: validatorKey,
                                //     controller: txtPassword,
                                //     minLength: 8,
                                //     uppercaseCharCount: 2,
                                //     numericCharCount: 3,
                                //     specialCharCount: 1,
                                //     normalCharCount: 3,
                                //     width: 300,
                                //     height: 100,
                                //     onSuccess: () {
                                //       print("MATCHED");
                                //       ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                                //           content: new Text("Password is matched")));
                                //     },
                                //     onFail: () {
                                //       print("NOT MATCHED");
                                //     },
                                //   ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.0001,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/reset_password_page');
                                  },
                                  child: const Text(
                                    'Lupa Kata Sandi',
                                    style: TextStyle(
                                      color: Color(0xfff80849),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: constraints.maxHeight * 0.12,
                            // margin: EdgeInsets.only(
                            //   top: constraints.maxHeight *0.05,
                            // ),
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _doRegister();
                                }
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
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.02,
                          ),
                          RichText(
                              text: TextSpan(
                            text: 'Sudah Punya Akun  ',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                            ),
                            children: [
                              TextSpan(
                                text: 'Masuk',
                                style: const TextStyle(
                                  color: Color(0xfff80849),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, '/login_page');
                                  },
                              ),
                            ],
                          ))
                        ],
                      ),
                    );
                  },
                ),
                // color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
