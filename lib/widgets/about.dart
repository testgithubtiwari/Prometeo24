import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/constants.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final String about = aboutPrometeo;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'ABOUT',
              style: GoogleFonts.orbitron(
                  color: Colors.amberAccent,
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(width: size.width * 0.02),
            SizedBox(
              width: size.width * 0.06,
              // height: size.width*0.10,
              child: Image.asset(
                'assets/images/prometeoLogo.png',
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
        SizedBox(
          height: size.width * 0.03,
        ),
        Container(
          padding: EdgeInsets.all(size.width * 0.03),
          decoration: BoxDecoration(
            color: const Color.fromARGB(23, 158, 158, 158),
            borderRadius: BorderRadius.circular(size.width * 0.02),
            border: Border.all(width: 1, color: Colors.amberAccent),
            // color: const Color.fromARGB(188, 33, 149, 243),
          ),
          child: Text(
            about,
            textAlign: TextAlign.justify,
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: size.width * 0.035,
                fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
