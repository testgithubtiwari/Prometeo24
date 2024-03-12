import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/constants.dart';
import 'package:prometeo/widgets/umang_page.dart';

class ShortPrernaDesc extends StatefulWidget {
  const ShortPrernaDesc({super.key});

  @override
  State<ShortPrernaDesc> createState() => _ShortPrernaDescState();
}

class _ShortPrernaDescState extends State<ShortPrernaDesc> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(size.width * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 0.02),
        border: Border.all(width: 1, color: Colors.amberAccent),
        color: const Color.fromARGB(181, 33, 149, 243),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 6),
            blurRadius: 6,
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              shortPrernaDesc,
              textAlign: TextAlign.justify,
              maxLines: 3,
              style: GoogleFonts.poppins(
                  fontSize: size.width * 0.02,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            width: size.width * 0.01,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const UmangPage()));
            },
            child: Text(
              'Read More',
              style: GoogleFonts.poppins(
                  fontSize: size.width * 0.03, color: Colors.amberAccent),
            ),
          )
        ],
      ),
    );
  }
}
