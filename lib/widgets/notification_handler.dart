// import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationHandler extends StatefulWidget {
//   @override
//   _NotificationHandlerState createState() => _NotificationHandlerState();
// }

// class _NotificationHandlerState extends State<NotificationHandler> {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   @override
//   void initState() {
//     super.initState();

//     _configureFirebaseMessaging();
//     _configureLocalNotifications();
//   }

//   void _configureFirebaseMessaging() {
//     _firebaseMessaging.configure(
//       onMessage: (Map<String, dynamic> message) async {
//         // Handle the incoming message when the app is in the foreground
//         print("onMessage: $message");
//         showNotification(
//           message['notification']['title'],
//           message['notification']['body'],
//         );
//       },
//       onLaunch: (Map<String, dynamic> message) async {
//         // Handle the incoming message when the app is terminated
//         print("onLaunch: $message");
//         // You can navigate to a specific screen or handle the data as needed
//       },
//       onResume: (Map<String, dynamic> message) async {
//         // Handle the incoming message when the app is in the background
//         print("onResume: $message");
//         // You can navigate to a specific screen or handle the data as needed
//       },
//     );
//   }

//   void _configureLocalNotifications() {
//     const AndroidInitializationSettings androidInitializationSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: androidInitializationSettings,
//     );

//     _flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   void showNotification(String? title, String? body) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your_channel_id', // Change this to a unique channel ID
//       'Your Channel Name',
//       'Your Channel Description',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: false,
//     );
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     await _flutterLocalNotificationsPlugin.show(
//       0, // Notification ID
//       title,
//       body,
//       platformChannelSpecifics,
//       payload: 'New Payload',
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // You can return an empty container or any other widget as needed
//     return Container();
//   }
// }
