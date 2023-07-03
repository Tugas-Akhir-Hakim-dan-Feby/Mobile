import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future initializeFirebaseMessaging() async {
    // Request permission for notification
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission for notification');
    } else {
      print('User declined or has not accepted permission for notification');
    }

    // Configure the app to receive messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message while the app is in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }

      // Process your notification as per your requirement
      // You can show a dialog, display a notification, etc.
    });

    // If the app is in the background, the message is displayed in the system tray
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }

      // Navigate to the appropriate screen based on the notification
      // You can use the message data to determine the destination screen
    });

    // If the app was terminated and then opened by tapping the notification
    if (await _firebaseMessaging.getInitialMessage() != null) {
      RemoteMessage? initialMessage =
          await _firebaseMessaging.getInitialMessage();
      print('App was opened by tapping on a notification!');
      print('Message data: ${initialMessage!.data}');

      if (initialMessage.notification != null) {
        print(
            'Message also contained a notification: ${initialMessage.notification}');
      }

      // Navigate to the appropriate screen based on the notification
      // You can use the message data to determine the destination screen
    }
  }
}
