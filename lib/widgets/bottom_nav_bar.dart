import 'package:flutter/material.dart';
import 'package:prometeo/constants.dart';
// import 'package:prometeo/constants.dart';
// import 'package:prometeo/pages/events_screen.dart';
import 'package:prometeo/pages/homepage.dart';
// import 'package:prometeo/pages/login_sign_up.dart';
import 'package:prometeo/pages/sponsors.dart';
import 'package:prometeo/widgets/events.dart';
// import 'package:prometeo/widgets/preregister_image.dart';
import 'package:prometeo/widgets/preregistration.dart';
// import 'package:prometeo/widgets/splash_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

// ignore: must_be_immutable
class NavBar extends StatefulWidget {
  int currentIndex;
  NavBar({required this.currentIndex, Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String email = "";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      // color: Colors.transparent,
      margin: EdgeInsets.fromLTRB(
          size.width * 0.02, 0, size.width * 0.02, size.width * 0.03),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.amberAccent),
        color: Color.fromARGB(90, 79, 26, 122),
        borderRadius: BorderRadius.circular(size.width * 0.02),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SalomonBottomBar(
            margin: EdgeInsets.fromLTRB(8, 0, 5,0),
            // itemPadding: EdgeInsets.all(30),
            duration: Duration(milliseconds: 1000),
            curve: Curves.bounceInOut,
            currentIndex: widget.currentIndex,
            onTap: (index) {
              setState(() {
                widget.currentIndex = index;
              });
              _navigateToPage(index);
            },
            items: [
              SalomonBottomBarItem(
                selectedColor: cyan,
                icon: Icon(
                  Icons.home,
                  size: size.width * 0.06,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),

              SalomonBottomBarItem(
                selectedColor: cyan,
                icon: Icon(Icons.event,
                    size: size.width * 0.06, color: Colors.white),
                title: Text(
                  "Events",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              SalomonBottomBarItem(
                selectedColor: cyan,
                icon: Icon(Icons.currency_rupee,
                    size: size.width * 0.06, color: Colors.white),
                title: Text(
                  "Sponsors",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              // SalomonBottomBarItem(
              //   icon: email == ""
              //       ? IconButton(
              //           onPressed: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => const PreRegistration()));
              //           },
              //           icon: Icon(Icons.login,
              //               size: size.width * 0.05, color: Colors.white),
              //         )
              //       : IconButton(
              //           onPressed: () {
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => const PreRegistration()));
              //           },
              //           icon: Icon(Icons.logout,
              //               size: size.width * 0.05, color: Colors.white),
              //         ),
              //   title: email == ""
              //       ? Text(
              //           "Login",
              //           style: TextStyle(
              //             fontSize: size.width * 0.03,
              //             color: Colors.white,
              //           ),
              //         )
              //       : Text(
              //           "Logout",
              //           style: TextStyle(
              //             fontSize: size.width * 0.03,
              //             color: Colors.white,
              //           ),
              //         ),
              // ),
              SalomonBottomBarItem(
                selectedColor: cyan,
                icon: Icon(Icons.login,
                    size: size.width * 0.06, color: Colors.white),
                title: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 1:
        // Navigate to Events page
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Events()));
        break;
      case 2:
        // Navigate to Sponsors page
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Sponsors()));
        break;
      case 3:
        // Navigate to Login/Logout page
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PreRegistration()));
        break;
    }
  }
}
