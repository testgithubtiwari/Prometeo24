import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CardEventLocation extends StatelessWidget {
  final String eventLocation;

  const CardEventLocation({required this.eventLocation, Key? key})
      : super(key: key);

  void onTap() {
    // Show a toast message when the container is tapped.
    Fluttertoast.showToast(
      msg: "Double tap to Locate on map",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
    );
  }

  void onDoubleTap(BuildContext context) async {
    // Handle double tap, open a map with directions to the event location.
    String mapUrl =
        "https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(eventLocation)}";
    Uri url = Uri.parse(mapUrl);

    if (await canLaunchUrl(url)) {
      Fluttertoast.showToast(
        msg: "Navigating to $eventLocation",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
      );
      await launchUrl(url);
    } else {
      Fluttertoast.showToast(
        msg: "Could not open maps application",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: GestureDetector(
        onTap: onTap,
        onDoubleTap: () => onDoubleTap(context),
        child: Row(
          children: [
            Icon(
              Icons.location_on,
              size: size.width * 0.050,
              color: Colors.blue,
            ),
            SizedBox(width: size.width * 0.012),
            Text(
              eventLocation,
              style: GoogleFonts.poppins(
                fontSize: size.width * 0.045,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
