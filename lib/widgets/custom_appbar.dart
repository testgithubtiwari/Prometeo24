import 'package:flutter/material.dart';
import 'package:prometeo/login_signup_new/login.dart';
// import 'package:prometeo/constants.dart';
// import 'package:prometeo/widgets/preregistration.dart';
// import 'package:prometeo/widgets/splash_screen.dart';

class CustomAppBar extends StatefulWidget {
  final bool isHomePage;
  const CustomAppBar({this.isHomePage = false, super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Icon(
              Icons.menu,
              size: size.width * 0.05,
              color: Colors.amberAccent,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: widget.isHomePage
                  ? Image.asset('assets/images/prometeo.png', fit: BoxFit.fill)
                  : Container(),
            ),
          ),
          GestureDetector(
              onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()))
                  },
              child: Icon(
                Icons.login,
                size: size.width * 0.05,
                color: Colors.amberAccent,
              )),
        ],
      ),
    );
  }
}
