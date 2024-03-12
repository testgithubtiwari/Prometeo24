// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AccomodationEventCard extends StatefulWidget {
  const AccomodationEventCard({super.key});

  @override
  State<AccomodationEventCard> createState() => _AccomodationEventCardState();
}

class _AccomodationEventCardState extends State<AccomodationEventCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(
        size.width * 0.035,
        size.width * 0.05,
        size.width * 0.03,
        size.width * 0.03,
      ),
      height: size.height * 0.70,
      width: size.width * 0.90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 0.06),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(133, 188, 147, 0.768),
            Color.fromRGBO(5, 130, 38, 1),
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Accommodation'.toUpperCase(),
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: size.width * 0.065,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: size.width * 0.02,
            ),
            Container(
              padding: EdgeInsets.all(size.width * 0.02),
              decoration: BoxDecoration(color: Colors.white),
              child: Text(
                'limited time offer'.toUpperCase(),
                style: GoogleFonts.poppins(
                  color: Color.fromARGB(193, 0, 0, 0),
                  fontSize: size.width * 0.045,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: size.width * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\u{20B9}',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  '1500',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // Text(
                //   '(+taxes)',
                //   style: GoogleFonts.poppins(
                //     color: Colors.white,
                //     fontSize: size.width * 0.025,
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: size.width * 0.03,
            ),
            // Container(
            //   padding: EdgeInsets.all(size.width * 0.025),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(size.width * 0.08),
            //     color: Colors.white,
            //   ),
            //   child: Text(
            //     'Coming Soon'.toUpperCase(),
            //     style: GoogleFonts.poppins(
            //       color: Colors.green,
            //       fontSize: size.width * 0.04,
            //       fontWeight: FontWeight.w400,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: size.width * 0.025,
            ),
            Divider(
              color: Colors.white,
              height: size.width * 0.025,
            ),
            SizedBox(
              height: size.width * 0.04,
            ),
            Row(
              children: [
                Icon(
                  Icons.check,
                  color: Colors.white,
                  size: size.width * 0.05,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  'Accommodation in Hostels',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.check,
                  color: Colors.white,
                  size: size.width * 0.05,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  'Meals for three days',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(size.width * 0.06, 0, 0, 0),
              child: Text(
                '(Breakfast & Lunch)',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.check,
                  color: Colors.white,
                  size: size.width * 0.05,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  'Paid Food Stalls for Dinner',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.check,
                  color: Colors.white,
                  size: size.width * 0.05,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  'Access to Speaker sessions',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.check,
                  color: Colors.white,
                  size: size.width * 0.05,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  'Access to Pronite',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.check,
                  color: Colors.white,
                  size: size.width * 0.05,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  'Access to Exhibition',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.width * 0.055,
            ),
            Container(
              padding: EdgeInsets.all(size.width * 0.025),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width * 0.08),
                color: Colors.white,
              ),
              child: TextButton(
                onPressed: () {
                  _launchURL(context,
                      'https://www.onlinesbi.sbi/sbicollect/icollecthome.htm?corpID=6078618');
                },
                child: Text(
                  'buy now'.toUpperCase(),
                  style: GoogleFonts.poppins(
                    color: Colors.green,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchURL(BuildContext context, String url) async {
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Could not launch $url'),
      ),
    );
  }
}
