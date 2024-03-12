import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:prometeo/constants.dart';
import 'package:prometeo/widgets/card_slider_detail.dart';

class EventCard extends StatefulWidget {
  final int eventId;
  final String eventType;
  final String endEventDate;
  final String imageLink;
  final String eventName;
  final String eventPrize;
  final String eventDate;
  final String eventDescription;
  final String ruleBookLink;
  final String unStopLink;
  final String eventLocation;
  final String designation;
  final String startTime;
  final String endTime;

  const EventCard({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.endEventDate,
    required this.eventType,
    required this.designation,
    required this.eventId,
    required this.imageLink,
    required this.eventName,
    required this.eventDate,
    required this.eventPrize,
    required this.eventDescription,
    required this.ruleBookLink,
    required this.unStopLink,
    required this.eventLocation,
  });

  @override
  // ignore: library_private_types_in_public_api
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    String eventDateStr = widget.eventDate;
    DateTime eventDate = DateFormat('yyyy-MM-dd').parse(eventDateStr);
    String formattedDate = DateFormat('dd-MM-yyyy').format(eventDate);
    Uri uri = Uri.parse(widget.imageLink);
    String path = uri.path;
    String imageLinkPath = urlImagePathSponsorMain + path;
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          left: size.width * 0.02,
          top: size.width * 0.045,
          right: size.width * 0.02,
          bottom: size.width * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(size.width * 0.020),
        ),
        border: Border.all(width: size.width * 0.002, color: Colors.blue),
        image: DecorationImage(
            image: NetworkImage(imageLinkPath), fit: BoxFit.fill, opacity: 0.8),
      ),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Color.fromARGB(0, 10, 4, 4)],
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: size.width * 0.05,
            child: Container(
              color: Colors.blue.withOpacity(0.45),
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: size.width * 0.01),
              child: Center(
                child: Text(
                  widget.eventName,
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontSize: size.width * 0.024),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(
                bottom: size.width * 0.03, right: size.width * 0.02),
            child: Column(
              children: [
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (widget.eventPrize != "NA")
                          Text(
                            widget.eventPrize,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                          ),
                        // SizedBox(height: size.width * 0.005),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_month_rounded,
                              color: Colors.white,
                              size: size.width * 0.038,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              formattedDate,
                              style: GoogleFonts.poppins(
                                fontSize: size.width * 0.035,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(
                              context,
                              rootNavigator: false,
                            ).push(MaterialPageRoute(
                                builder: (context) => SliderCardDetail(
                                      startTime: widget.startTime,
                                      endTime: widget.endTime,
                                      endEventDate: widget.endEventDate,
                                      designation: widget.designation,
                                      description: widget.eventDescription,
                                      eventId: widget.eventId,
                                      prize: widget.eventPrize,
                                      ruleBookLink: widget.ruleBookLink,
                                      isSpeaker: true,
                                      unstopLink: widget.unStopLink,
                                      eventLocation: widget.eventLocation,
                                      eventDate: widget.eventDate,
                                      eventType: widget.eventType,
                                      eventName: widget.eventName,
                                      imageLink: widget.imageLink,
                                    )));
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff003959),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.03),
                            ),
                          ),
                          child: Text(
                            'Read More',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.025),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
