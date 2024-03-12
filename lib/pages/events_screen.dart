import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prometeo/api/fetch_events.dart';
// import 'package:prometeo/constants.dart';
import 'package:prometeo/models/event_model.dart';
import 'package:prometeo/widgets/bottom_nav_bar.dart';
import 'package:prometeo/widgets/events_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventsScreen> {
  List<Event> exhibitions = [];
  List<Event> technicalEvents = [];
  List<Event> entrepreneurialEvents = [];
  List<Event> speakers = [];
  List<Event> informals = [];

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
        exhibitions =
            events.where((event) => event.type == 'Exhibition').toList();
        technicalEvents =
            events.where((event) => event.type == 'technical').toList();
        entrepreneurialEvents =
            events.where((event) => event.type == 'Entrepreneurship').toList();
        speakers = events.where((event) => event.type == 'talk').toList();
        informals = events.where((event) => event.type == 'Informals').toList();
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      // backgroundColor: const Color(0xff061417),
      body: Container(
        // margin: EdgeInsets.fromLTRB(0, 0, 0, size.width * 0.12),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage('https://i.imgur.com/cjfuYzX.jpg'),
              fit: BoxFit.fill),
        ),
        child: CarouselSlider(
            slideTransform: const CubeTransform(),
            unlimitedMode: true,
            slideIndicator: CircularSlideIndicator(
              padding: EdgeInsets.only(bottom: size.width * 0.05),
              currentIndicatorColor: Color.fromRGBO(237, 147, 64, 1),
              indicatorBackgroundColor: Colors.white,
            ),
            children: [
              EventsPage(eventList: exhibitions, eventType: 'Exhibition'),
              EventsPage(eventList: technicalEvents, eventType: 'Technical'),
              EventsPage(
                  eventList: entrepreneurialEvents,
                  eventType: 'Entrepreneurship'),
              EventsPage(eventList: speakers, eventType: 'Past Speakers'),
              EventsPage(eventList: informals, eventType: 'Informals'),
            ]),
      ),
      bottomNavigationBar: NavBar(currentIndex: 1),
    );
  }
}
