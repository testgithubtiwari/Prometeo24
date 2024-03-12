import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class NewGallery extends StatefulWidget {
  const NewGallery({super.key});

  @override
  State<NewGallery> createState() => _HomePageState();
}

class _HomePageState extends State<NewGallery> {
/////////////////////////////////////
//@CodeWithFlexz on Instagram
//
//AmirBayat0 on Github
//Programming with Flexz on Youtube
/////////////////////////////////////
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtent = _scrollController.position.minScrollExtent;
      double maxScrollExtent = _scrollController.position.maxScrollExtent;

      animateToMaxMin(
          maxScrollExtent, minScrollExtent, maxScrollExtent, _scrollController);
    });
    super.initState();
  }

  animateToMaxMin(double max, double min, double direction,
      ScrollController scrollController) {
    Future.delayed(const Duration(seconds: 1), () {
      scrollController
          .animateTo(direction,
              duration: Duration(seconds: asset.length * 2),
              curve: Curves.linear)
          .then((value) {
        direction = direction == max ? min : max;
        animateToMaxMin(max, min, direction, scrollController);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<String> asset = [
    'assets/images/ab.png',
    'assets/images/insta_logo.jpg',
    'assets/images/preloader.gif',
    'assets/images/ab.png',
    'assets/images/insta_logo.jpg',
    'assets/images/preloader.gif',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              color: Colors.black,
            ),
            SizedBox(
              width: size.width,
              height: size.height,
              child: MasonryGridView.builder(
                scrollDirection: Axis.vertical,
                controller: _scrollController,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                physics: const BouncingScrollPhysics(),
                itemCount: asset.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                        image: AssetImage(asset[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(1),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: FadeInUp(
                        child: Text(
                          "Technical Fest",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.orbitron(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                            builder: (ctx) => const NewGallery(),
                          ),
                        );
                      },
                      child: FadeInUp(
                        delay: const Duration(milliseconds: 500),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/images/ab.png'),
                        ),
                      ),
                    ),
                    FadeInUp(
                      delay: const Duration(milliseconds: 700),
                      child: Text(
                        "Abhishek Bachhan",
                        style: GoogleFonts.actor(
                            color: Colors.white, fontSize: 17),
                      ),
                    ),
                    FadeInUp(
                      delay: const Duration(milliseconds: 900),
                      child: Text(
                        "Fetival Chief",
                        style: GoogleFonts.actor(
                            color: Colors.grey[300], fontSize: 15),
                      ),
                    ),
                    FadeInUp(
                      delay: const Duration(milliseconds: 1000),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          Text(
                            "@prometeo.in",
                            style: GoogleFonts.actor(
                                color: Colors.grey, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
