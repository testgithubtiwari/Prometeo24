import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/constants.dart';
import 'package:prometeo/widgets/bottom_nav_bar.dart';
import 'package:prometeo/widgets/custom_appbar.dart';
import 'package:prometeo/widgets/nav_drawer.dart';
import 'package:prometeo/widgets/shadow_text.dart';
import 'package:prometeo/widgets/theme_video.dart';

class ThemeRevealPage extends StatefulWidget {
  const ThemeRevealPage({super.key});

  @override
  State<ThemeRevealPage> createState() => _ThemeRevealPageState();
}

class _ThemeRevealPageState extends State<ThemeRevealPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const NavDrawer(),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              left: size.width * 0.05,
              right: size.width * 0.05,
              bottom: size.width * 0.03,
              top: size.width * 0.20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomAppBar(),
              SizedBox(
                height: size.width * 0.06,
              ),
              Center(
                child: ShadowTextWidget(
                  text: "Prometeo'24 Theme",
                  size: size.width * 0.05,
                  style: GoogleFonts.orbitron(
                      color: shadowTextColor, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: size.width * 0.05,
              ),
              const ThemeVideo(
                videoUrl: themeVideoLink,
              ),
              SizedBox(
                height: size.width * 0.06,
              ),
              Text(
                "An Elixir Odyssey",
                style: GoogleFonts.orbitron(
                    color: Colors.amberAccent,
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: size.width * 0.045,
              ),
              Text(
                themeDesc,
                style: GoogleFonts.poppins(
                    color: Colors.white, fontSize: size.width * 0.03),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(currentIndex: -1),
    );
  }
}
