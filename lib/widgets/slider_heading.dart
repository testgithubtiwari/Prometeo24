import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderHeading extends StatelessWidget {
  final String heading;
  // ignore: prefer_const_constructors_in_immutables
  SliderHeading({required this.heading, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (heading == "Flagship Events") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              heading,
              style: GoogleFonts.orbitron(
                fontWeight: FontWeight.w700,
                color: Colors.amberAccent,
                fontSize: size.width * 0.052,
              ),
            ),
          ),
          Icon(
            Icons.flag_circle,
            color: Colors.white,
            size: size.width * 0.04,
          ),
        ],
      );
    } else {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Flexible(
          child: Center(
            child: Text(
              heading.toUpperCase(),
              style: GoogleFonts.orbitron(
                fontWeight: FontWeight.w700,
                color: Colors.amberAccent,
                fontSize: size.width * 0.052,
              ),
            ),
          ),
        )
      ]);
    }
  }
}
