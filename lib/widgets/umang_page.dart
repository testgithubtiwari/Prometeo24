import 'package:flutter/material.dart';
import 'package:prometeo/constants.dart';
// import 'package:prometeo/widgets/bottom_nav_bar.dart';
import 'package:prometeo/widgets/custom_appbar.dart';
import 'package:prometeo/widgets/nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class UmangPage extends StatefulWidget {
  const UmangPage({super.key});

  @override
  State<UmangPage> createState() => _UmangPageState();
}

class _UmangPageState extends State<UmangPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      drawer: const NavDrawer(),
      body: Container(
        color: const Color.fromRGBO(42, 29, 61, 1),
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: NetworkImage(prernaBackground),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, size.width * 0.12),
            padding: EdgeInsets.only(
              left: size.width * 0.05,
              right: size.width * 0.05,
              bottom: size.height * 0.03,
              top: size.height * 0.10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomAppBar(),
                SizedBox(
                  height: size.width * 0.05,
                ),
                Center(
                  child: Text(
                    "PRERNA",
                    style: GoogleFonts.orbitron(
                      color: Color.fromRGBO(237, 147, 64, 1),
                      fontSize: size.width * 0.08,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.width * 0.035,
                ),
                Container(
                  height: size.width * 0.40,
                  width: size.width,
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: 20,
                  ),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/prerna.png',
                          ),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  height: size.width * 0.05,
                ),
                Text(
                  prernaDesc,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: NavBar(currentIndex: -1),
    );
  }
}
