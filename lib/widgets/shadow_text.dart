import 'package:flutter/material.dart';

class ShadowTextWidget extends StatelessWidget {
  final String text;
  final double size;
  final TextStyle style;

  const ShadowTextWidget({
    super.key,
    required this.text,
    required this.size,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // Center the children within the stack
      children: <Widget>[
        // Shadow Text
        Container(
          margin: const EdgeInsets.only(
            bottom: 2.5,
          ),
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: style.copyWith(
              fontSize: size * 1.15,
              color: const Color.fromARGB(108, 117, 117, 117),
            ),
          ),
        ),
        // Main Text (centered slightly below)
        FractionalTranslation(
          translation: const Offset(0, 0.25), // Adjust the vertical position
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: style.copyWith(fontSize: size),
          ),
        ),
      ],
    );
  }
}
