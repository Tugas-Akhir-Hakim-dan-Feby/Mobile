// ignore_for_file: use_build_context_synchronously

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:api_mobile/connection/app_config.dart';
import 'package:api_mobile/model/login_model.dart';
// import 'package:api/connection/app_config.dart';
// import 'package:api/model/login_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sp_util/sp_util.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  // ignore: non_constant_identifier_names
  final username_controller = TextEditingController();
  // ignore: non_constant_identifier_names
  final password_controller = TextEditingController();
  var _isVisible = false;

  Future _doLogin() async {
    if (txtEmail.text.isEmpty || txtPassword.text.isEmpty) {
      Alert(context: context, title: "Data tidak benar", type: AlertType.error)
          .show();
      return;
    }
      // ignore: prefer_interpolation_to_compose_strings
      final response = await http.post(Uri.parse(AppConfig.getUrl() + 'login'), 
    body: {
      'email': txtEmail.text,
      'password': txtPassword.text,
    }, headers: {
      'Accept': 'application/json'
    });

    if (response.statusCode == 200) {
      final loginModel = loginModelFromJson(response.body);
      var token = loginModel.data.user.token; // route dari json array nya
      SpUtil.putString("token", token);
      SpUtil.putString("name", loginModel.data.user.name);
      SpUtil.putBool('isLogin', true);
      Alert(
          context: context,
          title: "Login Berhasil",
          type: AlertType.success,
          buttons: [
            DialogButton(
              child: const Text("Ok"),
              onPressed: () {
                // Navigator.pushReplacementNamed(context, 'navigasi_page');
                Navigator.pushNamed(context, 'navigasi_page');
              },
            )
          ]).show();
    } else {
      Alert(context: context, title: "Login Gagal", type: AlertType.error)
          .show();
    }
  }


  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    // final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: deviceHeight * 0.32,
                child: const FittedBox(
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/logo_api.jpg'
                    ),
                    radius: 120,
                  ),
                ),
              ),
              Container(
                height: deviceHeight * 0.609,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: LayoutBuilder(builder: (ctx,constraints){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(' Asosiasi Pengelasan',
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32, 
                          fontWeight:FontWeight.bold, 
                          ),
                      ),
                      colorizeAnimation(),
                      SizedBox(
                        height: constraints.maxHeight* 0.09,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Center(
                            child: TextFormField(
                              controller: txtEmail,
                              validator: (value) {
                                // Check if this field is empty
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                // using regular expression
                                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                  return "Please enter a valid email address";
                                }
                                // the email is valid
                                return null;
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color.fromARGB(255, 228, 226, 226).withOpacity(0.4),
                              hintText: "Masukan alamat email anda",
                              labelText: "Email",
                              icon: const Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 18.0,
                                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
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
                            controller: txtPassword,
                            obscureText: _isVisible ? false : true,
                            decoration: InputDecoration(
                              filled: true,
                                  fillColor: const Color.fromARGB(255, 228, 226, 226).withOpacity(0.4),
                              hintText: "Masukan Kata Sandi",
                              labelText: "Kata Sandi",
                              icon: const Icon(Icons.key),
                              suffixIcon: IconButton(
                                onPressed:(){
                                setState((){
                                  _isVisible = !_isVisible;
                                });
                              },
                                icon: Icon(
                                  _isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                                  color: Colors.grey,
                                ), 
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                                ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: (){}, child: const Text(
                            'Lupa Kata Sandi',
                            style: TextStyle(
                              color: Color(0xfff80849),
                            ),
                          ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: constraints.maxHeight * 0.12,
                        margin: EdgeInsets.only(
                          top: constraints.maxHeight *0.05,
                        ),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                          onPressed: (){
                            _doLogin();
                            
                          },
                          style:ElevatedButton.styleFrom(
                            // ignore: use_full_hex_values_for_flutter_colors
                            backgroundColor: const Color(0xffff80849),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Masuk',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight *0.02,
                      ),
                      RichText(text: TextSpan(
                        text: 'Tidak Punya Akun  ',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize : 19,
                        ),
                        children: [
                          TextSpan(
                            text: 'Daftar',
                            style:const TextStyle(
                              color:Color(0xfff80849),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = (){
                              Navigator.pushNamed(context, 'register_page');
                            }
                          ),
                        ],
                      ))
                    ],
                  );
                },),
                // color: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }

    Widget colorizeAnimation() {
    const colorizeColors = [
    Color.fromARGB(255, 255, 17, 0),
    Color.fromARGB(255, 242, 36, 36),
    Color.fromARGB(255, 248, 52, 52),
    Color.fromARGB(255, 244, 144, 144),

    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 33.0,
      fontWeight:FontWeight.bold, 
    );
    return SizedBox(      
      width: double.infinity,
      child: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              'Indonesia',
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),
            // ColorizeAnimatedText(
            //   'Indonesia',
            //   textStyle: colorizeTextStyle,
            //   colors: colorizeColors,
            // ),
            // ColorizeAnimatedText(
            //   'Indonesia',
            //   textStyle: colorizeTextStyle,
            //   colors: colorizeColors,
            // ),
          ],
          // isRepeatingAnimation: true,
          // totalRepeatCount: 10,
          repeatForever: true,
        ),
      ),
    );
  }

}