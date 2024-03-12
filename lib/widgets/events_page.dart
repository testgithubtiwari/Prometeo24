import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/widgets/event_card.dart';
import 'package:prometeo/widgets/events_banner.dart';
import 'package:prometeo/widgets/nav_drawer.dart';

class EventsPage extends StatefulWidget {
  final List eventList;
  final String eventType;
  const EventsPage(
      {required this.eventList, required this.eventType, super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      drawer: const NavDrawer(),
      body: Container(
        // height: size.height,
        // width: size.width,
        color: const Color.fromRGBO(42, 29, 61, 1),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: const Color.fromRGBO(42, 29, 61, 1),
              expandedHeight: size.height * 0.30,
              flexibleSpace: FlexibleSpaceBar(
                background: EventBanner(
                  eventType: widget.eventType,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(
                  size.width * 0.05,
                ),
                child: Container(
                  margin: EdgeInsets.only(bottom: size.width * 0.03),
                  alignment: Alignment.center,
                  child: Text(
                    widget.eventType,
                    style: GoogleFonts.orbitron(
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.w800,
                      color: Color.fromRGBO(237, 147, 64, 1),
                    ),
                  ),
                ),
              ),
            ),
            if (widget.eventList.isEmpty)
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SlideInDown(
                        child: Center(
                          child: Text(
                            "Data is not available now!",
                            style: GoogleFonts.orbitron(
                              color: Colors.yellowAccent[400],
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.75),
                delegate: SliverChildBuilderDelegate(
                    childCount: widget.eventList.length,
                    (context, index) => EventCard(
                          startTime: widget.eventList[index].startTime,
                          endTime: widget.eventList[index].endTime,
                          endEventDate: widget.eventList[index].endDate,
                          eventType: widget.eventList[index].type,
                          designation: widget.eventList[index].designation,
                          eventId: widget.eventList[index].id,
                          imageLink: widget.eventList[index].image,
                          eventName: widget.eventList[index].name,
                          eventDate: widget.eventList[index].date,
                          eventPrize: widget.eventList[index].prize,
                          eventDescription: widget.eventList[index].description,
                          ruleBookLink: widget.eventList[index].rulebook,
                          unStopLink: widget.eventList[index].externalLink,
                          eventLocation: widget.eventList[index].venue,
                        )),
              )
          ],
        ),
      ),
    );
  }
}
