import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/api/fecth_curr_team.dart';
import 'package:prometeo/constants.dart';
import 'package:prometeo/models/teams_model.dart';
// import 'package:prometeo/widgets/bottom_nav_bar.dart';
import 'package:prometeo/widgets/custom_appbar.dart';
import 'package:prometeo/widgets/nav_drawer.dart';
import 'package:prometeo/widgets/past_teams.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({super.key});

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  Future<Map<String, List<Teams>>>? teams;
  List<Teams> publicRelations = [];
  List<Teams> aTS = [];
  List<Teams> coordinator = [];
  List<Teams> technicalEvent = [];
  List<Teams> contentWriting = [];
  List<Teams> enterPreneurshipEvents = [];
  List<Teams> exhibition = [];
  List<Teams> econclave = [];
  List<Teams> informalEvents = [];
  List<Teams> pronite = [];
  List<Teams> marketing = [];
  List<Teams> dNC = [];
  List<Teams> webD = [];
  List<Teams> appD = [];
  List<Teams> pNM = [];
  List<Teams> resources = [];
  List<Teams> festivalChief = [];

  // late AnimationController _animationController;
  // late Animation<int> _textAnimation;

  @override
  void initState() {
    // _animationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 5),
    // );

    // _textAnimation = IntTween(begin: 0, end: "WISDOM STONE".length)
    //     .animate(_animationController);

    // _animationController.forward();

    teams = fetchCurrTeam().then((teams) {
      if (teams.containsKey('publicRelations')) {
        publicRelations = teams['publicRelations'] ?? [];
      }
      if (teams.containsKey('econclave')) {
        econclave = teams['econclave'] ?? [];
      }
      if (teams.containsKey('ats')) {
        aTS = teams['ats'] ?? [];
      }
      if (teams.containsKey('technicalEvents')) {
        technicalEvent = teams['technicalEvents'] ?? [];
      }
      if (teams.containsKey('contentWriting')) {
        contentWriting = teams['contentWriting'] ?? [];
      }
      if (teams.containsKey('enterPreneurshipEvents')) {
        enterPreneurshipEvents = teams['enterPreneurshipEvents'] ?? [];
      }
      if (teams.containsKey('exhibition')) {
        exhibition = teams['exhibition'] ?? [];
      }
      if (teams.containsKey('informalEvents')) {
        informalEvents = teams['informalEvents'] ?? [];
      }
      if (teams.containsKey('coordinator')) {
        coordinator = teams['coordinator'] ?? [];
      }
      if (teams.containsKey('webD')) {
        webD = teams['webD'] ?? [];
      }
      if (teams.containsKey('appD')) {
        appD = teams['appD'] ?? [];
      }
      if (teams.containsKey('pNM')) {
        pNM = teams['pNM'] ?? [];
      }
      if (teams.containsKey('resources')) {
        resources = teams['resources'] ?? [];
      }
      if (teams.containsKey('festivalChief')) {
        festivalChief = teams['festivalChief'] ?? [];
      }
      if (teams.containsKey('pronite')) {
        pronite = teams['pronite'] ?? [];
      }
      if (teams.containsKey('dNC')) {
        dNC = teams['dNC'] ?? [];
      }
      if (teams.containsKey('marketing')) {
        marketing = teams['marketing'] ?? [];
      }
      return teams;
    })
      // ignore: body_might_complete_normally_catch_error
      ..catchError((error) {}).whenComplete(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      drawer: const NavDrawer(),
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/teams.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            padding: EdgeInsets.fromLTRB(
              size.width * 0.05,
              size.width * 0.05,
              size.width * 0.05,
              0,
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(
                  isHomePage: true,
                ),
                // Stack(
                //   alignment: Alignment.topCenter,
                //   children: [
                //     Container(
                //       height: size.width,
                //       width: size.width * 1.5,
                //       decoration: const BoxDecoration(
                //         image: DecorationImage(
                //           image: NetworkImage(teamsStone),
                //           fit: BoxFit.fill,
                //         ),
                //       ),
                //     ),
                //     Positioned(
                //       top: size.width * 0.29,
                //       child: Container(
                //         decoration: const BoxDecoration(
                //           gradient: LinearGradient(
                //             colors: [
                //               Color.fromRGBO(11, 48, 160, 0.291),
                //               Color.fromRGBO(11, 48, 160, 0.697),
                //               Color.fromRGBO(11, 48, 160, 0.66),
                //               Color.fromRGBO(11, 48, 160, 0.237),
                //             ],
                //             stops: [
                //               0.2,
                //               0.4,
                //               0.6,
                //               0.9
                //             ], // Adjust the stops for the gradient effect
                //             begin: Alignment.centerLeft,
                //             end: Alignment.centerRight,
                //           ),
                //         ),
                //         child: Text(
                //           "ORGANIZING TEAM",
                //           style: GoogleFonts.orbitron(
                //             color: Colors.white,
                //             fontSize: size.width * 0.06,
                //             fontWeight: FontWeight.w800,
                //           ),
                //         ),
                //       ),
                //     ),
                //     Positioned(
                //       top: size.width * 0.415,
                //       child: AnimatedBuilder(
                //         animation: _textAnimation,
                //         builder: (context, child) {
                //           final typedText =
                //               "WISDOM STONE".substring(0, _textAnimation.value);
                //           return Container(
                //             decoration: const BoxDecoration(
                //                 color: Color.fromRGBO(11, 48, 160, 0.403)),
                //             child: Text(
                //               typedText,
                //               style: GoogleFonts.poppins(
                //                 color: Colors.white,
                //                 fontSize: size.width * 0.065,
                //                 fontWeight: FontWeight.w600,
                //               ),
                //             ),
                //           );
                //         },
                //       ),
                //     ),
                //     Positioned(
                //       top: size.width * 0.56,
                //       left: size.width * 0.05,
                //       right: size.width * 0.05,
                //       child: Container(
                //         decoration: const BoxDecoration(
                //           gradient: LinearGradient(
                //             colors: [
                //               Color.fromRGBO(11, 48, 160, 0.368),
                //               Color.fromRGBO(11, 48, 160, 0.863),
                //               Color.fromRGBO(11, 48, 160, 0.826),
                //               Color.fromRGBO(11, 48, 160, 0.305),
                //             ],
                //             stops: [
                //               0.2,
                //               0.4,
                //               0.6,
                //               0.9
                //             ], // Adjust the stops for the gradient effect
                //             begin: Alignment.centerLeft,
                //             end: Alignment.centerRight,
                //           ),
                //         ),
                //         padding:
                //             EdgeInsets.symmetric(horizontal: size.width * 0.02),
                //         child: Text(
                //           "MEET THE MASTERMINDS PROPELLING OUR TECHNO FESTIVAL TO NEW HEIGHTS!",
                //           style: GoogleFonts.poppins(
                //             color: Colors.white,
                //             fontSize: size.width * 0.025,
                //             fontWeight: FontWeight.w600,
                //           ),
                //           // textAlign: TextAlign.justify,
                //           // softWrap: true, // Allow text to wrap to the next line
                //           maxLines: 3,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: size.width * 0.02,
                // ),
                SizedBox(
                  height: size.width * 0.03,
                ),
                Center(
                  child: Text(
                    'ORGANIZING TEAM',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: size.width * 0.07,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: size.width * 0.03,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Color.fromRGBO(49, 119, 193, 0.902),
                        Color.fromRGBO(47, 129, 195, 0.816),
                        Colors.transparent,
                      ],
                      stops: [
                        0.1,
                        0.4,
                        0.6,
                        0.9
                      ], // Adjust the stops for the gradient effect
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Text(
                    'MEET THE MASTERMINDS PROPELLING OUR TECHNO FESTIVAL TO NEW HEIGHTS!',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: size.width * 0.07,
                ),
                TeamMembersWidget(
                  verticalName: 'PUBLIC RELATIONS',
                  teamMembers: publicRelations,
                ),
                SizedBox(
                  height: size.width * 0.12,
                ),
                TeamMembersWidget(
                  verticalName: 'ATS',
                  teamMembers: aTS,
                ),
                SizedBox(
                  height: size.width * 0.09,
                ),
                // TeamMembersWidget(
                //   verticalName: 'COORDINATOR',
                //   teamMembers: coordinator,
                // ),
                TeamMembersWidget(
                  verticalName: 'TECHNICAL EVENTS',
                  teamMembers: technicalEvent,
                ),
                SizedBox(
                  height: size.width * 0.09,
                ),
                TeamMembersWidget(
                  verticalName: 'CONTENT WRITING',
                  teamMembers: contentWriting,
                ),
                // SizedBox(
                //   height: size.width * 0.09,
                // ),
                // TeamMembersWidget(
                //   verticalName: 'ENTREPRENEURSHIP EVENTS',
                //   teamMembers: enterPreneurshipEvents,
                // ),
                SizedBox(
                  height: size.width * 0.09,
                ),
                TeamMembersWidget(
                  verticalName: 'EXHIBITION',
                  teamMembers: exhibition,
                ),
                SizedBox(
                  height: size.width * 0.09,
                ),
                TeamMembersWidget(
                  verticalName: 'E-CONCLAVE',
                  teamMembers: econclave,
                ),
                SizedBox(
                  height: size.width * 0.09,
                ),
                TeamMembersWidget(
                  verticalName: 'INFORMAL EVENTS',
                  teamMembers: informalEvents,
                ),
                // SizedBox(
                //   height: size.width * 0.09,
                // ),
                // TeamMembersWidget(
                //   verticalName: 'PRONITE',
                //   teamMembers: pronite,
                // ),
                SizedBox(
                  height: size.width * 0.09,
                ),
                TeamMembersWidget(
                  verticalName: 'MARKETING',
                  teamMembers: marketing,
                ),
                SizedBox(
                  height: size.width * 0.09,
                ),
                TeamMembersWidget(
                  verticalName: 'DESIGN AND CREATIVITY',
                  teamMembers: dNC,
                ),
                SizedBox(
                  height: size.width * 0.09,
                ),
                TeamMembersWidget(
                  verticalName: 'WEB DEVELOPMENT',
                  teamMembers: webD,
                ),
                SizedBox(
                  height: size.width * 0.09,
                ),
                TeamMembersWidget(
                  verticalName: 'APP DEVELOPMENT',
                  teamMembers: appD,
                ),
                SizedBox(
                  height: size.width * 0.09,
                ),
                TeamMembersWidget(
                  verticalName: 'PUBLICITY AND MEDIA',
                  teamMembers: pNM,
                ),
                SizedBox(
                  height: size.width * 0.09,
                ),
                TeamMembersWidget(
                  verticalName: 'RESOURCES',
                  teamMembers: resources,
                ),
                SizedBox(
                  height: size.width * 0.09,
                ),
                TeamMembersWidget(
                  verticalName: 'FESTIVAL CHIEFS',
                  teamMembers: festivalChief,
                ),
                SizedBox(
                  height: size.width * 0.05,
                ),
                Container(
                  height: size.height * 0.06,
                  width: size.width * 0.90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width * 0.02),
                    color: const Color.fromRGBO(0, 94, 131, 1),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PastTeams()));
                    },
                    child: Text(
                      "CheckOut Team'23",
                      style: GoogleFonts.orbitron(
                          color: Colors.white,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),

                SizedBox(
                  height: size.width * 0.19,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(
            0, size.width * 0.95, size.width * 0.025, size.width * 0.25),
        // padding: EdgeInsets.all(size.width * 0.01),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(size.width * 0.015),
          // color: const Color.fromARGB(93, 0, 0, 0),
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

class TeamMembersWidget extends StatelessWidget {
  final String verticalName;
  final List<Teams> teamMembers;

  const TeamMembersWidget({
    required this.verticalName,
    required this.teamMembers,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            verticalName,
            style: GoogleFonts.orbitron(
              color: Colors.white,
              fontSize: size.width * 0.055,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        SizedBox(height: size.width * 0.07),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: teamMembers.map((member) {
              return Members(
                image: member.image,
                name: member.name,
                verticalName: member.verticalName,
                linkedinUrl: member.linkedinLink,
                instagramUrl: member.instagramLink,
                phoneNumber: member.phoneNumber,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class Members extends StatefulWidget {
  final String image;
  final String name;
  final String verticalName;
  final String linkedinUrl;
  final String instagramUrl;
  final String phoneNumber;

  const Members({
    required this.image,
    required this.name,
    required this.verticalName,
    required this.instagramUrl,
    required this.linkedinUrl,
    required this.phoneNumber,
    Key? key,
  }) : super(key: key);

  @override
  State<Members> createState() => _MembersState();
}

class _MembersState extends State<Members> {
  bool isClicked = false;

  void toggleClicked() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    String imageFinal = urlImagePathPastTeamMain + widget.image;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, size.width * 0.04),
      child: Center(
        child: GestureDetector(
          onTap: toggleClicked,
          child: Stack(
            children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return isClicked
                      ? const LinearGradient(
                          colors: [Colors.grey, Colors.grey],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds)
                      : const LinearGradient(
                          colors: [Colors.transparent, Colors.transparent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                },
                blendMode: BlendMode.saturation,
                child: Container(
                  height: size.height * 0.35,
                  width: size.width * 0.70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: widget.image != ""
                          ? NetworkImage(imageFinal)
                          : const NetworkImage(
                              'https://i.imgur.com/PWp6rU5.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              !isClicked
                  ? Positioned(
                      bottom: 0,
                      child: SlideInUp(
                        child: AnimatedContainer(
                          padding: EdgeInsets.all(size.width * 0.01),
                          duration: const Duration(milliseconds: 500),
                          width: size.width * 0.70,
                          height: size.width * 0.15,
                          color: const Color.fromARGB(110, 17, 10, 10),
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.orbitron(
                                  color: Colors.white,
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                widget.verticalName.toUpperCase(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.orbitron(
                                    color: Color.fromARGB(144, 241, 238, 238),
                                    fontSize: size.width * 0.035,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Positioned(
                      bottom: 0,
                      child: SlideInRight(
                        child: AnimatedContainer(
                          padding: EdgeInsets.fromLTRB(
                              0, size.width * 0.02, 0, size.width * 0.02),
                          duration: const Duration(milliseconds: 500),
                          width: size.width * 0.70,
                          height: size.width * 0.12,
                          color: const Color.fromARGB(110, 17, 10, 10),
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _launchURL(context, widget.linkedinUrl);
                                  },
                                  child: SizedBox(
                                    height: 35,
                                    width: 35,
                                    child: Image.network(
                                      "https://i.imgur.com/27MVG1R.png",
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _launchURL(context, widget.instagramUrl);
                                  },
                                  child: SizedBox(
                                    height: 35,
                                    width: 35,
                                    child: Image.network(
                                      "https://i.imgur.com/1LvopQ2.png",
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _launchPhoneNumber(
                                        context, widget.phoneNumber);
                                  },
                                  child: SizedBox(
                                    height: 35,
                                    width: 35,
                                    child: Image.network(
                                        "https://i.imgur.com/297B6Jw.png"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _launchURL(BuildContext context, String url) async {
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url, forceSafariVC: false);
  } else {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Could not launch $url'),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

Future<void> _launchPhoneNumber(
    BuildContext context, String phoneNumber) async {
  // Remove non-numeric characters from the phone number
  final cleanedPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

  String url = 'tel:$cleanedPhoneNumber';
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Could not launch $url'),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
