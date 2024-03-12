import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/api/fecth_curr_team.dart';
import 'package:prometeo/constants.dart';
import 'package:prometeo/models/teams_model.dart';
import 'package:prometeo/widgets/custom_appbar.dart';
import 'package:prometeo/widgets/nav_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class CurrentTeamsPage extends StatefulWidget {
  const CurrentTeamsPage({super.key});

  @override
  State<CurrentTeamsPage> createState() => _CurrentTeamsPageState();
}

class _CurrentTeamsPageState extends State<CurrentTeamsPage> {
  Future<Map<String, List<Teams>>>? teams;
  late final ScrollController _scrollController = ScrollController();
  List<Teams> publicRelations = [];
  List<Teams> aTS = [];
  List<Teams> coordinator = [];
  List<Teams> technicalEvent = [];
  List<Teams> contentWriting = [];
  List<Teams> enterPreneurshipEvents = [];
  List<Teams> exhibition = [];
  List<Teams> informalEvents = [];
  List<Teams> pronite = [];
  List<Teams> marketing = [];
  List<Teams> dNC = [];
  List<Teams> webD = [];
  List<Teams> appD = [];
  List<Teams> pNM = [];
  List<Teams> resources = [];
  List<Teams> festivalChief = [];

  @override
  void initState() {
    teams = fetchCurrTeam().then((teams) {
      if (teams.containsKey('publicRelations')) {
        publicRelations = teams['publicRelations'] ?? [];
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

    Future.delayed(const Duration(milliseconds: 500), () {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(seconds: publicRelations.length),
          curve: Curves.ease);
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const NavDrawer(),
      extendBody: true,
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
            teampagebg,
          ),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: size.width * 0.25,
                  ),
                  Text(
                    'TEAM',
                    style: GoogleFonts.orbitron(
                        fontSize: size.width * 0.05,
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.width * 0.02,
                  ),
                  Text(
                    "MEET THE VISIONARIES BEHIND THIS YEAR'S GROUNDBREAKING TECHNO FESTIVAL!",
                    style: GoogleFonts.poppins(
                        fontSize: size.width * 0.035,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: size.width * 0.06,
                  ),
                  Team(
                    vertical: publicRelations,
                    verticalName: "PUBLIC RELATIONS",
                  ),
                  Team(
                    vertical: aTS,
                    verticalName: "ATS",
                  ),
                  Team(
                    vertical: coordinator,
                    verticalName: "COORDINATOR",
                  ),
                  Team(
                    vertical: technicalEvent,
                    verticalName: "TECHNICAL EVENTS",
                  ),
                  Team(
                    vertical: contentWriting,
                    verticalName: "CONTENT WRITING",
                  ),
                  Team(
                    vertical: enterPreneurshipEvents,
                    verticalName: "ENTERPRENEURSHIP EVENTS",
                  ),
                  Team(
                    vertical: exhibition,
                    verticalName: "EXHIBITIONS",
                  ),
                  Team(
                    vertical: informalEvents,
                    verticalName: "INFORMAL EVENTS",
                  ),
                  Team(
                    vertical: pronite,
                    verticalName: "PRONITE",
                  ),
                  Team(
                    vertical: marketing,
                    verticalName: "MARKETING",
                  ),
                  Team(
                    vertical: dNC,
                    verticalName: "DESIGN & CREATIVITY",
                  ),
                  Team(
                    vertical: webD,
                    verticalName: "WEB DEVELOPMENT",
                  ),
                  Team(
                    vertical: appD,
                    verticalName: "APP DEVELOPMENT",
                  ),
                  Team(
                    vertical: pNM,
                    verticalName: "PUBLICITY & MEDIA",
                  ),
                  Team(
                    vertical: resources,
                    verticalName: "RESOURCES",
                  ),
                  Team(
                    vertical: festivalChief,
                    verticalName: "FESTIVAL CHIEF",
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: size.width * 0.3,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                teampagebg,
              ),
              fit: BoxFit.cover,
            )),
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.04),
              child: const CustomAppBar(
                isHomePage: true,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class Team extends StatefulWidget {
  final List<Teams> vertical;
  final String verticalName;

  const Team({
    Key? key,
    required this.vertical,
    required this.verticalName,
  }) : super(key: key);

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  late final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    int durationMilliseconds =
        widget.vertical.isNotEmpty ? widget.vertical.length : 3000;

    Future.delayed(const Duration(milliseconds: 500), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: durationMilliseconds),
        curve: Curves.ease,
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Center(
          child: Text(
            widget.verticalName,
            style: GoogleFonts.poppins(
                color: Colors.amber, fontSize: size.width * 0.05),
          ),
        ),
        SizedBox(
          height: size.width * 0.75,
          child: RotatedBox(
            quarterTurns: -1,
            child: ListWheelScrollView(
              controller: _scrollController,
              diameterRatio: 5,
              offAxisFraction: -0.8,
              itemExtent: 230,
              children: widget.vertical
                  .map((value) => Padding(
                        padding: EdgeInsets.all(size.width * 0.04),
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: TeamMember(
                            image: value.image,
                            insta: value.instagramLink,
                            name: value.name,
                            linkedin: value.linkedinLink,
                            phoneNumber: value.phoneNumber,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class TeamMember extends StatefulWidget {
  final String image;
  final String insta;
  final String name;
  final String linkedin;
  final String phoneNumber;

  const TeamMember({
    Key? key,
    required this.image,
    required this.insta,
    required this.name,
    required this.linkedin,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<TeamMember> createState() => _TeamMemberState();
}

class _TeamMemberState extends State<TeamMember> {
  String imageFinal = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Load the image after a delay
    _loadImage();
  }

  Future<void> _loadImage() async {
    await Future.delayed(const Duration(milliseconds: 500));
    String imageLinkpath = urlImagePathPastTeamMain;
    imageFinal = imageLinkpath + widget.image;
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const CircularProgressIndicator(); // or a loading indicator
    } else {
      final Size size = MediaQuery.of(context).size;
      return Column(
        children: [
          Opacity(
            opacity: 0.8,
            child: Stack(
              children: [
                Container(
                  height: size.width * 0.64,
                  padding: EdgeInsets.all(size.width * 0.04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width * 0.03),
                    color: Colors.white,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.width * 0.025,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          size.width * 0.02, 0, size.width * 0.02, 0),
                      height: size.width * 0.35,
                      width: size.width * 0.50,
                      // decoration: BoxDecoration(
                      //   color: Colors.blue[900],
                      //   borderRadius: BorderRadius.circular(size.width * 0.04),
                      //   image: DecorationImage(
                      //     fit: BoxFit.fill,
                      //     image: NetworkImage(imageFinal),
                      //   ),
                      // ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      widget.name,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _launchURL(widget.linkedin);
                            },
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: Image.network(
                                "https://i.postimg.cc/3RpgJzkR/linkedin.png",
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _launchURL(widget.insta);
                            },
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: Image.network(
                                "https://i.postimg.cc/MpFZ3T9k/instagram-1.png",
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _launchPhoneNumber(widget.phoneNumber);
                            },
                            child: const SizedBox(
                              height: 40,
                              width: 40,
                              child: Icon(
                                Icons.call_rounded,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          )
        ],
      );
    }
  }

  Future<void> _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url, forceSafariVC: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchPhoneNumber(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
