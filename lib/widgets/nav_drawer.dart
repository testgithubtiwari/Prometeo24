import 'package:flutter/material.dart';
// import 'package:prometeo/constants.dart';
// import 'package:prometeo/models/teams_model.dart';
import 'package:prometeo/pages/campus_ambassador.dart';
// import 'package:prometeo/pages/events_screen.dart';
import 'package:prometeo/pages/homepage.dart';
import 'package:prometeo/pages/sponsors.dart';
import 'package:prometeo/widgets/accomodation.dart';
import 'package:prometeo/widgets/dashboard.dart';
// import 'package:prometeo/widgets/current_teams_page.dart';
// import 'package:prometeo/widgets/gallery.dart';
// import 'package:prometeo/widgets/past_teams.dart';
// import 'package:prometeo/widgets/past_teams_page.dart';
import 'package:prometeo/widgets/events.dart';
// import 'package:prometeo/widgets/splash_screen.dart';
import 'package:prometeo/widgets/teams.dart';
import 'package:prometeo/widgets/theme_page.dart';
// import 'package:prometeo/widgets/themereveal_page.dart';
// import 'package:prometeo/widgets/umang_page.dart';
// import 'package:prometeo/widgets/updates_page.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Drawer(
      width: size.width * 0.60,
      // backgroundColor: bgColor,
      child: Container(
        decoration: const BoxDecoration(
          // image: DecorationImage(
          //     image: AssetImage("assets/images/image2.jpg"), fit: BoxFit.cover),
          color: Color.fromRGBO(42, 29, 61, 1),
        ),
        child: ListView(
          padding: EdgeInsets.fromLTRB(size.width * 0.03, size.width * 0.05,
              size.width * 0.03, size.width * 0.01),
          children: <Widget>[
            const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/prometeo.png',
                    ),
                  ),
                ),
                child: Text('')),
            SizedBox(
              height: size.width * 0.01,
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                size: size.height * 0.025,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                    color: Colors.white, fontSize: size.height * 0.020),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                )
              },
            ),
            SizedBox(
              height: size.width * 0.01,
            ),
            ListTile(
              leading: Icon(
                Icons.event,
                size: size.height * 0.025,
                color: Colors.white,
              ),
              title: Text(
                'Events',
                style: TextStyle(
                    color: Colors.white, fontSize: size.height * 0.020),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Events()),
                )
              },
            ),
            SizedBox(
              height: size.width * 0.01,
            ),
            ListTile(
              leading: Icon(
                Icons.man,
                size: size.height * 0.025,
                color: Colors.white,
              ),
              title: Text(
                'DashBoard',
                style: TextStyle(
                    color: Colors.white, fontSize: size.height * 0.020),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DashBoard()),
                )
              },
            ),
            SizedBox(
              height: size.width * 0.01,
            ),
            ListTile(
              leading: Icon(
                Icons.currency_rupee,
                size: size.height * 0.025,
                color: Colors.white,
              ),
              title: Text(
                'Past Sponsors',
                style: TextStyle(
                    color: Colors.white, fontSize: size.height * 0.020),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Sponsors()),
                )
              },
            ),
            
            // SizedBox(
            //   height: size.width * 0.01,
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.newspaper,
            //     color: Colors.white,
            //     size: size.height * 0.025,
            //   ),
            //   title: Text(
            //     'News & Updates',
            //     style: TextStyle(
            //         color: Colors.white, fontSize: size.height * 0.020),
            //   ),
            //   onTap: () => {
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(builder: (context) => const UpdatesPage()),
            //     )
            //   },
            // ),
            SizedBox(
              height: size.width * 0.01,
            ),
            ListTile(
              leading: Icon(
                Icons.video_collection,
                color: Colors.white,
                size: size.height * 0.025,
              ),
              title: Text(
                'Theme',
                style: TextStyle(
                    color: Colors.white, fontSize: size.height * 0.020),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThemePage()),
                )
              },
            ),
            // SizedBox(
            //   height: size.width * 0.01,
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.favorite_outline_outlined,
            //     color: Colors.white,
            //     size: size.height * 0.025,
            //   ),
            //   title: Text(
            //     'Prerna',
            //     style: TextStyle(
            //         color: Colors.white, fontSize: size.height * 0.020),
            //   ),
            //   onTap: () => {
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(builder: (context) => const UmangPage()),
            //     )
            //   },
            // ),
            // SizedBox(
            //   height: size.width * 0.01,
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.people,
            //     color: Colors.white,
            //     size: size.height * 0.025,
            //   ),
            //   title: Text(
            //     'Past Teams',
            //     style: TextStyle(
            //         color: Colors.white, fontSize: size.height * 0.020),
            //   ),
            //   onTap: () => {
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) =>
            //               const SplashScreen(page: PastTeams())),
            //     )
            //   },
            // ),
            SizedBox(
              height: size.width * 0.01,
            ),
            ListTile(
              leading: Icon(
                Icons.people,
                color: Colors.white,
                size: size.height * 0.025,
              ),
              title: Text(
                'Teams',
                style: TextStyle(
                    color: Colors.white, fontSize: size.height * 0.020),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TeamsPage()),
                )
              },
            ),
            SizedBox(
              height: size.width * 0.01,
            ),
            ListTile(
              leading: Icon(
                Icons.shopify,
                color: Colors.white,
                size: size.height * 0.025,
              ),
              title: Text(
                'Campus Ambassador',
                style: TextStyle(
                    color: Colors.white, fontSize: size.height * 0.020),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CampusAmbassador()),
                )
              },
            ),
            ListTile(
              leading: Icon(
                Icons.hotel_sharp,
                color: Colors.white,
                size: size.height * 0.025,
              ),
              title: Text(
                'Accomodation',
                style: TextStyle(
                    color: Colors.white, fontSize: size.height * 0.020),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Accomodation()),
                )
              },
            ),
          ],
        ),
      ),
    );
  }
}
