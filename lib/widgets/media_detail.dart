// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/constants.dart';
import 'package:prometeo/widgets/theme_video.dart';

class MediaDetail extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String description;
  final String videoUrl;
  final String type;
  final bool hidden;

  const MediaDetail({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.videoUrl,
    required this.type,
    required this.hidden,
  }) : super(key: key);

  @override
  State<MediaDetail> createState() => _MediaDetailState();
}

class _MediaDetailState extends State<MediaDetail> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: size.width * 0.035,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: bgColor,
      body: Container(
        padding: EdgeInsets.only(
          left: size.width * 0.05,
          right: size.width * 0.05,
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.width * 0.06,
                ),
                widget.type == 'image'
                    ? Container(
                        width: size.width * 0.9,
                        height: size.width * 0.5,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: size.width * 0.0025, color: Colors.blue),
                            borderRadius:
                                BorderRadius.circular(size.width * 0.035),
                            image: DecorationImage(
                                image: NetworkImage(widget.imageUrl),
                                fit: BoxFit.fill)),
                      )
                    : ThemeVideo(videoUrl: widget.videoUrl),
                SizedBox(
                  height: size.width * 0.04,
                ),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                        color: shadowTextColor,
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                SizedBox(
                  height: size.width * 0.05,
                ),
                Text(
                  widget.description,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: size.width * 0.035,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: size.width * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
