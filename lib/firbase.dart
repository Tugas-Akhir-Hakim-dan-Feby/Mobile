import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotification {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Menghandle pesan yang diterima saat aplikasi sedang berjalan
      print('onMessage: $message');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Menghandle pesan yang diterima saat aplikasi dibuka dari notifikasi
      print('onMessageOpenedApp: $message');
    });

    // Meminta izin untuk menerima notifikasi (hanya perlu dilakukan sekali)
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }

  Future<String?> getToken() async {
    String? token = await _firebaseMessaging.getToken();
    print('FCM Token: $token');
    return token;
  }

  checkIosNotificationPermission() {}
}
