import 'package:api_mobile/firebase_options.dart';
import 'package:api_mobile/page/auth/login.dart';
import 'package:api_mobile/page/auth/login.dart';
import 'package:api_mobile/page/auth/register_page.dart';
import 'package:api_mobile/page/home/home.dart';
import 'package:api_mobile/page/navigasi_bottom/navigasi.dart';
import 'package:api_mobile/page/profile/profile.dart';
import 'package:api_mobile/page/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

// void main() => runApp(MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  await SpUtil.getInstance();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asosiasi Pengelasan Indonesia',
      routes: {
        // 'register_page': (context) => const RegisterPage(),
        'login_page': (context) => LoginScreen(),
        'register_page': (context) => RegisterPage(),
        'splash_page': (context) => SplashPage(),
        'profile_page': (context) => ProfilePage(),
        'home_page':(context) => HomePage(),
        'navigasi_page':(context) => Navigasi(),
      },

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute:
          (SpUtil.getBool("isLogin")!) ? 'navigasi_page' : 'splash_page',
    );
  }
}
