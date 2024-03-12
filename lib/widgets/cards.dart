// import 'package:auto_size_text/auto_size_text.dart';
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/constants.dart';
import 'package:prometeo/widgets/card_slider_detail.dart';

// ignore: must_be_immutable
class Cards extends StatefulWidget {
  int eventId;
  String title;
  String startTime;
  String endTime;
  String prize;
  String imageLink;
  String description;
  String eventType;
  String ruleBookLink;
  bool isSpeaker;
  String unstopLink;
  String eventLocation;
  String eventDate;
  String eventEndDate;
  String designation;

  Cards(
      {required this.description,
      required this.startTime,
      required this.endTime,
      required this.eventId,
      required this.eventEndDate,
      required this.designation,
      required this.imageLink,
      required this.prize,
      required this.title,
      required this.ruleBookLink,
      required this.isSpeaker,
      required this.unstopLink,
      required this.eventLocation,
      required this.eventDate,
      required this.eventType,
      super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    // print(widget.designation);
    // Uri uri = Uri.parse(widget.imageLink);
    // String path = uri.path;
    // String imageLinkPath = urlImagePathSponsorMain + path;
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        // boxShadow: const [
        //   BoxShadow(
        //     color: Colors.grey, // Color of the shadow
        //     offset: Offset(0, 3), // Offset of the shadow
        //     blurRadius: 6, // Spread of the shadow
        //     spreadRadius: 2, // How far the shadow extends
        //   )
        // ],
        color: const Color.fromARGB(255, 41, 30, 56),
        // borderRadius: BorderRadius.circular(size.width * 0.025),
        border: Border.all(width: 1, color: Colors.amberAccent),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.width * 0.45,
              padding: EdgeInsets.only(
                top: size.width * 0.012,
                left: size.width * 0.007,
                right: size.width * 0.007,
              ),
              child: Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(size.width * 0.02),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.imageLink),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.width * 0.01,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: size.width * 0.03,
                  bottom: size.width * 0.03,
                  right: size.width * 0.03),
              height: size.width * 0.13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.035,
                            overflow: TextOverflow.ellipsis,
                          ),
                          softWrap: true,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle the tap event
                      Navigator.of(context, rootNavigator: false).push(
                        MaterialPageRoute(
                          builder: (context) => SliderCardDetail(
                            startTime: widget.startTime,
                            endTime: widget.endTime,
                            endEventDate: widget.eventEndDate,
                            designation: widget.designation,
                            description: widget.description,
                            eventId: widget.eventId,
                            prize: widget.prize,
                            ruleBookLink: widget.ruleBookLink,
                            isSpeaker: widget.isSpeaker,
                            unstopLink: widget.unstopLink,
                            eventLocation: widget.eventLocation,
                            eventDate: widget.eventDate,
                            eventType: widget.eventType,
                            eventName: widget.title,
                            imageLink: widget.imageLink,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 54, 86, 244),
                            Color.fromARGB(255, 163, 53, 43)
                          ], // Add your desired colors
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(
                            4.0), // Adjust the border radius as needed
                      ),
                      padding: EdgeInsets.all(size.width * 0.02),
                      child: Text(
                        'Details',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.width * 0.035,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
