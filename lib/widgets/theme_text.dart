import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeText extends StatefulWidget {
  const ThemeText({super.key});

  @override
  State<ThemeText> createState() => _ThemeTextState();
}

class _ThemeTextState extends State<ThemeText> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'AN ELIXIR',
          style: GoogleFonts.frijole(
              color: Colors.amberAccent, fontSize: size.width * 0.04),
        ),
        Text(
          'ODYSSEY',
          style: GoogleFonts.frijole(
              color: Colors.amberAccent, fontSize: size.width * 0.04),
        ),
      ],
    );
  }
}
