import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/constants.dart';
import 'package:prometeo/timeline/timeline_slider_card.dart';

// ignore: must_be_immutable
class TabsTimeLine extends StatefulWidget {
  List timeLinecards;
  TabsTimeLine({required this.timeLinecards, super.key});

  @override
  State<TabsTimeLine> createState() => _TabsTimeLineState();
}

class _TabsTimeLineState extends State<TabsTimeLine> {
  int activeIndex = 0;
  List headings = [
    '19th Jan',
    '20th Jan',
    '21th Jan',
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width / 9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                headings.length,
                (index) => Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.0012,
                    vertical: size.width * 0.0022,
                  ),
                  margin: EdgeInsets.all(size.width * 0.015),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(size.width * 002),
                    ),
                    border: Border.all(color: Colors.blue, width: 1),
                    color: index == activeIndex
                        ? const Color.fromARGB(255, 23, 77, 75)
                        : sliderCardColor,
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                    child: Text(
                      headings[index],
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: size.width * 0.030,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: size.width * 0.04),
          TimeLineSliderCard(
            timeline: widget.timeLinecards[activeIndex],
          ),
        ],
      ),
    );
  }
}
