import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:floating_snackbar/floating_snackbar.dart';

// ignore: must_be_immutable
class RuleBook extends StatefulWidget {
  String ruleBookLink;
  RuleBook({required this.ruleBookLink, super.key});

  @override
  State<RuleBook> createState() => _RuleBookState();
}

class _RuleBookState extends State<RuleBook> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.width * 0.09,
        ),
        Container(
          width: size.width * 0.9,
          height: size.height / 14,
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
          ),
          child: TextButton(
            onPressed: () async {
              Uri url = Uri.parse(widget.ruleBookLink);
              try {
                if (await canLaunchUrl(url)) {
                  await launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  );
                } else {
                  throw "Could not launch $url['url']";
                }
              } catch (e) {
                // Handle the exception here, and show an error toast to the user.
                // ignore: use_build_context_synchronously
                FloatingSnackBar(
                  message: "Error: $e",
                  context: context,
                  textColor: Colors.black,
                  textStyle: const TextStyle(color: Colors.red),
                  duration: const Duration(milliseconds: 2000),
                  backgroundColor: Colors.white,
                );
              }
            },
            child: Text(
              "Open Rule Book",
              style: GoogleFonts.orbitron(
                color: Colors.white,
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }
}
