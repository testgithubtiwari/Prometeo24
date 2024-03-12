import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardSponsorImage extends StatefulWidget {
  String sponsorLink;
  CardSponsorImage({required this.sponsorLink, super.key});

  @override
  State<CardSponsorImage> createState() => _CardSponsorImageState();
}

class _CardSponsorImageState extends State<CardSponsorImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Image.network(
        widget.sponsorLink,
        scale: 1.5,
      ),
    );
  }
}
