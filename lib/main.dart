// ignore_for_file: avoid_print

// import 'dart:js';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prometeo/api/fecth_curr_team.dart';
import 'package:prometeo/api/fetch_past_teams.dart';
import 'package:prometeo/api/fetch_sponsors.dart';
import 'package:prometeo/firebase_options.dart';
import 'package:prometeo/notification_service/local_notification.dart';
import 'package:prometeo/prometeo_news.dart';
import 'package:prometeo/widgets/dashboard.dart';
// import 'package:prometeo/api/fetch_timelines.dart';
// import 'package:prometeo/api/gallery_fetch.dart';
// import 'package:prometeo/constants.dart';
// import 'package:prometeo/pages/homepage.dart';
// import 'package:prometeo/widgets/firebase_api.dart';
import 'package:prometeo/widgets/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'package:prometeo/api/fetch_events.dart';
import 'package:prometeo/models/userdata.dart';
// import 'package:prometeo/widgets/update_profile.dart';
import 'package:provider/provider.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

// class MyHttpoverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // HttpOverrides.global = new MyHttpoverrides();
  // Initialize Firebase here
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseApi().initNotification();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();

  runApp(
    ChangeNotifierProvider(
      create: (context) => UserDataProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    subscribeToPrometeoNews();
    fetchEventData();
    fetchCurrTeam();
    fetchPastTeams();
    // fetchMedia();
    // fetchTimeLines();
    fetchSponsors();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {'/dashboard': (context) => DashBoard()},
      ),
    );
  }
}
