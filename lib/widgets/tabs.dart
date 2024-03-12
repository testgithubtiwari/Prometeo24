import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:prometeo/constants.dart';
import 'package:prometeo/widgets/card_slider.dart';
import 'package:prometeo/widgets/slider_heading.dart';

// ignore: must_be_immutable
// ignore: must_be_immutable
class Tabs extends StatefulWidget {
  List slidercards;
  Tabs({required this.slidercards, super.key});
  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int activeIndex = 0;
  List headings = [
    // 'Flagship Events',
    'PreEvents',
    'Past Speakers',
    'Technical Events',
    'Entrepreneurship Events',
    // 'Exhibition',
    'Workshops',
    'Informals'
    // 'Speakers'
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width / 8,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: headings.length,
              itemBuilder: ((context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.0012,
                      vertical: size.width * 0.0020),
                  margin: EdgeInsets.all(size.width * 0.015),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(9),
                    ),
                    border: Border.all(color: Colors.amberAccent, width: 1),
                    color: index == activeIndex
                        ? const Color.fromARGB(255, 24, 77, 75)
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
                          color: Colors.white, fontSize: size.width * 0.035),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: size.width * 0.06),
          SliderHeading(
              heading: headings[activeIndex]), //  headings[activeIndex]
          SizedBox(height: size.width * 0.06),
          CardSlider(
            cards: widget.slidercards[activeIndex], // slidercards[activeIndex]
            height: MediaQuery.of(context).size.width * 0.55,
          )
        ],
      ),
    );
  }
}
