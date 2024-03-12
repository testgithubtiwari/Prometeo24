import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:prometeo/login_signup_new/login.dart';
// import 'package:prometeo/models/teams_model.dart';
import 'package:prometeo/pages/homepage.dart';
import 'package:prometeo/pages/sponsors.dart';
import 'package:prometeo/widgets/events.dart';
import 'package:prometeo/widgets/teams.dart';
// import 'package:prometeo/widgets/preregistration.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _pageController = PageController(initialPage: 0);
  final _controller = NotchBottomBarController(index: 0);
  // String email = "";

  int maxCount = 4;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const HomePage(),
    const Events(),
    const Sponsors(),
    const TeamsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          bottomBarPages.length,
          (index) => bottomBarPages[index],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              kIconSize: size.width * 0.06,
              kBottomRadius: size.width * 0.03,
              itemLabelStyle: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: size.width * 0.02,
                fontWeight: FontWeight.w600,
              ),

              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: Color.fromARGB(169, 12, 12, 12),
              showLabel: true,
              notchColor: Color.fromARGB(178, 134, 103, 20),

              /// restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: size.width,
              durationInMilliSeconds: 300,
              bottomBarItems: [
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.white,
                  ),
                  itemLabel: 'Home',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.event,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.event,
                    color: Colors.white,
                  ),
                  itemLabel: 'Events',
                ),

                ///svg example
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.currency_rupee,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.currency_rupee,
                    color: Colors.white,
                  ),
                  itemLabel: 'Sponsors',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                  itemLabel: 'Teams',
                ),
              ],
              onTap: (index) {
                _pageController.jumpToPage(index);
              },
            )
          : null,
    );
  }
}
