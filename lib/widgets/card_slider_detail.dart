import 'package:flutter/material.dart';
import 'package:prometeo/constants.dart';
// import 'package:prometeo/widgets/bottom_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:prometeo/widgets/card_detail_description.dart';
import 'package:prometeo/widgets/card_event_location.dart';
// import 'package:prometeo/widgets/rule_book.dart';
import 'package:intl/intl.dart';
import 'package:prometeo/widgets/eventtime.dart';
// import 'package:prometeo/widgets/unstop_registration.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class SliderCardDetail extends StatefulWidget {
  String eventName;
  int eventId;
  String prize;
  String imageLink;
  String description;
  String eventType;
  String ruleBookLink;
  bool isSpeaker;
  String unstopLink;
  String eventLocation;
  String eventDate;
  String designation;
  String endEventDate;
  String startTime;
  String endTime;

  SliderCardDetail(
      {required this.designation,
      required this.startTime,
      required this.endTime,
      required this.endEventDate,
      required this.description,
      required this.eventId,
      required this.prize,
      required this.ruleBookLink,
      required this.isSpeaker,
      required this.unstopLink,
      this.eventLocation = 'LHC110',
      required this.eventDate,
      required this.eventType,
      required this.eventName,
      required this.imageLink,
      super.key});

  @override
  State<SliderCardDetail> createState() => _EventState();
}

class _EventState extends State<SliderCardDetail> {
  bool isRulebook = true;
  @override
  Widget build(BuildContext context) {
    // Uri uri = Uri.parse(widget.imageLink);
    // String path = uri.path;
    // String imageLinkPath = urlImagePathSponsorMain + path;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: size.width * 0.035,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(42, 29, 61, 1),
      body: Container(
        padding: EdgeInsets.only(
          left: size.width * 0.05,
          right: size.width * 0.05,
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.width * 0.06,
                ),
                Container(
                  width: size.width * 0.9,
                  height: size.width * 0.55,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: size.width * 0.0025, color: Colors.blue),
                    // borderRadius: BorderRadius.circular(size.width * 0.035),
                    image: DecorationImage(
                        image: NetworkImage(widget.imageLink),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  height: size.width * 0.04,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.eventName,
                    style: GoogleFonts.poppins(
                      color: shadowTextColor,
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.width * 0.01,
                ),
                widget.designation == ""
                    ? SizedBox.shrink()
                    : Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.designation,
                          style: GoogleFonts.abel(
                              color: Colors.white, fontSize: size.width * 0.03),
                        ),
                      ),
                SizedBox(
                  height: size.width * 0.035,
                ),
                PrizeAndDate(size: size, widget: widget),
                SizedBox(
                  height: size.width * 0.05,
                ),
                widget.eventType == "talk"
                    ? SizedBox.shrink()
                    : widget.eventType == "speaker"
                        ? SizedBox.shrink()
                        : widget.eventLocation == ""
                            ? SizedBox.shrink()
                            : CardEventLocation(
                                eventLocation: widget.eventLocation),
                SizedBox(
                  height: size.width * 0.025,
                ),
                widget.eventType == 'talk' ||
                        widget.startTime == '' ||
                        widget.endTime == ''
                    ? SizedBox.shrink()
                    : EvenTime(
                        startTime: widget.startTime,
                        endTime: widget.endTime,
                      ),
                SizedBox(
                  height: size.width * 0.025,
                ),
                CardDetailEventDescription(
                    eventType: widget.eventType,
                    eventDescription: widget.description),
                SizedBox(
                  height: size.width * 0.05,
                ),
                widget.unstopLink == ""
                    ? SizedBox.shrink()
                    : SizedBox(
                        width: size.width * 0.60,
                        child: ElevatedButton(
                          onPressed: () {
                            _launchURL(context, widget.unstopLink);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue, // Text color
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(8.0),
                            // ),
                          ),
                          child: Text(
                            'Register'.toUpperCase(),
                            style: GoogleFonts.poppins(
                                fontSize: size.width * 0.05),
                          ),
                        ),
                      ),
                // (!widget.isSpeaker && isRulebook)
                //     ? RuleBook(
                //         ruleBookLink: widget.ruleBookLink,
                //       )
                //     : Container(),
                // (!widget.isSpeaker && isRulebook)
                //     ? UnstopRegistration(
                //         unstopLink: widget.unstopLink,
                //       )
                //     : Container(),
                // const SizedBox(
                //   height: 20,
                // ),
                // (widget.isSpeaker)
                //     ? Container()
                //     : Container(
                //         alignment: Alignment.centerLeft,
                //         child: Text(
                //           "Sponsored By",
                //           style: GoogleFonts.poppins(
                //             fontSize: 20,
                //             color: Colors.white,
                //             fontWeight: FontWeight.w600,
                //           ),
                //         ),
                //       ),
                // const SizedBox(
                //   height: 30,
                // ),
                // ListView(
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   children: <Widget>[
                //     Wrap(
                //       alignment: WrapAlignment.center,
                //       spacing: 25.0,
                //       children: widget.sponsorLinks.map((sponsorLink) {
                //         return CardSponsorImage(sponsorLink: sponsorLink);
                //       }).toList(),
                //     )
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: NavBar(currentIndex: -1),
    );
  }
}

Future<void> _launchURL(BuildContext context, String url) async {
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Could not launch $url'),
      ),
    );
  }
}

class PrizeAndDate extends StatelessWidget {
  const PrizeAndDate({
    Key? key,
    required this.size,
    required this.widget,
  }) : super(key: key);

  final Size size;
  final SliderCardDetail widget;

  @override
  Widget build(BuildContext context) {
    String eventendstr = widget.endEventDate;
    DateTime endDate = DateFormat('yyyy-MM-dd').parse(eventendstr);
    String formattedEndDate = DateFormat('dd-MM-yyyy').format(endDate);
    String eventDateStr = widget.eventDate;
    DateTime eventDate = DateFormat('yyyy-MM-dd').parse(eventDateStr);
    String formattedDate = DateFormat('dd-MM-yyyy').format(eventDate);
    final DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    DateTime parsedStartDate = dateFormat.parse(formattedDate);
    DateTime parsedEndDate = dateFormat.parse(formattedEndDate);
    int startdate = parsedStartDate.day;
    int endmonth = parsedEndDate.month;
    int enddate = parsedEndDate.day;
    // int startIndex = widget.prize.indexOf('Prize') + 'Prize'.length;
    // String prizeValue = widget.prize.substring(startIndex).trim();
    if (widget.eventType != "talk") {
      if (widget.eventType != "speaker") {
        String prizeValue = "";
        if (widget.prize == "") {
          prizeValue = "No Prize";
        } else {
          int startIndex = widget.prize.indexOf('Prize') + 'Prize'.length;
          prizeValue = widget.prize.substring(startIndex).trim();
        }
        // Display prize and date in a row
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: size.width * 0.10,
              width: size.width * 0.4,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.blue),
                color: const Color(0xff496B8B),
                // borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  left: size.width * 0.03,
                  right: size.width * 0.03,
                ),
                child: Center(
                  child: AutoSizeText(
                    "PRIZE: $prizeValue",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
            Container(
              height: size.width * 0.10,
              width: size.width * 0.42,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.blue),
                color: const Color(0xff496B8B),
                // borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  left: size.width * 0.01,
                  right: size.width * 0.01,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        color: Colors.white,
                        size: size.width * 0.04,
                      ),
                      SizedBox(
                        width: size.width * 0.012,
                      ),
                      startdate.toString() == enddate.toString()
                          ? endmonth.toString() == "12"
                              ? AutoSizeText(
                                  '$startdate DEC 2023',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              : AutoSizeText(
                                  '$startdate JAN 2024',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                          : endmonth.toString() == "12"
                              ? AutoSizeText(
                                  '$startdate-$enddate DEC 2023',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              : AutoSizeText(
                                  '$startdate-$enddate JAN 2024',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      } else {
        return Row(
          // Display only the event date and location
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardEventLocation(eventLocation: widget.eventLocation),
            Container(
              height: size.width * 0.10,
              width: size.width * 0.4,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.blue),
                color: const Color(0xff496B8B),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  left: size.width * 0.03,
                  right: size.width * 0.03,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        color: Colors.white,
                        size: size.width * 0.04,
                      ),
                      SizedBox(
                        width: size.width * 0.012,
                      ),
                      AutoSizeText(
                        formattedDate,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }
    } else {
      // show nothing
      return Container();
    }
  }
}
