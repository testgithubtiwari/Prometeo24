import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:prometeo/constants.dart';

// ignore: must_be_immutable
class TimeLine extends StatefulWidget {
  int id;
  String eventName;
  String startTime;
  String endTime;
  String venue;
  String date;
  TimeLine(
      {required this.date,
      required this.endTime,
      required this.eventName,
      required this.id,
      required this.startTime,
      required this.venue,
      super.key});

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SlideInLeft(
      child: Container(
        width: size.width * 0.70,
        height: size.width * 0.15,
        decoration: BoxDecoration(
          color: sliderCardColor,
          borderRadius: BorderRadius.circular(size.width * 0.04),
          border: Border.all(width: 1, color: Colors.blue),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(size.width * 0.025),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.eventName,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: size.width * 0.025)),
                    Row(
                      children: [
                        Text(
                          DateFormat("ha").format(
                              DateFormat("HH:mm:ss").parse(widget.startTime)),
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.025),
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Text(
                          '-',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.025),
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Text(
                          DateFormat("ha").format(
                              DateFormat("HH:mm:ss").parse(widget.endTime)),
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.025),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Venue : ',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.025),
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Text(
                          widget.venue,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.025),
                        ),
                      ],
                    ),
                    Text(
                      '${DateTime.parse(widget.date).day.toString()} JAN 2024',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: size.width * 0.025),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
