import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EvenTime extends StatefulWidget {
  final String startTime;
  final String endTime;
  const EvenTime({required this.startTime, required this.endTime, super.key});

  @override
  State<EvenTime> createState() => _EvenTimeState();
}

class _EvenTimeState extends State<EvenTime> {
  String _formatTime(String time) {
    final parsedTime = DateTime.parse("2022-01-01 " + time);
    return DateFormat.jm().format(parsedTime);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        children: [
          Text(
            _formatTime(widget.startTime),
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            ' to '.toUpperCase(),
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            _formatTime(widget.endTime),
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
