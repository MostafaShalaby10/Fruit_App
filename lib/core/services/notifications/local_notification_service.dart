import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  // For solving errors in receive background notification
  static onNotification(NotificationResponse notificationResponse) {}
  static Future init() async {
    InitializationSettings initializationSettings =
        const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings(),
        );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,

      onDidReceiveBackgroundNotificationResponse: onNotification,
      onDidReceiveNotificationResponse: onNotification,
    );
  }

  static void showNotification(RemoteMessage message) async {
    flutterLocalNotificationsPlugin.show(
      1,
      message.notification!.title,
      message.notification!.body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'channelId',
          'channelName',
          importance: Importance.max,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
    );
  }
}
