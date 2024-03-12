import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/models/timeline_models.dart';
import 'package:prometeo/timeline/timeline.dart';

// ignore: must_be_immutable
class TimeLineSliderCard extends StatefulWidget {
  List<TimeLineModel> timeline;

  TimeLineSliderCard({required this.timeline, super.key});

  @override
  State<TimeLineSliderCard> createState() => _TimeLineSliderCardState();
}

class _TimeLineSliderCardState extends State<TimeLineSliderCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return widget.timeline.isEmpty
        ? SlideInDown(
            child: Center(
              child: Text(
                "COMING SOON",
                style: GoogleFonts.orbitron(
                  color: Colors.yellowAccent[400],
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          )
        : Container(
            // height: size.width * 0.60,
            padding: EdgeInsets.all(size.width * 0.03),
            // decoration:
            //     BoxDecoration(border: Border.all(width: 1, color: Colors.blue)),
            child: SingleChildScrollView(
              child: Wrap(
                direction: Axis.vertical,
                spacing: 12.0,
                runSpacing: 12.0,
                children: widget.timeline.map((timeline) {
                  return TimeLine(
                      date: timeline.date,
                      endTime: timeline.endTime,
                      eventName: timeline.eventName,
                      id: timeline.id,
                      startTime: timeline.startTime,
                      venue: timeline.venue);
                }).toList(),
              ),
            ),
          );
  }
}
