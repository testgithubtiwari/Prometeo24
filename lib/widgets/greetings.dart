import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Greetings extends StatelessWidget {
  const Greetings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Text(
        'Made with ❤️ by App Dev Team!', // Use the Unicode heart symbol here
        style: GoogleFonts.poppins(
            fontSize: size.width * 0.03,
            fontWeight: FontWeight.w600,
            color: Colors.amberAccent)
        // Set the font family here
        );
  }
}
