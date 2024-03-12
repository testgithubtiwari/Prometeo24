import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/widgets/preregister_image.dart';
// import 'package:prometeo/widgets/preregistration.dart';
// import 'package:prometeo/widgets/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({Key? key}) : super(key: key);

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  DateTime targetDate = DateTime(2024, 1, 19, 0, 0, 0);
  Duration remainingTime = const Duration(seconds: 0);
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _loadTargetDate();
  }

  void _loadTargetDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedTargetDate = prefs.getString('targetDate');

    if (savedTargetDate != null) {
      setState(() {
        targetDate = DateTime.parse(savedTargetDate).toLocal();
      });
      _startCountdown();
    } else {
      final currentTime = DateTime.now().toUtc();
      setState(() {
        remainingTime = targetDate.difference(currentTime);
      });

      // If targetDate is not set, hard code it and save to SharedPreferences
      targetDate = DateTime(2024, 1, 19, 0, 0, 0).toLocal();
      _saveTargetDate();
    }
  }

  void _saveTargetDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('targetDate', targetDate.toUtc().toIso8601String());
    // print("Saved target date to SharedPreferences: $targetDate");
  }

  void _startCountdown() {
    final currentTime = DateTime.now().toUtc();
    if (targetDate.isAfter(currentTime)) {
      remainingTime = targetDate.difference(currentTime);
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        final currentTime = DateTime.now();
        if (targetDate.isAfter(currentTime)) {
          setState(() {
            remainingTime = targetDate.difference(currentTime);
          });
        } else {
          _timer.cancel(); // Cancel the timer when the target date is reached
          setState(() {
            remainingTime =
                const Duration(seconds: 0); // Set remaining time to zero
          });
        }
      });
    } else {
      setState(() {
        remainingTime = targetDate.difference(currentTime);
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    String remainingDaysText = remainingTime.inDays.toString().padLeft(2, '0');
    String remainingHourstext =
        remainingTime.inHours.remainder(24).toString().padLeft(2, '0');
    String remainingMinutestext =
        remainingTime.inMinutes.remainder(60).toString().padLeft(2, '0');
    String remainingSecondstext =
        remainingTime.inSeconds.remainder(60).toString().padLeft(2, '0');

    if (remainingTime <= Duration.zero) {
      return Container(
        padding: EdgeInsets.all(size.width * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Here we Go, Let's Enjoy the Fest",
              style: GoogleFonts.medievalSharp(
                color: const Color(0xFFff8c00),
                fontSize: size.width * 0.065,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.width * 0.02,
            ),
            const PreregisterImage()
          ],
        ),
      );
    }
    return Container(
      padding: EdgeInsets.all(size.width * 0.01),
      // alignment: Alignment.center,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "DAYS LEFT",
            style: GoogleFonts.medievalSharp(
              color: const Color(0xFFff8c00),
              fontSize: size.width * 0.06,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            remainingDaysText,
            style: GoogleFonts.medievalSharp(
              color: const Color(0xFFff8c00),
              fontSize: size.width * 0.10,
              fontWeight: FontWeight.w900,
            ),
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                remainingHourstext,
                style: GoogleFonts.medievalSharp(
                  color: const Color(0xFFff8c00),
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Text(
                ":",
                style: GoogleFonts.medievalSharp(
                  color: const Color(0xFFff8c00),
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Text(
                remainingMinutestext,
                style: GoogleFonts.medievalSharp(
                  color: const Color(0xFFff8c00),
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Text(
                ":",
                style: GoogleFonts.medievalSharp(
                  color: const Color(0xFFff8c00),
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Text(
                remainingSecondstext,
                style: GoogleFonts.medievalSharp(
                  color: const Color(0xFFff8c00),
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.width * 0.02,
          ),
          const PreregisterImage()
        ],
      ),
    );
  }
}
