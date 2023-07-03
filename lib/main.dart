
import 'package:api_mobile/routes/routing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sp_util/sp_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  // Mendaftarkan penangan notifikasi   
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // Logika penanganan notifikasi saat aplikasi 
    //berjalan dan diforeground
    print('OnMessage: $message');
  });
  

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    // Logika penanganan notifikasi saat aplikasi dibuka dari notifikasi
    print('OnMessageOpenedApp: $message');
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
      getPages: Routes.routes,
      theme: ThemeData(
        // primarySwatch: maincolor, 
        primarySwatch: Colors.grey,
        primaryColor: Colors.grey[900], 
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      initialRoute:
          (SpUtil.getBool("isLogin")!) ? '/navigasi_page' : '/splash_page',
    );
    
  }
}