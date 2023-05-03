import 'package:api_mobile/firebase_options.dart';
import 'package:api_mobile/page/auth/login_page.dart';
import 'package:api_mobile/page/auth/register_page.dart';
import 'package:api_mobile/page/auth/reset_password.dart';
import 'package:api_mobile/page/dashboard/dashboard.dart';
import 'package:api_mobile/page/navigasi_bottom/navigasi.dart';
import 'package:api_mobile/page/profile/profile.dart';
import 'package:api_mobile/page/profile/widget/certificate.dart';
import 'package:api_mobile/page/profile/widget/edit_profile.dart';
import 'package:api_mobile/page/profile/widget/follow_us.dart';
import 'package:api_mobile/page/profile/widget/help.dart';
import 'package:api_mobile/page/profile/widget/member_profile.dart';
import 'package:api_mobile/page/profile/widget/profile_edit_password.dart';
import 'package:api_mobile/page/profile/widget/terms_page.dart';
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
        'dashboard_page':(context) => const Dashboard(),
        'welcome_page': (context) => const WelcomePage(),
        // 'navigasi_page':(context) => const Navigasi(),
        'navigasi_page':(context) =>  const NavigasiPage(),
        'edit_profile': (context) => const EditProfile(),
        'certificate_page': (context) => const Certificate(),
        'member_profile_page': (context) => const MemberProfilePage(),
        'profile_edit_password_page': (context) => const ProfileEditPasswordPage(),
        'terms_condition_page': (context) => const TermsConditionPage(),
        'follow_us_page': (context) => const FollowUsPage(),
        'help_page': (context) => const HelpPage(),
        'reset_password_page': (context) => const ResetPasswordPage(),
        
        
        
        
      },

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute:
          (SpUtil.getBool("isLogin")!) ? 'navigasi_page' : 'splash_page',
    );
  }
}