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
    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      "10",
      "High Importance Notifications",
      importance: Importance.max,
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        importance: Importance.high,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
      ),
      iOS: const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
    flutterLocalNotificationsPlugin.show(
      0,
      message.notification!.title,
      message.notification!.body,
      notificationDetails,
    );
  }
}
