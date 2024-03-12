import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

// ignore: must_be_immutable
class CardDetailEventDescription extends StatefulWidget {
  String eventDescription;
  String eventType;
  CardDetailEventDescription(
      {required this.eventType, required this.eventDescription, super.key});

  @override
  State<CardDetailEventDescription> createState() =>
      _CardDetailDescriptionState();
}

class _CardDetailDescriptionState extends State<CardDetailEventDescription> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.eventType == 'talk'
            ? Text(
                'Speaker Description',
                style: GoogleFonts.orbitron(
                    fontSize: size.width * 0.05,
                    color: Color.fromRGBO(237, 147, 64, 1),
                    fontWeight: FontWeight.w800),
              )
            : Text(
                'Event Description',
                style: GoogleFonts.orbitron(
                    fontSize: size.width * 0.05,
                    color: Color.fromRGBO(237, 147, 64, 1),
                    fontWeight: FontWeight.w800),
              ),
        SizedBox(
          height: size.width * 0.02,
        ),
        ReadMoreText(
          textAlign: TextAlign.justify,
          widget.eventDescription,
          trimLines: 4,
          colorClickableText: const Color(0xff64ffda),
          trimMode: TrimMode.Line,
          trimCollapsedText: ' Read more',
          trimExpandedText: ' Read less',
          moreStyle: GoogleFonts.poppins(
            fontSize: 12,
            color: const Color(0xff64ffda),
          ),
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white,
          ),
          lessStyle: GoogleFonts.poppins(
            fontSize: 12,
            color: const Color(0xff64ffda),
          ),
        ),
      ],
    );
  }
}
