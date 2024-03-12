import 'package:flutter/material.dart';
import 'package:prometeo/constants.dart';

// ignore: must_be_immutable
class EventBanner extends StatelessWidget {
  String eventType;
  EventBanner({required this.eventType, super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    String backgroundImagePath = "";
    if (eventType == 'Technical') {
      backgroundImagePath = technicalBanner;
    } else if (eventType == 'Exhibition') {
      backgroundImagePath = exhibitionBanner;
    } else if (eventType == 'Entrepreneurship') {
      backgroundImagePath = enterpreneuricalBanner;
    } else if (eventType == 'Past Speakers') {
      backgroundImagePath = speakerBanner;
    } else {
      backgroundImagePath = informalBanner;
    }

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(size.width * 0.30),
              bottomRight: Radius.circular(size.width * 0.30),
            ),
          ),
          child: Image.network(
            backgroundImagePath,
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
