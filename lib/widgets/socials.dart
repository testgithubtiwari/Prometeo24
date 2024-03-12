import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Socials extends StatelessWidget {
  Socials({super.key});

  List socialMediaHandles = [
    {
      'imageLink': 'assets/images/insta.png',
      'url': Uri.parse('https://www.instagram.com/prometeo.iitj/'),
    },
    {
      'imageLink': "assets/images/link.png",
      'url': Uri.parse('https://www.linkedin.com/company/prometeo2022/'),
    },
    {
      'imageLink': 'assets/images/twit.png',
      'url': Uri.parse('https://twitter.com/IITJ_Prometeo'),
    },
    {
      'imageLink': 'assets/images/you.png',
      'url': Uri.parse(
        'https://www.youtube.com/channel/UC-NOBZ0ioDzQ_IWRtdFfqhw',
      ),
    }
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.width*0.15,
      // decoration: BoxDecoration(
      //     border: Border.all(width: 1, color: Colors.amberAccent)),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: socialMediaHandles.map(
          (element) {
            return IconButton(
              onPressed: () {
                launchUrl(element['url']);
              },
              icon: Image.asset(
                element['imageLink'],
                width: size.width * 0.070,
                height: size.width * 0.13,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
