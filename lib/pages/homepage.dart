// ignore_for_file: avoid_print

import 'package:animate_do/animate_do.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prometeo/api/fetch_events.dart';
import 'package:prometeo/constants.dart';
import 'package:prometeo/models/event_model.dart';
import 'package:prometeo/notification_service/local_notification.dart';
// import 'package:prometeo/notification_service/notification_handler.dart';
// import 'package:prometeo/notification_service/local_notification.dart';
import 'package:prometeo/pages/campus_ambassador.dart';
// import 'package:prometeo/pages/sponsors.dart';
// import 'package:prometeo/timeline/timeLine_main.dart';
import 'package:prometeo/widgets/about.dart';
// import 'package:prometeo/widgets/awesome_drawer.dart';
// import 'package:prometeo/widgets/bottom_nav_bar.dart';
import 'package:prometeo/widgets/count_down_timer.dart';
import 'package:prometeo/widgets/custom_appbar.dart';

// import 'package:prometeo/widgets/faq.dart';
import 'package:prometeo/widgets/footer.dart';
import 'package:prometeo/widgets/glimpse_promete23.dart';
// import 'package:prometeo/widgets/greetings.dart';
import 'package:prometeo/widgets/nav_drawer.dart';
// import 'package:prometeo/widgets/pre_events.dart';
// import 'package:prometeo/widgets/preregistration.dart';
// import 'package:prometeo/widgets/prometeo_dates.dart';
// import 'package:prometeo/widgets/short_prerna_desc.dart';
// import 'package:prometeo/widgets/socials.dart';
// import 'package:prometeo/widgets/splash_screen.dart';
import 'package:prometeo/widgets/tabs.dart';
import 'package:prometeo/widgets/theme_image.dart';
// import 'package:prometeo/widgets/theme_text.dart';
import 'package:prometeo/widgets/theme_video.dart';
import 'package:prometeo/widgets/umang_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();
  bool isLoading = true;
  // int activeIndex = 0;
  // List<Event> flagshipCards = [];
  List<Event> preEvents = [];
  List<Event> pastSpeakerCards = [];
  // List<Event> speakerCards = [];
  List<Event> workshopCards = [];
  List<Event> technicalCards = [];
  List<Event> entrepreneurshipCards = [];
  List<Event> informals = [];
  // List<Event> exhibitionCards = [];
  List<List<Event>> sliderCards = [];

  // List<Team> talk = [];

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      if (isLoading) {
        // If isLoading is still true after the timeout, data is not available.
        setState(() {
          isLoading = false;
        });
      }
    });

    fetchEventData().then((events) {
      setState(() {
        // flagshipCards =
        //     events.where((event) => event.type == 'Flagship Events').toList();
        pastSpeakerCards =
            events.where((event) => event.type == 'talk').toList();
        // speakerCards =
        //     events.where((event) => event.type == 'Speaker').toList();
        // workshopCards =
        //     events.where((event) => event.type == 'Workshop').toList();
        technicalCards =
            events.where((event) => event.type == 'technical').toList();
        entrepreneurshipCards =
            events.where((event) => event.type == 'entrepreneurial').toList();
        // exhibitionCards =
        //     events.where((event) => event.type == 'Exhibition').toList();
        preEvents =
            events.where((event) => event.type == 'pre_events').toList();
        workshopCards =
            events.where((event) => event.type == 'workshop').toList();
        informals = events.where((event) => event.type == 'informal').toList();

        // sliderCards.add(flagshipCards);
        sliderCards.add(preEvents);
        sliderCards.add(pastSpeakerCards);
        sliderCards.add(technicalCards);
        sliderCards.add(entrepreneurshipCards);
        sliderCards.add(workshopCards);
        sliderCards.add(informals);

        // sliderCards.add(exhibitionCards);
        // sliderCards.add(workshopCards);
        // sliderCards.add(speakerCards);
      });
    });
    super.initState();

    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createAndDisplayNotification(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const NavDrawer(),
      extendBody: true,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(
                  size.width * 0.04,
                  size.width * 0.11,
                  size.width * 0.04,
                  0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomAppBar(
                      isHomePage: true,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.70),
                    const ThemeImage(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02649,
                    ),
                    const CountDownTimer(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.14,
                    ),
                    SlideInDown(
                        child: isLoading
                            ? const SpinKitSpinningLines(
                                color: Colors.white,
                              )
                            : sliderCards.isEmpty
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
                                : Tabs(slidercards: sliderCards)),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.10),
                    SlideInDown(
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "THEME REVEAL",
                          style: GoogleFonts.orbitron(
                            color: Colors.amberAccent,
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.020),
                    SlideInDown(
                        child: const ThemeVideo(
                      videoUrl: themeVideoLink,
                    )),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.030),
                    SlideInDown(
                      child: const About(),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.030),
                    const GlimpsePromete23(),
                    // SizedBox(
                    //     height: MediaQuery.of(context).size.height * 0.035),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       "Social Initiative: ",
                    //       style: GoogleFonts.orbitron(
                    //         color: Colors.white,
                    //         fontSize: size.width * 0.03,
                    //         fontWeight: FontWeight.w700,
                    //       ),
                    //     ),
                    //     Text(
                    //       "PRERNA",
                    //       style: GoogleFonts.orbitron(
                    //         color: Colors.amberAccent,
                    //         fontSize: size.width * 0.05,
                    //         fontWeight: FontWeight.w800,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //     height: MediaQuery.of(context).size.height * 0.016),
                    // UmangImage(
                    //   size: size,
                    // ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.040),
                    SlideInLeft(
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Campus Ambassador Program",
                          style: GoogleFonts.orbitron(
                            color: Colors.amberAccent,
                            fontSize: size.width * 0.045,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.056),
                    CAImage(size: size),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.025),
                    // SizedBox(
                    //   height: size.width * 0.03,
                    // ),
                    // const Footer(),
                  ],
                ),
              ),
              SizedBox(
                height: size.width * 0.03,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    size.width * 0.01, 0, size.width * 0.01, size.width * 0.06),
                child: const Footer(),
              ),
            ],
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
          // color: const Color.fromARGB(93, 0, 0, 0),
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
      // bottomNavigationBar: NavBar(currentIndex: 0),
    );
  }
}

class UmangImage extends StatefulWidget {
  final Size size;
  const UmangImage({required this.size, super.key});

  @override
  State<UmangImage> createState() => _UmangImageState();
}

class _UmangImageState extends State<UmangImage> {
  void _showSlideUmang() {
    final Size size = MediaQuery.of(context).size;
    double height = size.height * 0.60;
    Future.delayed(Duration.zero, () {
      showModalBottomSheet(
        isScrollControlled: true, // Set this to true
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(size.width * 0.12),
            topRight: Radius.circular(size.width * 0.12),
          ),
        ),

        isDismissible:
            true, // Optional: Set this to true if you want to allow dismissing by tapping outside
        enableDrag:
            true, // Optional: Set this to true if you want to allow dragging to dismiss
        elevation: 15, // Optional: Customize the elevation
        builder: (context) {
          return SizedBox(
            height: height,
            child: const UmangPage(),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        _showSlideUmang();
      },
      child: Container(
        height: size.width * 0.45,
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * 0.03),
            image: const DecorationImage(
                image: AssetImage(
                  'assets/images/prerna.png',
                ),
                fit: BoxFit.cover),
            border: Border.all(
              color: Colors.amberAccent,
              width: 1,
            )),
      ),
    );
  }
}

class CAImage extends StatefulWidget {
  final Size size;
  const CAImage({required this.size, super.key});
  @override
  State<CAImage> createState() => _CAImageState();
}

class _CAImageState extends State<CAImage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SvgPicture.asset(
            'assets/images/ca.svg',
            width: size.width,
            height: size.width * 0.60,
          ),
        ),
        Text(
          'In the campus ambassador program, you will be responsible for representing our festival, Prometeo, within the community of your college as part of the campus ambassador programme. You will also be responsible for encouraging students to join in the festival by highlighting the benefits of participating in the festival. Because you will be representing your entire institution, the role of Campus Ambassador is associated with a high level of prestige.',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: size.width * 0.03,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.justify,
        ),
        SizedBox(
          height: size.width * 0.05,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CampusAmbassador(),
              ),
            );
          },
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.amberAccent,
                width: 1,
              ),
            ),
            height: size.width * 0.15,
            width: size.width * 0.40,
            padding: EdgeInsets.all(size.width * 0.02),
            child: Center(
              child: Text(
                'View More',
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: size.width * 0.04,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
