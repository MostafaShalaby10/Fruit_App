
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:task_one/core/services/notifications/local_notification_service.dart';

class NotificationServices {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<void> init() async {
    await messaging.requestPermission();
    var token = await messaging.getToken();
    log(token!);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LocalNotificationService.showNotification(message);
    });
  }

  static Future handleBackgroundMessage(RemoteMessage message) async {}
}
