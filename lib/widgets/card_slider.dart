import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/models/event_model.dart';
import 'package:prometeo/widgets/cards.dart';

// ignore: must_be_immutable
class CardSlider extends StatefulWidget {
  List<Event> cards; // Change the type of cards
  double height;
  CardSlider({required this.cards, required this.height, super.key});

  @override
  State<CardSlider> createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return widget.cards.isEmpty
        ? SlideInDown(
            child: Center(
              child: Text(
                "COMING SOON",
                style: GoogleFonts.orbitron(
                  color: Colors.yellowAccent[400],
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          )
        : Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: size.width * 0.008,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    enlargeCenterPage: true,
                    height: widget.height,
                  ),
                  items: widget.cards.map((card) {
                    return Cards(
                      startTime: card.startTime,
                      endTime: card.endTime,
                      eventEndDate: card.endDate,
                      designation: card.designation,
                      description: card.description,
                      eventId: card.id,
                      imageLink: card.image,
                      prize: card.prize,
                      title: card.name,
                      ruleBookLink: card.rulebook,
                      isSpeaker: true,
                      unstopLink: card.unstopLink,
                      eventLocation: card.venue,
                      eventDate: card.date,
                      eventType: card.type,
                    );
                  }).toList(),
                ),
              ],
            ),
          );
  }
}
