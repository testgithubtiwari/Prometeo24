// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';

void subscribeToPrometeoNews() async {
  await FirebaseMessaging.instance.subscribeToTopic('prometeoNews');
  print('Subscribed to breakingNews topic');
}
