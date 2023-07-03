// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:api_mobile/auth/style_alert.dart';
import 'package:api_mobile/connection/app_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sn_progress_dialog/options/completed.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:sp_util/sp_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AuthController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

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
        Uri.parse('${AppConfig.getUrl()}auth/login'),
        body: {
          'email': email,
          'password': password,
        },
        headers: {
          'Accept': 'application/json'
        });
    try {
      if (response.statusCode == 200) {
        progressDialog.close();
        var data = json.decode(response.body);
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: email!, password: password!);
        if (userCredential != null) {
          DocumentReference documentReference =
              _firestore.collection('users').doc(userCredential.user!.uid);
          await documentReference.set({
            'name': userCredential.user!.displayName ?? "",
            'email': userCredential.user!.email ?? "",
            // 'role_id': roleId ?? 0,
          });
        }
        String? fcmToken = await _firebaseMessaging.getToken();
        if (fcmToken != null) {
          await _firestore
              .collection('users')
              .doc(userCredential.user!.uid)
              .update({'fcmToken': fcmToken});
        }

        SpUtil.putBool('isLogin', true);
        SpUtil.putString("token", data["token"].toString());
        SpUtil.putString("name", data["data"]['name'].toString());
        SpUtil.putString("email", data["data"]['email'].toString());
        SpUtil.putString("role_id", data["data"]['role_id'].toString());
        SpUtil.putString(
            "membership_card", data["data"]['membership_card'].toString());
        if (data["data"]['role_id'] == 7) {
          // login as welder member
          Alert(
            context: context!,
            type: AlertType.success,
            // alertAnimation: fadeAlertAnimation,
            style: alertStyle,
            title: "Selamat Datang",
            buttons: [
              DialogButton(
                color: const Color.fromARGB(255, 68, 233, 74),
                child: const Text(
                  "Masuk",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                onPressed: () {
                  Get.offNamedUntil('/navigasi_page', (route) => false);
                },
              )
            ],
          ).show().then((value) {
            Get.offNamedUntil('/navigasi_page', (route) => false);
          });
        }
        if (data["data"]['role_id'] == 6) {
          // progressDialog.close();
          // login as welder member
          Alert(
              context: context!,
              type: AlertType.success,
              alertAnimation: fadeAlertAnimation,
              style: alertStyle,
              title: "Selamat Datang",
              buttons: [
                DialogButton(
                  color: const Color.fromARGB(255, 68, 233, 74),
                  child: const Text(
                    "Masuk",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () {
                    Get.offNamedUntil('/navigasi_page', (route) => false);
                  },
                )
              ]).show().then((value) {
            Get.offNamedUntil('/navigasi_page', (route) => false);
          });
        }
        if (data["data"]['role_id'] == 5) {
          progressDialog.close();
          // login as member company
          Alert(
              context: context!,
              type: AlertType.success,
              alertAnimation: fadeAlertAnimation,
              style: alertStyle,
              title: "Selamat Datang",
              buttons: [
                DialogButton(
                  color: const Color.fromARGB(255, 68, 233, 74),
                  child: const Text(
                    "Masuk",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () {
                    Get.offNamedUntil('/navigasi_page', (route) => false);
                  },
                )
              ]).show();
        }
        if (data["data"]['role_id'] == 4) {
          progressDialog.close();
          Alert(
              // login as pakar
              context: context!,
              type: AlertType.success,
              // alertAnimation: fadeAlertAnimation,
              style: alertStyle,
              title: "Selamat Datang",
              buttons: [
                DialogButton(
                  color: const Color.fromARGB(255, 68, 233, 74),
                  child: const Text(
                    "Masuk",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () {
                    Get.offNamedUntil('/navigasi_page', (route) => false);
                  },
                )
              ]).show();
        }
        // return true;
      } else if (response.statusCode == 400) {
        progressDialog.close();
        var data = json.decode(response.body);
        var errorMessage = data["message"];
        // ignore: avoid_print
        print(response.statusCode);
        //   Alert(
        //     context: context!,
        //     title: "harap verifikasi email terlebih dahulu",
        //     alertAnimation: fadeAlertAnimation,
        //     image: Image.asset("assets/images/email.png"),
        //   ).show();
        Alert(
          type: AlertType.error,
          title: errorMessage,
          context: context!,
          alertAnimation: fadeAlertAnimation,
        ).show();
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
}
