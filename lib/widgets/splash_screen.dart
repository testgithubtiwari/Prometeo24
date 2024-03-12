import 'package:flutter/material.dart';
import 'dart:async';
import 'package:prometeo/constants.dart';
// import 'package:prometeo/pages/homepage.dart';
import 'package:prometeo/widgets/bottom.dart';

class SplashScreen extends StatefulWidget {
  // final Widget page; // Change the type to Widget
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // precacheImage(const NetworkImage(pastTeamsStone), context);
  //   // precacheImage(const NetworkImage(pasTeamsBackground), context);
  //   // precacheImage(const NetworkImage(teamsStone), context);
  //   // precacheImage(const NetworkImage(preregistrationbackground), context);
  //   // precacheImage(const NetworkImage(themePageBackground), context);
  //   // precacheImage(const NetworkImage(themeStone), context);
  //   // precacheImage(const NetworkImage(eventsStone), context);
  //   // precacheImage(const NetworkImage(technicalBanner), context);
  //   // precacheImage(const NetworkImage(enterpreneuricalBanner), context);
  //   // precacheImage(const NetworkImage(exhibitionBanner), context);
  //   // precacheImage(const NetworkImage(informalBanner), context);
  //   // precacheImage(const NetworkImage(speakerBanner), context);
  //   // precacheImage(const AssetImage(homepageBackground), context);
  //   // precacheImage(const AssetImage(homepageBackground401450), context);
  //   // precacheImage(const AssetImage(homepageBackground451500), context);
  //   // precacheImage(const AssetImage(homepageBackground501550), context);
  //   // precacheImage(const AssetImage(homepageBackgroundother), context);
  // }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () {
      Timer(const Duration(milliseconds: 4400), () {
        _navigateToPage();
      });
    });
  }

  _navigateToPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(loaderGif),
            ),
          ),
        ),
      ),
    );
  }
}
