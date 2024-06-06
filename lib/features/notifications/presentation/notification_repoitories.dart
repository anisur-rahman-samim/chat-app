import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> initializeNotifications() async {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings =
  InitializationSettings(
      android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}
Future<void> showNotification(RemoteMessage message) async {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // Extract notification data
  final notification = message.notification;
  const androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    //'your channel description',
    importance: Importance.max,
    priority: Priority.high,
  );
  final platformChannelSpecifics =
  const NotificationDetails(android: androidPlatformChannelSpecifics);

  // Display the notification
  await flutterLocalNotificationsPlugin.show(
    0, // Notification ID
    notification?.title ?? '', // Notification title
    notification?.body ?? '', // Notification body
    platformChannelSpecifics,
  );
}