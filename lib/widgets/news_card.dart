import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/constants.dart';

// ignore: must_be_immutable
class NewsCard extends StatefulWidget {
  String news;
  NewsCard({required this.news, super.key});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: newsCardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(size.width * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.newspaper,
                size: size.width * 0.055,
                color: Colors.white,
              ),
              SizedBox(
                width: size.width * 0.025,
              ),
              SizedBox(
                width: size.width * 0.6,
                child: Text(
                  widget.news,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size.width * 0.025,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
