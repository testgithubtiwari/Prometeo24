import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/constants.dart';
// import 'package:prometeo/pages/homepage.dart';
// import 'package:prometeo/widgets/bottom_nav_bar.dart';
import 'package:prometeo/widgets/custom_appbar.dart';
import 'package:prometeo/widgets/nav_drawer.dart';
// import 'package:prometeo/widgets/splash_screen.dart';
import 'package:prometeo/widgets/theme_video.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _textAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _textAnimation = IntTween(begin: 0, end: "An Elixir Odyssey".length)
        .animate(_animationController);

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const NavDrawer(),
      extendBody: true,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/themback.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                size.width * 0.05,
                size.width * 0.10,
                size.width * 0.05,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Center(
                        child: Container(
                          height: size.width * 0.50,
                          width: size.width * 0.35,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/themestone.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.width * 0.04, // Adjust the position as needed
                        child: Text(
                          'THEME',
                          style: GoogleFonts.orbitron(
                            color: Colors.white,
                            fontSize: size.width * 0.07,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.width * 0.16,
                        child: AnimatedBuilder(
                          animation: _textAnimation,
                          builder: (context, child) {
                            final typedText = "An Elixir Odyssey"
                                .toUpperCase()
                                .substring(0, _textAnimation.value);
                            return Text(
                              typedText,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.055,
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: size.width * 0.28, // Adjust the position as needed
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Color.fromRGBO(110, 21, 199, 1),
                                Color.fromRGBO(81, 31, 131, 0.816),
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
                          child: Center(
                            child: Text(
                              'Journey to the elixir odyssey'.toUpperCase(),
                              style: GoogleFonts.orbitron(
                                color: Colors.white,
                                fontSize: size.width * 0.03,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const ThemeVideo(
                    videoUrl: themeVideoLink,
                  ),
                  Container(
                    padding: EdgeInsets.all(size.width * 0.02),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        border:
                            Border.all(width: 1, color: Colors.amberAccent)),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, size.width * 0.25),
                    child: Text(
                      themeDesc,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  // SizedBox(
                  //   height: size.width * 0.03,
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
      // bottomNavigationBar: NavBar(currentIndex: -1),
    );
  }
}
