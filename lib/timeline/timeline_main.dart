// ignore: file_names
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/api/fetch_timelines.dart';
import 'package:prometeo/models/timeline_models.dart';
import 'package:prometeo/timeline/tabs_timeline.dart';

class TimeLineMain extends StatefulWidget {
  const TimeLineMain({super.key});

  @override
  State<TimeLineMain> createState() => _TimeLineMainState();
}

class _TimeLineMainState extends State<TimeLineMain> {
  bool isLoading = true;
  List<List<TimeLineModel>> timelineCards = [];
  List<TimeLineModel> firstDay = [];
  List<TimeLineModel> secondDay = [];
  List<TimeLineModel> thirdDay = [];

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((_) {
      if (isLoading) {
        // If isLoading is still true after the timeout, data is not available.
        setState(() {
          isLoading = false;
        });
      }
    });
    fetchTimeLines().then((timeline) {
      setState(() {
        firstDay = timeline
            .where((timelines) => DateTime.parse(timelines.date).day == 19)
            .toList();
        secondDay = timeline
            .where((timelines) => DateTime.parse(timelines.date).day == 20)
            .toList();
        thirdDay = timeline
            .where((timelines) => DateTime.parse(timelines.date).day == 21)
            .toList();
        timelineCards.add(firstDay);
        timelineCards.add(secondDay);
        timelineCards.add(thirdDay);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideInDown(
        child: isLoading
            ? const SpinKitSpinningLines(
                color: Colors.white,
              )
            : timelineCards.isEmpty
                ? SlideInDown(
                    child: Text(
                      "COMING SOON",
                      style: GoogleFonts.orbitron(
                        color: Colors.yellowAccent[400],
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  )
                : TabsTimeLine(timeLinecards: timelineCards));
  }
}
