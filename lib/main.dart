import 'package:api_mobile/firebase_options.dart';
import 'package:api_mobile/page/auth/login.dart';
import 'package:api_mobile/page/auth/register_page.dart';
import 'package:api_mobile/page/home/home.dart';
import 'package:api_mobile/page/navigasi_bottom/navigasi.dart';
import 'package:api_mobile/page/profile/profile.dart';
import 'package:api_mobile/page/splash/splash.dart';
import 'package:api_mobile/page/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sp_util/sp_util.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

// void main() => runApp(MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {

    if (message.notification != null) {
    }
  });
  await SpUtil.getInstance();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asosiasi Pengelasan Indonesia',
      routes: {
        // 'register_page': (context) => const RegisterPage(),
        'login_page': (context) => const LoginPage(),
        'register_page': (context) => const RegisterPage(),
        'splash_page': (context) => const SplashPage(),
        'profile_page': (context) => const ProfilePage(),
        'home_page':(context) => const HomePage(),
        'welcome_page': (context) => const WelcomePage(),
        // 'navigasi_page':(context) => const Navigasi(),
        'navigasi_page':(context) =>  const NavigasiPage(),
      },

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute:
          (SpUtil.getBool("isLogin")!) ? 'navigasi_page' : 'splash_page',
    );
  }
}