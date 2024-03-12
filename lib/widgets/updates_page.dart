import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/api/fetch_updates.dart';
import 'package:prometeo/constants.dart';
import 'package:prometeo/models/updates_model.dart';
import 'package:prometeo/widgets/bottom_nav_bar.dart';
import 'package:prometeo/widgets/custom_appbar.dart';
import 'package:prometeo/widgets/nav_drawer.dart';
import 'package:prometeo/widgets/news_card.dart';

class UpdatesPage extends StatefulWidget {
  const UpdatesPage({super.key});

  @override
  State<UpdatesPage> createState() => _UpdatesPageState();
}

class _UpdatesPageState extends State<UpdatesPage> {
  List<Updates> updatesEvent = [];
  List<Updates> updatesApp = [];

  Future<void> _refreshUpdates() async {
    // Fetch updates again and update the state
    List<Updates> refreshedUpdates = await fetchUpdates();
    setState(() {
      updatesEvent = refreshedUpdates
          .where((update) => update.updatestype == 'event')
          .toList();

      updatesApp = refreshedUpdates
          .where((update) => update.updatestype == 'app')
          .toList();
    });
  }

  @override
  void initState() {
    fetchUpdates().then((updates) {
      setState(() {
        updatesEvent =
            updates.where((update) => update.updatestype == 'event').toList();

        updatesApp =
            updates.where((update) => update.updatestype == 'app').toList();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () => _refreshUpdates(),
      child: Scaffold(
        drawer: const NavDrawer(),
        backgroundColor: const Color.fromRGBO(42, 29, 61, 1),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: size.width * 0.13,
              left: size.width * 0.10,
              right: size.width * 0.10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(
                  isHomePage: true,
                ),
                SizedBox(
                  height: size.width * 0.08,
                ),
                const NewsOfDay(),
                SizedBox(
                  height: size.width * 0.04,
                ),
                Text(
                  "News from Prometeo'24",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.042,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: size.width * 0.04,
                ),
                updatesEvent.isEmpty
                    ? Center(
                        child: SlideInDown(
                          child: Text(
                            'Coming Soon',
                            style: GoogleFonts.poppins(
                                color: Colors.amberAccent,
                                fontSize: size.width * 0.05),
                          ),
                        ),
                      )
                    : Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: updatesEvent.map((update) {
                          return NewsCard(news: update.news);
                        }).toList(),
                      ),
                SizedBox(
                  height: size.width * 0.04,
                ),
                Text(
                  "Latest updates",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.042,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: size.width * 0.04,
                ),
                updatesApp.isEmpty
                    ? Center(
                        child: SlideInDown(
                          child: Text(
                            'Coming Soon',
                            style: GoogleFonts.poppins(
                                color: Colors.amberAccent,
                                fontSize: size.width * 0.05),
                          ),
                        ),
                      )
                    : Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: updatesApp.map((update) {
                          return NewsCard(news: update.news);
                        }).toList(),
                      ),
                SizedBox(
                  height: size.width * 0.04,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavBar(currentIndex: -1),
      ),
    );
  }
}

class NewsOfDay extends StatefulWidget {
  const NewsOfDay({super.key});

  @override
  State<NewsOfDay> createState() => _NewsOfDayState();
}

class _NewsOfDayState extends State<NewsOfDay> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * 0.02),
            border: Border.all(width: 1, color: Colors.blue),
            image: const DecorationImage(
              image: NetworkImage(
                updates,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: bgColor.withOpacity(0.5),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: const Alignment(-0.8, 0.8),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                color: bgColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "News of the Day",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
