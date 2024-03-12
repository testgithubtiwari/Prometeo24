import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/api/fetch_sponsors.dart';
// import 'package:prometeo/constants.dart';
import 'package:prometeo/models/sponsor_model.dart';
// import 'package:prometeo/widgets/bottom_nav_bar.dart';
import 'package:prometeo/widgets/custom_appbar.dart';
import 'package:prometeo/widgets/nav_drawer.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Sponsors extends StatefulWidget {
  const Sponsors({super.key});

  @override
  State<Sponsors> createState() => _SponsorsState();
}

class _SponsorsState extends State<Sponsors> {
  final ScrollController _scrollController = ScrollController();

  bool isLoading = true;
  Future<Map<String, List<SponsorModel>>>? sponsors;
  List<SponsorModel> titleSponsors = [];
  List<SponsorModel> coTitleSponsor = [];
  List<SponsorModel> associateSponsors = [];
  List<SponsorModel> poweredBy = [];
  List<SponsorModel> learningPartner = [];
  List<SponsorModel> logoPartner = [];
  List<SponsorModel> acceleratedByPartner = [];
  List<SponsorModel> esportsPartner = [];
  List<SponsorModel> radioPartner = [];
  List<SponsorModel> couponPartner = [];
  List<SponsorModel> educationPartner = [];
  List<SponsorModel> onlineMediaSponsors = [];
  List<SponsorModel> rcPlaneShowpartner = [];
  List<SponsorModel> jijoYouthpartner = [];
  List<SponsorModel> fashionpartner = [];
  List<SponsorModel> arcadePartner = [];
  List<SponsorModel> sociallyResponsiblePartner = [];
  List<SponsorModel> travelPartner = [];
  // List<SponsorModel> consultancyPartner = [];
  // List<SponsorModel> technicalEventsPartner = [];
  // List<SponsorModel> vCPartner = [];
  // List<SponsorModel> workshopPartner = [];
  // List<SponsorModel> servicesPartner = [];
  // List<SponsorModel> entertainmentPartner = [];
  // List<SponsorModel> giftingsPartner = [];
  // List<SponsorModel> digitalMediaPartner = [];
  // List<SponsorModel> printingPartner = [];
  List<SponsorModel> mediaPartner = [];
  List<SponsorModel> merchandisePartner = [];
  List<SponsorModel> rcpartner = [];

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      if (isLoading) {
        // If isLoading is still true after the timeout, data is not available.
        setState(() {
          isLoading = false;
        });
      }
    });
    sponsors = fetchSponsors().then((sponsors) {
      if (sponsors.containsKey('Title Sponsors')) {
        titleSponsors = sponsors['Title Sponsors'] ?? [];
      }
      if (sponsors.containsKey('Co-Title Sponsors')) {
        coTitleSponsor = sponsors['Co-Title Sponsors'] ?? [];
      }
      if (sponsors.containsKey('associateSponsors')) {
        associateSponsors = sponsors['associateSponsors'] ?? [];
      }
      if (sponsors.containsKey('poweredBy')) {
        poweredBy = sponsors['poweredBy'] ?? [];
      }
      if (sponsors.containsKey('learningPartner')) {
        learningPartner = sponsors['learningPartner'] ?? [];
      }
      if (sponsors.containsKey('logoPartner')) {
        logoPartner = sponsors['logoPartner'] ?? [];
      }
      if (sponsors.containsKey('acceleratedByPartner')) {
        acceleratedByPartner = sponsors['acceleratedByPartner'] ?? [];
      }
      if (sponsors.containsKey('esportsPartner')) {
        esportsPartner = sponsors['esportsPartner'] ?? [];
      }
      if (sponsors.containsKey('radioPartner')) {
        radioPartner = sponsors['radioPartner'] ?? [];
      }
      if (sponsors.containsKey('couponPartner')) {
        couponPartner = sponsors['couponPartner'] ?? [];
      }
      if (sponsors.containsKey('educationPartner')) {
        educationPartner = sponsors['educationPartner'] ?? [];
      }
      if (sponsors.containsKey('onlinemediaPartner')) {
        onlineMediaSponsors = sponsors['onlinemediaPartner'] ?? [];
      }
      if (sponsors.containsKey('rcpartner')) {
        rcpartner = sponsors['rcpartner'] ?? [];
      }
      if (sponsors.containsKey('rcPlaneShowpartner')) {
        rcPlaneShowpartner = sponsors['rcPlaneShowpartner'] ?? [];
      }
      if (sponsors.containsKey('jijoYouthpartner')) {
        jijoYouthpartner = sponsors['jijoYouthpartner'] ?? [];
      }
      if (sponsors.containsKey('fashionpartner')) {
        fashionpartner = sponsors['fashionpartner'] ?? [];
      }
      if (sponsors.containsKey('arcadePartner')) {
        arcadePartner = sponsors['arcadePartner'] ?? [];
      }
      if (sponsors.containsKey('sociallyResponsiblePartner')) {
        sociallyResponsiblePartner =
            sponsors['sociallyResponsiblePartner'] ?? [];
      }
      if (sponsors.containsKey('travelPartner')) {
        travelPartner = sponsors['travelPartner'] ?? [];
      }
      // if (sponsors.containsKey('sociallyResponsiblePartner')) {
      //   sociallyResponsiblePartner =
      //       sponsors['sociallyResponsiblePartner'] ?? [];
      // }
      if (sponsors.containsKey('mediaPartners')) {
        mediaPartner = sponsors['mediaPartners'] ?? [];
      }
      if (sponsors.containsKey('merchandisePartner')) {
        merchandisePartner = sponsors['merchandisePartner'] ?? [];
      }

      if (sponsors.containsKey('acceleratedByPartner')) {
        acceleratedByPartner = sponsors['acceleratedByPartner'] ?? [];
      }

      return sponsors;
      // ignore: body_might_complete_normally_catch_error
    }).catchError((error) {
      // Handle the error if needed
      // ignore: avoid_print
      print('Error fetching sponsors: $error');
      // ignore: invalid_return_type_for_catch_error
      // Return a value of the same type as sponsors
    }).whenComplete(() {
      setState(() {
        isLoading = false;
        // Return the original result
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const NavDrawer(),
      extendBody: true,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          height: size.height,
          color: const Color.fromRGBO(31, 21, 45, 1),
          child: isLoading
              ? const Center(
                  child: SpinKitSpinningLines(color: Colors.white),
                )
              : Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.08,
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, size.width * 0.15),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const CustomAppBar(
                          isHomePage: true,
                        ),
                        SizedBox(
                          height: size.width * 0.06,
                        ),
                        SlideInDown(
                          child: Text(
                            "SPONSORS",
                            style: GoogleFonts.orbitron(
                              fontSize: size.width * 0.065,
                              color: Colors.amberAccent,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.width * 0.02,
                        ),
                        Text(
                          'Their Invaluable Support and Partnership have been instrumental in making Prometeo 2024 a success.',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorTag(sponsorName: "TITLE SPONSOR"),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorBuilder(sponsorsList: titleSponsors),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        const Divider(
                          height: 2,
                          color: Color.fromARGB(81, 245, 245, 245),
                        ),
                        SizedBox(
                          height: size.width * 0.06,
                        ),
                        SponsorTag(sponsorName: "CO-TITLE SPONSOR"),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorBuilder(sponsorsList: coTitleSponsor),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        const Divider(
                          height: 2,
                          color: Color.fromARGB(81, 245, 245, 245),
                        ),
                        SizedBox(
                          height: size.width * 0.06,
                        ),
                        SponsorTag(sponsorName: "ASSOCIATE SPONSOR"),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorBuilder(sponsorsList: associateSponsors),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        const Divider(
                          height: 2,
                          color: Color.fromARGB(81, 245, 245, 245),
                        ),
                        SizedBox(
                          height: size.width * 0.06,
                        ),
                        SponsorTag(sponsorName: "POWERED BY"),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorBuilder(sponsorsList: poweredBy),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        const Divider(
                          height: 2,
                          color: Color.fromARGB(81, 245, 245, 245),
                        ),
                        SizedBox(
                          height: size.width * 0.06,
                        ),
                        SponsorTag(sponsorName: "LEARNING PARTNER"),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorBuilder(sponsorsList: learningPartner),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        const Divider(
                          height: 2,
                          color: Color.fromARGB(81, 245, 245, 245),
                        ),
                        SizedBox(
                          height: size.width * 0.06,
                        ),
                        SponsorTag(sponsorName: "LOGO PARTNER"),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorBuilder(sponsorsList: logoPartner),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        const Divider(
                          height: 2,
                          color: Color.fromARGB(81, 245, 245, 245),
                        ),
                        SizedBox(
                          height: size.width * 0.06,
                        ),
                        SponsorTag(sponsorName: "ACCELERATED BY PARTNER"),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorBuilder(sponsorsList: acceleratedByPartner),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        const Divider(
                          height: 2,
                          color: Color.fromARGB(81, 245, 245, 245),
                        ),
                        SizedBox(
                          height: size.width * 0.06,
                        ),
                        SponsorTag(sponsorName: "E-SPORTS PARTNER"),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorBuilder(sponsorsList: esportsPartner),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        const Divider(
                          height: 2,
                          color: Color.fromARGB(81, 245, 245, 245),
                        ),
                        SizedBox(
                          height: size.width * 0.06,
                        ),
                        SponsorTag(sponsorName: "RADIO PARTNER"),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorBuilder(sponsorsList: radioPartner),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        const Divider(
                          height: 2,
                          color: Color.fromARGB(81, 245, 245, 245),
                        ),
                        SizedBox(
                          height: size.width * 0.06,
                        ),
                        SponsorTag(sponsorName: "MERCHANDISE PARTNER"),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorBuilder(sponsorsList: merchandisePartner),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        const Divider(
                          height: 2,
                          color: Color.fromARGB(81, 245, 245, 245),
                        ),
                        SizedBox(
                          height: size.width * 0.06,
                        ),
                        SponsorTag(sponsorName: "COUPON PARTNER"),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorBuilder(sponsorsList: couponPartner),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        const Divider(
                          height: 2,
                          color: Color.fromARGB(81, 245, 245, 245),
                        ),
                        SizedBox(
                          height: size.width * 0.06,
                        ),
                        SponsorTag(sponsorName: "EDUCATION PARTNER"),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorBuilder(sponsorsList: educationPartner),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        const Divider(
                          height: 2,
                          color: Color.fromARGB(81, 245, 245, 245),
                        ),
                        SizedBox(
                          height: size.width * 0.02,
                        ),
                        SponsorTag(sponsorName: "RC CAR RACING PARTNER"),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorBuilder(sponsorsList: rcpartner),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        const Divider(
                          height: 2,
                          color: Color.fromARGB(81, 245, 245, 245),
                        ),
                        SponsorTag(sponsorName: "RC PLANE SHOW PARTNER"),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorBuilder(sponsorsList: rcPlaneShowpartner),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        const Divider(
                          height: 2,
                          color: Color.fromARGB(81, 245, 245, 245),
                        ),
                        SizedBox(
                          height: size.width * 0.02,
                        ),
                        SponsorTag(sponsorName: "FASHION PARTNER"),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorBuilder(sponsorsList: fashionpartner),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        const Divider(
                          height: 2,
                          color: Color.fromARGB(81, 245, 245, 245),
                        ),
                        SizedBox(
                          height: size.width * 0.02,
                        ),
                        SponsorTag(sponsorName: "JITO YOUTH"),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorBuilder(sponsorsList: jijoYouthpartner),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        const Divider(
                          height: 2,
                          color: Color.fromARGB(81, 245, 245, 245),
                        ),
                        SizedBox(
                          height: size.width * 0.02,
                        ),
                        SponsorTag(sponsorName: "ARCADE PARTNER"),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorBuilder(sponsorsList: arcadePartner),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        const Divider(
                          height: 2,
                          color: Color.fromARGB(81, 245, 245, 245),
                        ),
                        SizedBox(
                          height: size.width * 0.02,
                        ),
                        SponsorTag(sponsorName: "SOCIALLY RESPONSIBLE PARTNER"),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorBuilder(
                            sponsorsList: sociallyResponsiblePartner),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        const Divider(
                          height: 2,
                          color: Color.fromARGB(81, 245, 245, 245),
                        ),
                        SizedBox(
                          height: size.width * 0.02,
                        ),
                        SponsorTag(sponsorName: "TRAVEL PARTNER"),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorBuilder(sponsorsList: travelPartner),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        const Divider(
                          height: 2,
                          color: Color.fromARGB(81, 245, 245, 245),
                        ),
                        SizedBox(
                          height: size.width * 0.06,
                        ),
                        SponsorTag(sponsorName: "ONLINE MEDIA PARTNER"),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        SponsorBuilder(sponsorsList: onlineMediaSponsors),
                        SizedBox(
                          height: size.width * 0.05,
                        ),
                        // const Divider(
                        //   height: 2,
                        //   color: Color.fromARGB(81, 245, 245, 245),
                        // ),
                        SizedBox(
                          height: size.width * 0.06,
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
      // floatingActionButton: Container(
      //   margin: EdgeInsets.fromLTRB(
      //       0, size.width * 0.95, size.width * 0.025, size.width * 0.15),
      //   padding: EdgeInsets.all(size.width * 0.01),
      //   decoration: BoxDecoration(
      //     border: Border.all(width: 1, color: Colors.white),
      //     borderRadius: BorderRadius.circular(size.width * 0.015),
      //     // color: const Color.fromARGB(93, 0, 0, 0),
      //   ),
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       _scrollController.animateTo(
      //         0.0,
      //         duration: const Duration(milliseconds: 500),
      //         curve: Curves.easeInOut,
      //       );
      //     },
      //     backgroundColor: Colors.transparent,
      //     child: Icon(
      //       Icons.arrow_upward,
      //       color: Colors.white,
      //       size: size.width * 0.07,
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // bottomNavigationBar: NavBar(currentIndex: 2),
    );
  }
}

// ignore: must_be_immutable
class SponsorTag extends StatelessWidget {
  String sponsorName;
  SponsorTag({required this.sponsorName, super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: SlideInUp(
        child: Column(
          children: [
            Text(
              sponsorName,
              style: GoogleFonts.orbitron(
                color: Colors.amberAccent,
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class SponsorBuilder extends StatelessWidget {
  final List<SponsorModel> sponsorsList;
  const SponsorBuilder({required this.sponsorsList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // const String imageLinkPath = urlImagePathSponsorMain;
    final Size size = MediaQuery.of(context).size;
    if (sponsorsList.isEmpty) {
      return Center(
        child: SlideInRight(
          child: const Text(
            "Coming Soon",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 400) {
          // Display as a Row
          return Wrap(
            direction: Axis.horizontal,
            spacing: 12.0,
            runSpacing: 12.0,
            children: sponsorsList.map((sponsor) {
              return Container(
                height: size.width * 0.4,
                width: size.width * 0.6,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(size.width * 0.02),
                  image: DecorationImage(
                    image: NetworkImage(sponsor.image),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }).toList(),
          );
        } else {
          return Wrap(
            direction: Axis.vertical,
            spacing: 12.0,
            runSpacing: 12.0,
            children: sponsorsList.map((sponsor) {
              return Container(
                height: size.width * 0.4,
                width: size.width * 0.6,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(size.width * 0.02),
                  image: DecorationImage(
                    image: NetworkImage(sponsor.image),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}
