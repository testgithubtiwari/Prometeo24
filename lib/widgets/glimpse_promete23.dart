import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:prometeo/constants.dart';

class GlimpsePromete23 extends StatefulWidget {
  const GlimpsePromete23({super.key});

  @override
  State<GlimpsePromete23> createState() => _GlimpsePromete23State();
}

class _GlimpsePromete23State extends State<GlimpsePromete23> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        height: size.width * 0.90,
        width: size.width,
        // padding: EdgeInsets.all(size.width * 0.15),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
      ),
      Positioned(
        height: size.width * 0.93,
        width: size.width * 0.86,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/participants.png'),
                    Text(
                      '5000+',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Participants',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  width: size.width * 0.25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/colleges.png'),
                    Text(
                      '450+',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Colleges',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Center(
              child: Text(
                'A GLIMPSE OF',
                style: GoogleFonts.orbitron(
                    fontSize: size.width * 0.04,
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: size.width * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/prize.png'),
                    Text(
                      '8 Lakh+',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Prizepool',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Container(
                  height: size.width * 0.27,
                  width: size.width * 0.27,
                  padding: EdgeInsets.all(size.width * 0.01),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.yellowAccent)),
                  child: Image.asset('assets/images/glimpse.png'),
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/sponsors.png'),
                    Text(
                      '40+',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Sponsors',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: size.width * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/speakers.png'),
                    Text(
                      '30+',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Speakers',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  width: size.width * 0.25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/events.png'),
                    Text(
                      '20+',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Events',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}
