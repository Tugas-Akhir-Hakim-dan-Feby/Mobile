import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:api_mobile/connection/app_config.dart';
import 'package:api_mobile/model/login_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:sp_util/sp_util.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  
  

  @override
  Widget build(BuildContext context) {
    Future _doRegister() async {
    String name = txtUsername.text;
    String email = txtEmail.text;
    if (name.isEmpty || email.isEmpty) {
      Alert(
              context: context,
              title: "Data tidak boleh kosong",
              type: AlertType.error)
          .show();
      return;
    }
    ProgressDialog progressDialog = ProgressDialog(context: context);
    progressDialog.show(msg: "Loading......", max: 100);
    final response =
        await http.post(Uri.parse(AppConfig.getUrl() ), body: {
      'name': name,
      'email': email,
    }, headers: {
      'Accept': 'application/json'
    });

    progressDialog.close();
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 201) {
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
    } 
    else if (response.statusCode == 400) {
      Alert(
          context: context,
          title: "Email Sudah Terdaftar",
          type: AlertType.warning,
          buttons: [
            DialogButton(
              child: Text(
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
      Alert(
              context: context,
              title: "Data Gagal disimpan",
              type: AlertType.error)
          .show();
    }
  }
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
                      animationDaftar(),
                      Text(' Asosiasi Profesi',
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 33, 
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
                                hintText: 'Masukan Username Anda',
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
                              controller: txtEmail,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Masukan Email Anda',
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
                            _doRegister();
                          },
                          child: Text(
                            'Daftar',
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
                      RichText(
                        text: TextSpan(
                        text: 'have an Account  ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize : 19,
                        ),
                        
                        children: [
                          TextSpan(
                            text: 'Login',
                            style:TextStyle(
                              color:Color(0xfff80849),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = (){}
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


  Widget animationDaftar() {
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
              'Daftar',
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),
          ],
          // isRepeatingAnimation: true,
          // totalRepeatCount: 10,
          repeatForever: true,
        ),
      ),
    );
  }

  Widget fadeAlertAnimation(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return Align(
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }

}

