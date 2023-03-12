import 'dart:convert';

import 'package:api_mobile/auth/style_alert.dart';
import 'package:api_mobile/page/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sn_progress_dialog/options/completed.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:sp_util/sp_util.dart';

class AuthController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  Future<bool?> login({
    int? roleId,
    String? email,
    String? password,
    BuildContext? context,
  }) async {
    ProgressDialog progressDialog = ProgressDialog(context: context);

    progressDialog.show(
      msg: "Memuat......", 
      progressBgColor: const Color.fromARGB(0, 174, 155, 155),
      max: 100,
      barrierDismissible: true,
      completed: Completed(),
    );
    
    final response = await http.post(
        Uri.parse("https://hakim.berobatplus.shop/api/v1/auth/login"),
        body: {
          'email': email,
          'password': password,
        },
        headers: {
          'Accept': 'application/json'
        });
    progressDialog.close();
    try {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        SpUtil.putBool('isLogin', true);
        SpUtil.putString("token", ["token"].toString());
        SpUtil.putString("name", data['user']['name'].toString());
        SpUtil.putString("email", data['user']['email'].toString());
        SpUtil.putString("role_id", data['user']['role_id'].toString());
        if (data['user']['role_id'] == 4) {
          Alert(
            context: context!,
            style: alertStyle,
            title: "Selamat Datang",
            // desc: "Selamat Datang",
            alertAnimation: fadeAlertAnimation,
            buttons: [
            DialogButton(
              child: const Text("Masuk"),
              onPressed: () {
                Navigator.pushNamed(context, 'navigasi_page');
              },
            )
          ]
          ).show();

          Get.offAll(const ProfilePage());
        }
        if (data['user']['role_id'] == 7) {
            Alert(
            context: context!,
            type: AlertType.success,
            style: alertStyle,
            title: "Selamat Datang",
            // desc: "Flutter is more awesome with RFlutter Alert.",
            alertAnimation: fadeAlertAnimation,
            buttons: [
            DialogButton(
              child: const Text(
                "Masuk",
                style: TextStyle(color: Colors.white, fontSize: 14,),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'navigasi_page');
              },
            )
          ]
          ).show();
        }
        return true;
      }
      if (response.statusCode == 400) {
        Alert(
          context: context!, 
          title: "Password dan Email Salah", 
          type: AlertType.error).show();
        return false;
      } else {

        return false;
      }
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }


  // Widget fadeAlertAnimation(
  //   BuildContext context,
  //   Animation<double> animation,
  //   Animation<double> secondaryAnimation,
  //   Widget child,
  // ) {
  //   return Align(
  //     child: FadeTransition(
  //       opacity: animation,
  //       child: child,
  //     ),
  //   );
  // }

  // var alertStyle = AlertStyle(
  //       animationType: AnimationType.fromTop,
  //       isCloseButton: false,
  //       isOverlayTapDismiss: false,
  //       descStyle: TextStyle(fontWeight: FontWeight.bold),
  //       animationDuration: Duration(milliseconds: 20),
  //       alertBorder: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(0.0),
  //         side: BorderSide(
  //           color: Colors.grey,
  //         ),
  //       ),
  //       titleStyle: TextStyle(
  //         color: Colors.red,
  //       ),
  //       constraints: BoxConstraints.expand(width: 1000),
  //       //First to chars "55" represents transparency of color
  //       overlayColor: Color(0x55000000),
  //       alertElevation: 0,
  //       alertAlignment: Alignment.center);


}
