import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

// import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:prometeo/constants.dart';
// import 'package:prometeo/login_signup_new/login.dart';
import 'package:prometeo/pages/homepage.dart';
import 'package:prometeo/widgets/accomodation.dart';
import 'package:prometeo/widgets/custom_appbar.dart';
import 'package:prometeo/widgets/nav_drawer.dart';
import 'package:prometeo/widgets/update_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Map<String, dynamic>? userData;
  List<Map<String, dynamic>> accommodationList = [];
  List<Map<String, dynamic>> culturalList = [];

  @override
  void initState() {
    _fetchUserData();
    _fecthUserPasses();
    super.initState();
  }

  Future<void> _fecthUserPasses() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString('accesstoken');

    final Uri checkAccessTokenUri = Uri.parse(urlUsersPasses);
    final Map<String, String> headers = {
      "Authorization": "Bearer $accessToken"
    };

    final http.Response response =
        await http.get(checkAccessTokenUri, headers: headers);

    if (response.statusCode == 200) {
      print("There is Coupon.");
      // print(jsonDecode(response.body));
      List<Map<String, dynamic>> data =
          (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();

      for (Map<String, dynamic> item in data) {
        String name = item['name'];
        if (name == 'Accommodation') {
          accommodationList.add(item);
        } else if (name == 'Cultural') {
          culturalList.add(item);
        }
      }

      print('Accommodation List: $accommodationList');
      print('Cultural List: $culturalList');
    } else {
      // Handle error
      print('There is no passes');
    }
  }

  Future<void> _fetchUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString('accesstoken');

    final Uri checkAccessTokenUri = Uri.parse(urlUserData);
    final Map<String, String> headers = {
      "Authorization": "Bearer $accessToken"
    };

    final http.Response response =
        await http.get(checkAccessTokenUri, headers: headers);

    if (response.statusCode == 200) {
      print("Access token is valid.");
      print(jsonDecode(response.body));
      setState(() {
        userData = jsonDecode(response.body);
      });
    } else {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Check your Internet connectivity or Login Again!',
            style: GoogleFonts.poppins(
              color: Color.fromARGB(184, 14, 70, 122),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          dismissDirection: DismissDirection.up,
          duration: const Duration(milliseconds: 4000),
          backgroundColor: Colors.white,
          action: SnackBarAction(
            label: 'CLOSE',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            textColor: const Color.fromARGB(151, 0, 0, 0),
          ),
          // behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> Logout(BuildContext context) async {
    final googleSignIn = GoogleSignIn();

    // Check if the user is currently signed in with Google
    final isGoogleSignIn = await googleSignIn.isSignedIn();
    if (isGoogleSignIn) {
      // Disconnect Google Sign-In
      await googleSignIn.disconnect();
    }

    // Sign out from Firebase
    FirebaseAuth.instance.signOut();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accesstoken', "");
    await prefs.setString('refreshToken', "");

    // Introduce a delay of 1 second (1000 milliseconds)
    await Future.delayed(const Duration(milliseconds: 1500));

    // Navigate to the login screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    print(accommodationList.length);
    return Scaffold(
      drawer: NavDrawer(),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/dash.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: _fecthUserPasses(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While waiting for data, show a loading indicator
                return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.amberAccent,
                  ),
                );
                // } else if (snapshot.hasError) {
                //   // If there's an error, handle it accordingly
                //   return Text('Error: ${snapshot.error}');
              } else {
                return Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.width * 0.06,
                    ),
                    Container(
                      // width: size.width * 0.80,
                      margin: EdgeInsets.fromLTRB(
                          size.width * 0.02, 0, size.width * 0.02, 0),
                      padding: EdgeInsets.all(size.width * 0.04),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(68, 0, 0, 0),
                        borderRadius: BorderRadius.circular(size.width * 0.04),
                      ),
                      child: const CustomAppBar(
                        isHomePage: true,
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.03,
                    ),
                    Text(
                      'Dashboard'.toUpperCase(),
                      style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: size.width * 0.065,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.01,
                    ),
                    Text(
                      'Personal Details'.toUpperCase(),
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.04,
                    ),
                    Container(
                      padding: EdgeInsets.all(size.width * 0.03),
                      width: size.width * 0.90,
                      height: size.height * 0.55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width * 0.05),
                        color: Color.fromARGB(82, 0, 0, 0),
                      ),
                      child: userData == null
                          ? Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                                color: Colors.amberAccent,
                              ),
                            )
                          : SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: size.width * 0.03,
                                  ),
                                  ProfileDetails(
                                    textdesign: 'Name: ',
                                    textmain: userData!['first_name'] +
                                        ' ' +
                                        userData!['last_name'],
                                  ),
                                  SizedBox(
                                    height: size.width * 0.04,
                                  ),
                                  ProfileDetails(
                                    textdesign: "Email: ",
                                    textmain: userData!['email'],
                                  ),
                                  SizedBox(
                                    height: size.width * 0.04,
                                  ),
                                  ProfileDetails(
                                    textdesign: "Gender: ",
                                    textmain: userData!['gender'],
                                  ),
                                  SizedBox(
                                    height: size.width * 0.04,
                                  ),
                                  ProfileDetails(
                                    textdesign: "Referral code: ",
                                    textmain: userData!['invite_referral'],
                                  ),
                                  SizedBox(
                                    height: size.width * 0.04,
                                  ),
                                  ProfileDetails(
                                    textdesign: "Contact: ",
                                    textmain: userData!['contact'],
                                  ),
                                  SizedBox(
                                    height: size.width * 0.04,
                                  ),
                                  ProfileDetails(
                                    textdesign: "College: ",
                                    textmain: userData!['college'],
                                  ),
                                  SizedBox(
                                    height: size.width * 0.04,
                                  ),
                                  ProfileDetails(
                                    textdesign: "City: ",
                                    textmain: userData!['city'],
                                  ),
                                  SizedBox(
                                    height: size.width * 0.04,
                                  ),
                                  ProfileDetails(
                                      textdesign: "Campus Ambassador: ",
                                      textmain:
                                          userData!['ambassador'].toString()),
                                  // SizedBox(
                                  //   height: size.width * 0.04,
                                  // ),
                                  // ProfileDetails(
                                  //     textdesign: "Accomodation: ",
                                  //     textmain: userData!['accomodation'].toString()),
                                  SizedBox(
                                    height: size.width * 0.04,
                                  ),
                                  ProfileDetails(
                                    textdesign: "Year: ",
                                    textmain: userData!['current_year'],
                                  ),
                                  SizedBox(
                                    height: size.width * 0.04,
                                  ),
                                  ProfileDetails(
                                    textdesign: "Registration Id: ",
                                    textmain: userData!['registration_id'],
                                  ),
                                  SizedBox(
                                    height: size.width * 0.04,
                                  ),
                                  Container(
                                    height: size.height * 0.06,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          size.width * 0.02),
                                      color:
                                          const Color.fromRGBO(0, 94, 131, 1),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        Logout(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Logging you out Successfully!',
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            dismissDirection:
                                                DismissDirection.up,
                                            duration: const Duration(
                                                milliseconds: 4000),
                                            backgroundColor:
                                                Color.fromARGB(94, 8, 8, 8),
                                            action: SnackBarAction(
                                              label: 'CLOSE',
                                              onPressed: () {
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar();
                                              },
                                              textColor: Color.fromARGB(
                                                  150, 218, 214, 214),
                                            ),
                                            // behavior: SnackBarBehavior.floating,
                                          ),
                                        );
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) => const Login()));
                                      },
                                      child: Text(
                                        "Logout".toUpperCase(),
                                        style: GoogleFonts.orbitron(
                                            color: Colors.white,
                                            fontSize: size.width * 0.04,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.width * 0.02,
                                  ),
                                  Container(
                                    height: size.height * 0.06,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          size.width * 0.02),
                                      color:
                                          const Color.fromRGBO(0, 94, 131, 1),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => UpdateProfile(
                                              id: userData!['id'] ?? "",
                                              accomodation:
                                                  userData!['accomodation'] ??
                                                      "",
                                              ambassador:
                                                  userData!['ambassador'] ?? "",
                                              referralcode: userData![
                                                      'invite_referral'] ??
                                                  "",
                                              year: userData!['current_year'] ??
                                                  "",
                                              contact:
                                                  userData!['contact'] ?? "",
                                              firstName:
                                                  userData!['first_name'] ?? "",
                                              lastName:
                                                  userData!['last_name'] ?? "",
                                              city: userData!['city'] ?? "",
                                              college:
                                                  userData!['college'] ?? "",
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Update Profile".toUpperCase(),
                                        style: GoogleFonts.orbitron(
                                            color: Colors.white,
                                            fontSize: size.width * 0.04,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.width * 0.02,
                                  ),
                                  accommodationList.length == 0 &&
                                          culturalList.length == 0
                                      ? Container(
                                          height: size.height * 0.06,
                                          width: size.width,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                size.width * 0.02),
                                            color: const Color.fromRGBO(
                                                0, 94, 131, 1),
                                          ),
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Accomodation()));
                                            },
                                            child: Text(
                                              "Buy Pass".toUpperCase(),
                                              style: GoogleFonts.orbitron(
                                                  color: Colors.white,
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  SizedBox(
                                    height: size.width * 0.05,
                                  )
                                ],
                              ),
                            ),
                    ),
                    SizedBox(
                      height: size.width * 0.04,
                    ),
                    accommodationList.length == 0
                        ? Container()
                        : UserPasses(
                            firstname: userData!['first_name'],
                            registrationId: userData!['registration_id'],
                            imageUrl: 'https://i.imgur.com/AGhindD.png',
                          ),
                    SizedBox(
                      height: size.width * 0.04,
                    ),
                    culturalList.length == 0
                        ? Container()
                        : UserPasses(
                            firstname: userData!['first_name'],
                            registrationId: userData!['registration_id'],
                            imageUrl: 'https://i.imgur.com/7YFiJZl.png',
                          ),
                    SizedBox(
                      height: size.width * 0.04,
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  final String textdesign;
  final String? textmain;

  const ProfileDetails({
    required this.textdesign,
    required this.textmain,
    Key? key,
  }) : super(key: key);

  String mapYearToValue(String selectedYear) {
    switch (selectedYear) {
      case '1':
        return '1st Year';
      case '2':
        return '2nd Year';
      case '3':
        return '3rd Year';
      case '4':
        return '4th Year';
      case '5':
        return '5th Year';
      case '6':
        return 'Graduated';
      case '7':
        return 'Faculty/Staff';
      case '8':
        return 'NA';
      default:
        return '';
    }
  }

  String filterText(String? text) {
    if (text == null) {
      return ''; // Provide a default value for null
    }
    if (text == "1" ||
        text == "2" ||
        text == "3" ||
        text == "4" ||
        text == "5" ||
        text == "6" ||
        text == "7" ||
        text == "8") {
      return mapYearToValue(text);
    } else if (text == "true") {
      return "Yes";
    } else if (text == "false") {
      return "No";
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final String newTextmain = filterText(textmain);

    return Container(
      width: size.width,
      padding: EdgeInsets.all(size.width * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: Colors.amberAccent,
        ),
        color: Color.fromARGB(125, 0, 0, 0),
      ),
      child: Text(
        '$textdesign${newTextmain.toUpperCase()}',
        overflow: TextOverflow.fade,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: size.width * 0.04,
        ),
      ),
    );
  }
}

class UserPasses extends StatefulWidget {
  final String imageUrl;
  final String firstname;
  final String registrationId;

  const UserPasses(
      {required this.firstname,
      required this.registrationId,
      required this.imageUrl,
      super.key});

  @override
  State<UserPasses> createState() => _UserPassesState();
}

class _UserPassesState extends State<UserPasses> {
  GlobalKey passKey = GlobalKey();
  bool downloading = false;

  Future<void> _captureAndSave() async {
    try {
      setState(() {
        downloading = true; // Set downloading to true when download starts
      });
      await Future.delayed(Duration(milliseconds: 500));
      RenderRepaintBoundary boundary =
          passKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      final result =
          await ImageGallerySaver.saveImage(Uint8List.fromList(pngBytes));
      if (result != null && result.isNotEmpty) {
        print('Image saved to gallery: $result');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Pass Downloaded Successfully!',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            dismissDirection: DismissDirection.up,
            duration: const Duration(milliseconds: 4000),
            backgroundColor: Color.fromARGB(94, 8, 8, 8),
            action: SnackBarAction(
              label: 'CLOSE',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              textColor: Color.fromARGB(150, 218, 214, 214),
            ),
            // behavior: SnackBarBehavior.floating,
          ),
        );
      } else {
        print('Failed to save image');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'There is some error in downloading the pass!Try again',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            dismissDirection: DismissDirection.up,
            duration: const Duration(milliseconds: 4000),
            backgroundColor: Color.fromARGB(94, 8, 8, 8),
            action: SnackBarAction(
              label: 'CLOSE',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              textColor: Color.fromARGB(150, 218, 214, 214),
            ),
            // behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e, stackTrace) {
      print('Error during image capture: $e');
      print('Stack Trace: $stackTrace');
    } finally {
      setState(() {
        downloading = false; // Set downloading to false when download completes
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return RepaintBoundary(
      key: passKey,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: size.width * 0.45,
            width: size.width * 0.90,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.imageUrl),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            // Adjust the left position as needed
            left: size.width * 0.75,
            // top: size.width * 0.05,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.firstname.split('').map((char) {
                return Text(
                  char,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w500,
                  ),
                );
              }).toList(),
            ),
          ),
          Positioned(
            // Adjust the left position as needed
            left: size.width * 0.80,
            // top: size.width * 0.03,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  widget.registrationId.toUpperCase().split('').map((char) {
                return Text(
                  char,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w500,
                  ),
                );
              }).toList(),
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: size.width * 0.27,
            child: ElevatedButton(
              onPressed: _captureAndSave,
              child: downloading
                  ? CircularProgressIndicator(
                      color: Colors.amberAccent,
                      backgroundColor: Colors.blue,
                      value: size.width * 0.02,
                    )
                  : Text('Download'),
            ),
          ),
        ],
      ),
    );
  }
}
