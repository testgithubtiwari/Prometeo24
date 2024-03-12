import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/constants.dart';
import 'package:prometeo/widgets/custom_appbar.dart';
import 'package:prometeo/widgets/media_detail.dart';
import 'package:prometeo/widgets/nav_drawer.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:prometeo/models/gallerymodel.dart';
import 'package:prometeo/api/gallery_fetch.dart';

class Gallery extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const Gallery({Key? key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List<GalleryItem> mediaList = [];

  @override
  void initState() {
    super.initState();
    fetchMediaData();
  }

  Future<void> fetchMediaData() async {
    try {
      final List<GalleryItem> fetchedMedia = await fetchMedia();
      setState(() {
        mediaList = fetchedMedia;
      });
    } catch (e) {
      // Handle errors if the API call fails
      print("Error fetching media: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    List<String> titles = mediaList.map((media) => media.name).toList();
    List<Widget> images = mediaList.map((media) {
      return Container(
        width: size.width,
        height: MediaQuery.of(context).size.width * .90,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(urlGalleryImagePathLocal + media.image),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(size.width * 0.025),
        ),
      );
    }).toList();

    return Scaffold(
      drawer: const NavDrawer(),
      extendBody: true,
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://i.imgur.com/cjfuYzX.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(size.width * 0.05, size.width * 0.16,
              size.width * 0.05, size.width * 0.03),
          child: Column(
            children: [
              const CustomAppBar(
                isHomePage: true,
              ),
              SizedBox(
                height: size.width * 0.03,
              ),
              Expanded(
                child: SizedBox(
                  width: size.width,
                  height: size.width,
                  child: Column(
                    children: [
                      Expanded(
                        child: VerticalCardPager(
                          textStyle: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: size.width * 0.002),
                          titles: titles,
                          initialPage: 0,
                          images: images,
                          onPageChanged: (page) {},
                          align: ALIGN.CENTER,
                          onSelectedItem: (index) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MediaDetail(
                                title: mediaList[index].name,
                                imageUrl: urlGalleryImagePathLocal +
                                    mediaList[index].image,
                                description: mediaList[index].description,
                                videoUrl: mediaList[index].video!,
                                type: mediaList[index].type,
                                hidden: mediaList[index].hidden,
                              ),
                            ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
