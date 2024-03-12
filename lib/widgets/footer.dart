// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:prometeo/login_signup_new/login.dart';
import 'package:prometeo/pages/sponsors.dart';
// import 'package:prometeo/widgets/preregistration.dart';
import 'package:prometeo/widgets/theme_page.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:prometeo/constants.dart';
// import 'package:prometeo/models/teams_model.dart';
import 'package:prometeo/pages/campus_ambassador.dart';
// import 'package:prometeo/pages/sponsors.dart';
import 'package:prometeo/widgets/greetings.dart';
import 'package:prometeo/widgets/events.dart';
// import 'package:prometeo/widgets/preregistration.dart';
import 'package:prometeo/widgets/socials.dart';
// import 'package:prometeo/widgets/teams.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, size.width * 0.16),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(220, 255, 214, 64),
          width: 1,
        ),
      ),
      padding: EdgeInsets.all(size.width * 0.03),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Quick Links",
                style: GoogleFonts.orbitron(
                  color: Colors.amberAccent,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "External Links",
                style: GoogleFonts.orbitron(
                  color: Colors.amberAccent,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.width * 0.02,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CampusAmbassador(),
                        ),
                      );
                    },
                    child: Text(
                      "Campus Ambassador",
                      style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Events(),
                        ),
                      );
                    },
                    child: Text(
                      "Events",
                      style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: size.width * 0.02,
                  // ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Sponsors(),
                        ),
                      );
                    },
                    child: Text(
                      "Sponsors",
                      style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: size.width * 0.02,
                  // ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    child: Text(
                      "Register",
                      style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: size.width * 0.02,
                  // ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ThemePage(),
                        ),
                      );
                    },
                    child: Text(
                      "Theme",
                      style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: size.width * 0.02,
                  // )
                ],
              ),
              // SizedBox(
              //   height: size.width * 0.06,
              // ),
              TextButton(
                onPressed: () {
                  launchUrl(Uri.parse("https://www.iitj.ac.in/"));
                },
                child: Text(
                  "IIT JODHPUR",
                  style: GoogleFonts.orbitron(
                    color: Colors.white,
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.01),
          const Divider(
            height: 1.5,
            color: Colors.white,
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            "CONTACT US",
            style: GoogleFonts.orbitron(
              color: Colors.amberAccent,
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Indian Institute of Technology",
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: size.width * 0.035,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Jodhpur N.H. 62, Nagaur Road,",
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: size.width * 0.035,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Karwar, Jodhpur 342030",
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: size.width * 0.035,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "(Rajasthan)",
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: size.width * 0.035,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: size.width * 0.03,
              ),
              Row(
                children: [
                  Text(
                    "Email: ",
                    style: GoogleFonts.orbitron(
                      color: Colors.white,
                      fontSize: size.width * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      launchEmail('pr_prometeo@iitj.ac.in');
                    },
                    child: Text(
                      "pr_prometeo@iitj.ac.in",
                      style: GoogleFonts.orbitron(
                        color: const Color.fromRGBO(74, 79, 176, 1),
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.width * 0.03,
              ),
              Row(
                children: [
                  Text(
                    "Mohit Kumawat: ",
                    style: GoogleFonts.orbitron(
                      color: Colors.white,
                      fontSize: size.width * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "+91 73782 42131",
                    style: GoogleFonts.orbitron(
                      color: Colors.white,
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Nidhi Patel: ",
                    style: GoogleFonts.orbitron(
                      color: Colors.white,
                      fontSize: size.width * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "+91 81549 10122",
                    style: GoogleFonts.orbitron(
                      color: Colors.white,
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Anupam Singh: ",
                    style: GoogleFonts.orbitron(
                      color: Colors.white,
                      fontSize: size.width * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "+91 76118 56898",
                    style: GoogleFonts.orbitron(
                      color: Colors.white,
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: size.width * 0.01,
          ),
          Divider(
            height: size.width * 0.02,
            color: Colors.white,
          ),
          SizedBox(
            height: size.width * 0.03,
          ),
          Text(
            "FOLLOW US ON",
            style: GoogleFonts.orbitron(
              color: Colors.amberAccent,
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.w600,
            ),
          ),
          Socials(),
          SizedBox(height: size.height * 0.01),
          const Greetings(),
        ],
      ),
    );
  }

  void launchEmail(String email) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    // ignore: deprecated_member_use
    if (await canLaunch(_emailLaunchUri.toString())) {
      // ignore: deprecated_member_use
      await launch(_emailLaunchUri.toString());
    } else {
      throw 'Could not launch $_emailLaunchUri';
    }
  }
}
