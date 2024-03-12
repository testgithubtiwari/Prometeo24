import 'package:flutter/material.dart';

class ThemeImage extends StatelessWidget {
  const ThemeImage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(size.width * 0.05),
      height: size.width * 0.15,
      width: size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/thme.png'), fit: BoxFit.fill),
      ),
    );
  }
}
