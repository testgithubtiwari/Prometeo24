import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/login_signup_new/login.dart';
// import 'package:prometeo/login_signup_new/login.dart';
// import 'package:prometeo/widgets/preregistration.dart';
// import 'package:prometeo/widgets/splash_screen.dart';

class PreregisterImage extends StatefulWidget {
  const PreregisterImage({super.key});

  @override
  State<PreregisterImage> createState() => _PreregisterImageState();
}

class _PreregisterImageState extends State<PreregisterImage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Login()));
      },
      child: Container(
        height: size.width * 0.23,
        width: size.width * 0.70,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/register.jpg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
