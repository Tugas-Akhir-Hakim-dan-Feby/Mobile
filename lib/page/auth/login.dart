import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:api_mobile/connection/app_config.dart';
import 'package:api_mobile/model/login_model.dart';
// import 'package:api/connection/app_config.dart';
// import 'package:api/model/login_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sp_util/sp_util.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtUsername = TextEditingController();
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();
  var _isVisible = false;

  Future _doLogin() async {
    if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
      Alert(context: context, title: "Data tidak benar", type: AlertType.error)
          .show();
      return;
    }
      final response = await http.post(Uri.parse(AppConfig.getUrl() + 'login'), 
    body: {
      'email': txtUsername.text,
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
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: deviceHeight * 0.32,
                child: FittedBox(
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
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: LayoutBuilder(builder: (ctx,constraints){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(' Asosiasi Pengelasan',
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
                      Container(
                        height: constraints.maxHeight*0.12,
                        decoration: BoxDecoration(
                          color: Color(0xffB4B4B4).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Center(
                            child: TextField(
                              controller: txtUsername,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Masukan Alamat Email',
                              ),
                            ),
                          ),
                        )
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Container(
                        height: constraints.maxHeight * 0.12,
                        decoration: BoxDecoration(
                          color: Color(0xffB4B4B4).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Center(
                            child: TextField(
                              controller: txtPassword,
                              obscureText: _isVisible ? false : true,
                              decoration: InputDecoration(
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
                                  border: InputBorder.none,
                                  hintText: 'Password',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: (){}, child: Text(
                            'Forgot Password',
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
                        child: ElevatedButton(
                          onPressed: (){
                            _doLogin();
                          },
                          child: Text(
                            'Masuk',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          style:ElevatedButton.styleFrom(
                            primary: Color(0xffff80849),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight *0.02,
                      ),
                      RichText(text: TextSpan(
                        text: 'Dont\'t have an Account',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize : 18,
                        ),
                        children: [
                          TextSpan(
                            text: 'Register',
                            style:TextStyle(
                              color:Color(0xfff80849),
                              fontSize: 18,
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
    return Container(      
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