import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AccomodationCultural extends StatefulWidget {
  const AccomodationCultural({super.key});

  @override
  State<AccomodationCultural> createState() => _AccomodationCulturalState();
}

class _AccomodationCulturalState extends State<AccomodationCultural> {
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
      height: size.width,
      width: size.width * 0.90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 0.06),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(177, 77, 15, 0.897),
            Color.fromRGBO(252, 99, 4, 0.679),
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Cultural'.toUpperCase(),
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: size.width * 0.065,
              fontWeight: FontWeight.w700,
            ),
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
                '500',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: size.width * 0.055,
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
          // SizedBox(
          //   height: size.width * 0.03,
          // ),
          // Container(
          //   padding: EdgeInsets.all(size.width * 0.025),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(size.width * 0.08),
          //     color: Colors.white,
          //   ),
          //   child: Text(
          //     'Coming Soon'.toUpperCase(),
          //     style: GoogleFonts.poppins(
          //       color: const Color.fromARGB(255, 252, 99, 4),
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
                'Access to Speaker sessions',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          // Row(
          //   children: [
          //     Icon(
          //       Icons.check,
          //       color: Colors.white,
          //       size: size.width * 0.05,
          //     ),
          //     SizedBox(
          //       width: size.width * 0.02,
          //     ),
          //     Text(
          //       'Meals for three days',
          //       style: GoogleFonts.poppins(
          //         color: Colors.white,
          //         fontSize: size.width * 0.04,
          //         fontWeight: FontWeight.w600,
          //       ),
          //     )
          //   ],
          // ),
          // Container(
          //   alignment: Alignment.centerLeft,
          //   margin: EdgeInsets.fromLTRB(size.width * 0.06, 0, 0, 0),
          //   child: Text(
          //     '(Breakfast & Lunch)',
          //     style: GoogleFonts.poppins(
          //       color: Colors.white,
          //       fontSize: size.width * 0.04,
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          // ),
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
          // Row(
          //   children: [
          //     Icon(
          //       Icons.check,
          //       color: Colors.white,
          //       size: size.width * 0.05,
          //     ),
          //     SizedBox(
          //       width: size.width * 0.02,
          //     ),
          //     Text(
          //       'Access to Pronite',
          //       style: GoogleFonts.poppins(
          //         color: Colors.white,
          //         fontSize: size.width * 0.04,
          //         fontWeight: FontWeight.w600,
          //       ),
          //     )
          //   ],
          // ),
          // Row(
          //   children: [
          //     Icon(
          //       Icons.check,
          //       color: Colors.white,
          //       size: size.width * 0.05,
          //     ),
          //     SizedBox(
          //       width: size.width * 0.02,
          //     ),
          //     Text(
          //       'Access to Exhibition',
          //       style: GoogleFonts.poppins(
          //         color: Colors.white,
          //         fontSize: size.width * 0.04,
          //         fontWeight: FontWeight.w600,
          //       ),
          //     )
          //   ],
          // ),

          SizedBox(
            height: size.width * 0.09,
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
                  color: const Color.fromARGB(255, 252, 99, 4),
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: unused_element
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
