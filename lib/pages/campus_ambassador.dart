import 'package:flutter/material.dart';
import 'package:prometeo/constants.dart';
// import 'package:prometeo/login_signup_new/login.dart';
// import 'package:prometeo/pages/login_sign_up.dart';
// import 'package:prometeo/widgets/bottom_nav_bar.dart';
import 'package:prometeo/widgets/custom_appbar.dart';
import 'package:prometeo/widgets/dashboard.dart';
import 'package:prometeo/widgets/nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
// import 'package:prometeo/widgets/preregistration.dart';
// import 'package:prometeo/widgets/splash_screen.dart';
// import 'package:prometeo/widgets/shadow_text.dart';

class CampusAmbassador extends StatefulWidget {
  const CampusAmbassador({super.key});

  @override
  State<CampusAmbassador> createState() => _CampusAmbassadorState();
}

class _CampusAmbassadorState extends State<CampusAmbassador> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // print(size.width);
    // print(size.height);
    return Scaffold(
      drawer: const NavDrawer(),
      extendBody: true,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          color: const Color.fromRGBO(42, 29, 61, 1),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, size.width * 0.12),
              padding: EdgeInsets.only(
                left: size.width * 0.065,
                right: size.width * 0.065,
                bottom: size.width * 0.03,
                top: size.width * 0.15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CustomAppBar(),
                  SizedBox(
                    height: size.width * 0.06,
                  ),
                  Text(
                    "CAMPUS AMBASSADOR PROGRAM",
                    style: GoogleFonts.orbitron(
                      color: const Color.fromRGBO(237, 147, 64, 1),
                      fontSize: size.width * 0.046,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.06,
                  ),
                  Text(
                    "CA PARTNERS ARE EXTENDING THE IMPACT OF PROMETEO BY ACTIVELY PROMOTIG THE FESTIVA AND EXPANDING ITS REACH",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: size.width * 0.02),
                  Container(
                    height: size.height * 0.35,
                    width: size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://i.imgur.com/VblV7Ve.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.02,
                  ),
                  Text(
                    "ABOUT THE PROGRAM",
                    style: GoogleFonts.orbitron(
                      color: const Color.fromRGBO(237, 147, 64, 1),
                      fontSize: size.width * 0.046,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.06,
                  ),
                  Text(
                    campusAmbaDesc,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: size.width * 0.045,
                  ),
                  Text(
                    "AN OPPORTUNITY TO GROW",
                    style: GoogleFonts.orbitron(
                      color: const Color.fromRGBO(237, 147, 64, 1),
                      fontSize: size.width * 0.046,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.02,
                  ),
                  Container(
                    height: size.height * 0.30,
                    width: size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://i.imgur.com/ZkPYsFP.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.06,
                  ),
                  Text(
                    oppurtunitytoGrow,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: size.width * 0.03,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: size.width * 0.045,
                  ),
                  Text(
                    "INCENTIVES",
                    style: GoogleFonts.orbitron(
                      color: Colors.white,
                      fontSize: size.width * 0.046,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.05,
                  ),
                  Container(
                    padding: EdgeInsets.all(size.width * 0.03),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(35, 27, 47, 1),
                        borderRadius: BorderRadius.all(
                            Radius.circular(size.width * 0.05))),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Silver Campus Ambassador",
                            style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(188, 198, 204, 1),
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          "10+ Registrations (with accommodation)",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: size.width * 0.03,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.04,
                  ),
                  SilverCA(size: size),
                  SizedBox(
                    height: size.width * 0.05,
                  ),
                  Container(
                    padding: EdgeInsets.all(size.width * 0.03),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(35, 27, 47, 1),
                        borderRadius: BorderRadius.all(
                            Radius.circular(size.width * 0.05))),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "GOLD Campus Ambassador",
                            style: GoogleFonts.poppins(
                              color: Colors.amberAccent,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          "20+ Registrations (with accommodation)",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: size.width * 0.03,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.04,
                  ),
                  GoldCA(
                    size: size,
                  ),
                  SizedBox(height: size.width * 0.07),
                  Text(
                    'So, grab the opportunity and pre-register as soon as possible to win the goodies and wonderful perks!',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: size.width * 0.03,
                    ),
                  ),
                  SizedBox(height: size.width * 0.03),
                  Container(
                    height: size.height * 0.06,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width * 0.02),
                      color: const Color.fromRGBO(237, 147, 64, 1),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DashBoard()));
                      },
                      child: Text(
                        "Register",
                        style: GoogleFonts.orbitron(
                            color: Colors.black,
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        margin:
            EdgeInsets.fromLTRB(0, size.width * 0.95, size.width * 0.025, 0),
        // padding: EdgeInsets.all(size.width * 0.01),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(size.width * 0.015),
          color: const Color.fromARGB(129, 0, 0, 0),
        ),
        child: FloatingActionButton(
          onPressed: () {
            _scrollController.animateTo(
              0.0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          backgroundColor: Colors.transparent,
          child: Icon(
            Icons.arrow_upward,
            color: Colors.white,
            size: size.width * 0.07,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // bottomNavigationBar: NavBar(currentIndex: -1),
    );
  }
}

class GoldCA extends StatelessWidget {
  const GoldCA({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: size.width * 0.12,
              width: size.width * 0.12,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    freeAccomodationpronitepass,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.025,
            ),
            Expanded(
              child: SizedBox(
                child: AutoSizeText(
                  "Free Accommodation and Pronite Pass",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.035,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.width * 0.04,
        ),
        Row(
          children: [
            Container(
              height: size.width * 0.12,
              width: size.width * 0.12,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    certificate,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.025,
            ),
            Expanded(
              child: SizedBox(
                child: AutoSizeText(
                  "Certificate",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.035,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.width * 0.04,
        ),
        Row(
          children: [
            Container(
              height: size.width * 0.12,
              width: size.width * 0.12,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    goodies,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.025,
            ),
            Expanded(
              child: SizedBox(
                child: AutoSizeText(
                  "Goodies",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.035,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.width * 0.04,
        ),
        Row(
          children: [
            Container(
              height: size.width * 0.12,
              width: size.width * 0.12,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    freetwoworkshopentry,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.025,
            ),
            Expanded(
              child: SizedBox(
                child: AutoSizeText(
                  "Free entry to 2 workshop",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.035,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.width * 0.04,
        ),
        Row(
          children: [
            Container(
              height: size.width * 0.12,
              width: size.width * 0.12,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://i.imgur.com/HOMb13A.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.025,
            ),
            Expanded(
              child: SizedBox(
                child: AutoSizeText(
                  "Networking with IITians & LinkedIn endorsements",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.035,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SilverCA extends StatelessWidget {
  const SilverCA({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: size.width * 0.12,
              width: size.width * 0.12,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    freeAccomodationpronitepass,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.025,
            ),
            Expanded(
              child: SizedBox(
                child: AutoSizeText(
                  "Free Accommodation and Pronite Pass",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.035,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.width * 0.04,
        ),
        Row(
          children: [
            Container(
              height: size.width * 0.12,
              width: size.width * 0.12,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    certificate,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.025,
            ),
            Expanded(
              child: SizedBox(
                child: AutoSizeText(
                  "Certificate",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.035,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.width * 0.04,
        ),
        Row(
          children: [
            Container(
              height: size.width * 0.12,
              width: size.width * 0.12,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    freetwoworkshopentry,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.025,
            ),
            Expanded(
              child: SizedBox(
                child: AutoSizeText(
                  "Free entry to 1 workshop",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.035,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.width * 0.04,
        ),
        Row(
          children: [
            Container(
              height: size.width * 0.12,
              width: size.width * 0.12,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://i.imgur.com/HOMb13A.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.025,
            ),
            Expanded(
              child: SizedBox(
                child: AutoSizeText(
                  "Networking with IITians & LinkedIn endorsements",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.035,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
