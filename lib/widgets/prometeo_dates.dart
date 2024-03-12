import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrometeoDates extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  PrometeoDates({Key? key});

  @override
  State<PrometeoDates> createState() => _PrometeoDatesState();
}

class _PrometeoDatesState extends State<PrometeoDates> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          Flexible(
            child: Stack(children: [
              Container(
                height: size.width * 0.10,
                padding: EdgeInsets.all(size.width * 0.02),
                decoration: BoxDecoration(
                  color: const Color(0xff179F97).withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(size.width * 0.02),
                    bottomLeft: Radius.circular(size.width * 0.02),
                  ),
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: size.width * 0.04,
                      ),
                      SizedBox(
                        width: size.width * 0.02, // Responsive spacing
                      ),
                      Expanded(
                        child: Text(
                          'IIT JODHPUR',
                          style: GoogleFonts.orbitron(
                            color: Colors.white,
                            fontSize: size.width * 0.025,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          Flexible(
            child: Container(
              height: size.width * 0.10,
              padding: EdgeInsets.all(size.width * 0.02), // Responsive padding
              decoration: BoxDecoration(
                color: const Color(0xff96FFDF).withOpacity(0.3),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(size.width * 0.02),
                  topRight: Radius.circular(size.width * 0.02),
                ),
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                      size: size.width * 0.04,
                    ),
                    SizedBox(
                      width: size.width * 0.02, // Responsive spacing
                    ),
                    Expanded(
                      child: Text(
                        '19-21nd JAN',
                        style: GoogleFonts.orbitron(
                          color: Colors.white,
                          fontSize: size.width * 0.025,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
