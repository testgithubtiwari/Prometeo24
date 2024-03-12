import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/api/fetch_events.dart';
import 'package:prometeo/constants.dart';
import 'package:prometeo/models/event_model.dart';
// import 'package:prometeo/widgets/bottom_nav_bar.dart';
import 'package:prometeo/widgets/card_slider_detail.dart';
import 'package:prometeo/widgets/custom_appbar.dart';
import 'package:prometeo/widgets/nav_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _PreEventsState();
}

class _PreEventsState extends State<Events> with TickerProviderStateMixin {
  List<Event> preEvents = [];
  List<Event> technicalEvents = [];
  List<Event> entrepreneurialEvents = [];
  List<Event> allEvents = [];
  List<Event> workshop = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    bool isLoading = true;
    Future.delayed(const Duration(seconds: 3)).then((_) {
      if (isLoading) {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(
          msg: "Data is not available now",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    });
    fetchEventData().then((events) {
      setState(() {
        preEvents =
            events.where((event) => event.type == 'pre_events').toList();
        // print(preEvents.length);
        technicalEvents =
            events.where((event) => event.type == 'technical').toList();
        entrepreneurialEvents =
            events.where((event) => event.type == 'entrepreneurial').toList();

        workshop = events.where((event) => event.type == 'workshop').toList();
        allEvents = events.where((event) => event.type != 'talk').toList();

        isLoading = false;
      });
    });
    super.initState();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      drawer: const NavDrawer(),
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/events.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            padding: EdgeInsets.fromLTRB(
              size.width * 0.05,
              size.width * 0.10,
              size.width * 0.05,
              0,
            ),
            child: Column(
              children: [
                const CustomAppBar(
                  isHomePage: true,
                ),
                Container(
                  height: size.width * 0.25,
                  padding: EdgeInsets.all(size.width * 0.02),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          },
                          child: SizedBox(
                            height: size.width * 0.20,
                            width: size.width * 0.35,
                            child: Column(children: [
                              const Image(
                                image: AssetImage('assets/images/pre.png'),
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: size.width * 0.015,
                              ),
                              Container(
                                width: size.width * 0.20,
                                height: 3.0,
                                color: selectedIndex == 0
                                    ? Colors.red
                                    : Colors.transparent,
                              ),
                            ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          child: SizedBox(
                            height: size.width * 0.20,
                            width: size.width * 0.35,
                            child: Column(children: [
                              const Image(
                                image: AssetImage('assets/images/entre.png'),
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: size.width * 0.01,
                              ),
                              Container(
                                width: size.width * 0.20,
                                height: 3.0,
                                color: selectedIndex == 1
                                    ? Colors.red
                                    : Colors.transparent,
                              ),
                            ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          },
                          child: SizedBox(
                            height: size.width * 0.20,
                            width: size.width * 0.35,
                            child: Column(children: [
                              const Image(
                                image: AssetImage('assets/images/tech.png'),
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: size.width * 0.01,
                              ),
                              Container(
                                width: size.width * 0.20,
                                height: 3.0,
                                color: selectedIndex == 2
                                    ? Colors.red
                                    : Colors.transparent,
                              ),
                            ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 3;
                            });
                          },
                          child: SizedBox(
                            height: size.width * 0.20,
                            width: size.width * 0.35,
                            child: Column(children: [
                              const Image(
                                image: NetworkImage(
                                    'https://i.imgur.com/XSr6ONg.png'),
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: size.width * 0.01,
                              ),
                              Container(
                                width: size.width * 0.20,
                                height: 3.0,
                                color: selectedIndex == 3
                                    ? Colors.red
                                    : Colors.transparent,
                              ),
                            ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 4;
                            });
                          },
                          child: SizedBox(
                            height: size.width * 0.20,
                            width: size.width * 0.35,
                            child: Column(children: [
                              const Image(
                                image: AssetImage('assets/images/all.png'),
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: size.width * 0.01,
                              ),
                              Container(
                                width: size.width * 0.20,
                                height: 3.0,
                                color: selectedIndex == 4
                                    ? Colors.red
                                    : Colors.transparent,
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                selectedIndex == 0
                    ? Text(
                        'Pre-Events'.toUpperCase(),
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.width * 0.06,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : selectedIndex == 1
                        ? Text(
                            'Entrepreneurial Events'.toUpperCase(),
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.06,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : selectedIndex == 2
                            ? Text(
                                'Technical Events'.toUpperCase(),
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: size.width * 0.06,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : selectedIndex == 3
                                ? Text(
                                    'Workshops'.toUpperCase(),
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: size.width * 0.06,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                : Text(
                                    'Events'.toUpperCase(),
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: size.width * 0.06,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                SizedBox(
                  height: size.width * 0.03,
                ),
                selectedIndex == 0
                    ? preEvents.length == 0
                        ? SpinKitSpinningLines(
                            color: Colors.amberAccent,
                            // backgroundColor: Colors.white,
                          )
                        : Column(
                            children: preEvents
                                .map((event) => EventsCard(eventData: event))
                                .toList(),
                          )
                    : selectedIndex == 1
                        ? entrepreneurialEvents.length == 0
                            ? SpinKitSpinningLines(
                                color: Colors.amberAccent,
                                // backgroundColor: Colors.white,
                              )
                            : Column(
                                children: entrepreneurialEvents
                                    .map(
                                        (event) => EventsCard(eventData: event))
                                    .toList(),
                              )
                        : selectedIndex == 2
                            ? technicalEvents.length == 0
                                ? SpinKitSpinningLines(
                                    color: Colors.amberAccent,
                                    // backgroundColor: Colors.white,
                                  )
                                : Column(
                                    children: technicalEvents
                                        .map((event) =>
                                            EventsCard(eventData: event))
                                        .toList(),
                                  )
                            : selectedIndex == 3
                                ? workshop.length == 0
                                    ? SpinKitSpinningLines(
                                        color: Colors.amberAccent,
                                        // backgroundColor: Colors.white,
                                      )
                                    : Column(
                                        children: workshop
                                            .map((event) =>
                                                EventsCard(eventData: event))
                                            .toList(),
                                      )
                                : allEvents.length == 0
                                    ? SpinKitSpinningLines(
                                        color: Colors.amberAccent,
                                        // backgroundColor: Colors.white,
                                      )
                                    : Column(
                                        children: allEvents
                                            .map((event) =>
                                                EventsCard(eventData: event))
                                            .toList(),
                                      ),
                // selectedIndex == 0
                //     ? ListView.builder(
                //         shrinkWrap: true,
                //         physics: const NeverScrollableScrollPhysics(),
                //         itemCount: preEvents.length,
                //         itemBuilder: (context, index) {
                //           return EventsCard(eventData: preEvents[index]);
                //         },
                //       )
                //     : selectedIndex == 1
                //         ? ListView.builder(
                //             shrinkWrap: true,
                //             physics: const NeverScrollableScrollPhysics(),
                //             itemCount: entrepreneurialEvents.length,
                //             itemBuilder: (context, index) {
                //               return EventsCard(
                //                   eventData: entrepreneurialEvents[index]);
                //             },
                //           )
                //         : selectedIndex == 2
                //             ? ListView.builder(
                //                 shrinkWrap: true,
                //                 physics: const NeverScrollableScrollPhysics(),
                //                 itemCount: technicalEvents.length,
                //                 itemBuilder: (context, index) {
                //                   return EventsCard(
                //                       eventData: technicalEvents[index]);
                //                 },
                //               )
                //             : selectedIndex == 3
                //                 ? ListView.builder(
                //                     shrinkWrap: true,
                //                     physics:
                //                         const NeverScrollableScrollPhysics(),
                //                     itemCount: workshop.length,
                //                     itemBuilder: (context, index) {
                //                       return EventsCard(
                //                           eventData: workshop[index]);
                //                     },
                //                   )
                //                 : ListView.builder(
                //                     shrinkWrap: true,
                //                     physics:
                //                         const NeverScrollableScrollPhysics(),
                //                     itemCount: allEvents.length,
                //                     itemBuilder: (context, index) {
                //                       return EventsCard(
                //                           eventData: allEvents[index]);
                //                     },
                //                   ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, size.width * 0.17),
                  padding: EdgeInsets.all(size.width * 0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _launchURL(context,
                              'https://unstop.com/college-fests/prometeo23-indian-institute-of-technology-iit-jodhpur-80491');
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromARGB(255, 223, 23, 9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text('VIEW ALL PAST EVENTS'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(
            0, size.width * 0.95, size.width * 0.025, size.width * 0.15),
        padding: EdgeInsets.all(size.width * 0.01),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(size.width * 0.015),
          color: const Color.fromARGB(93, 0, 0, 0),
        ),
        child: FloatingActionButton(
          onPressed: () {
            _scrollController.animateTo(
              0.0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          backgroundColor: Colors.transparent,
          child: Icon(
            Icons.arrow_upward,
            color: Colors.white,
            size: size.width * 0.07,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // bottomNavigationBar: NavBar(currentIndex: 1),
    );
  }
}

class EventsCard extends StatelessWidget {
  final Event eventData;
  const EventsCard({required this.eventData, super.key});

  @override
  Widget build(BuildContext context) {
    // Uri uri = Uri.parse(eventData.image);
    // String path = uri.path;
    // String imageLinkPath = urlImagePathSponsorMain + path;
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.90,
      decoration: BoxDecoration(
        color: const Color.fromARGB(162, 3, 3, 4),
        border: Border.all(
          width: 1,
          color: const Color.fromARGB(
            235,
            255,
            255,
            0,
          ),
        ),
      ),
      margin: EdgeInsets.fromLTRB(0, 0, 0, size.width * 0.06),
      padding: EdgeInsets.all(size.width * 0.03),
      child: Column(
        children: [
          Container(
            height: size.height * 0.40,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(eventData.image), fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            height: size.width * 0.03,
          ),
          Text(
            eventData.name,
            style: GoogleFonts.poppins(
                color: shadowTextColor,
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          SizedBox(
            width: size.width * 0.50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                  rootNavigator: false,
                ).push(
                  MaterialPageRoute(
                    builder: (context) => SliderCardDetail(
                      startTime: eventData.startTime,
                      endTime: eventData.endTime,
                      endEventDate: eventData.endDate,
                      designation: eventData.designation,
                      description: eventData.description,
                      eventId: eventData.id,
                      prize: eventData.prize,
                      ruleBookLink: eventData.rulebook,
                      isSpeaker: true,
                      unstopLink: eventData.unstopLink,
                      eventLocation: eventData.venue,
                      eventDate: eventData.date,
                      eventType: eventData.type,
                      eventName: eventData.name,
                      imageLink: eventData.image,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 185, 35, 8),
              ),
              child: Text(
                'Details',
                style: GoogleFonts.poppins(fontSize: size.width * 0.04),
              ),
            ),
          ),
          SizedBox(
            height: size.width * 0.03,
          ),
        ],
      ),
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
