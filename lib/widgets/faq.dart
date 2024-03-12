import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:prometeo/constants.dart';
import 'package:prometeo/widgets/faq_template.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  List<FAQItem> faqItems = [
    FAQItem(
      question: "What are the accommodation charges?",
      answer:
          "The accommodation charges and other important details will be notified by the PR team soon.",
    ),
    FAQItem(
      question:
          "Will all the team members be given accommodation at the same place?",
      answer: "We will try but there is no surety of the same.",
    ),
    FAQItem(
      question: "What kind of accommodation will be provided?",
      answer:
          "Accommodation will be provided on a shared basis inside campus hostels. One mattress, and enough space for keeping luggage, and other essential commodities will be provided. Girls and boys will be accommodated separately. Number of participants in a room will be decided and will be allotted by the Prometeo '24 team.",
    ),
    FAQItem(
      question: "Does the accommodation charges include food facilities too?",
      answer:
          "Yes, Food facilities are included in the accommodation charges and will be provided in the Hostel mess. Paid services such as food court, Shamiyana - Institute Cafe, and canteen are also available.",
    ),
    FAQItem(
      question: "Can I enter the IIT-J Campus anytime?",
      answer:
          "You can enter IIT Main gate anytime by showing valid photo ID proof and the registration ID (mail) during 6am to 10pm.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return faqItems.isEmpty
        ? Center(
            child: Text(
              'Coming Soon',
              style: GoogleFonts.poppins(
                  fontSize: size.width * 0.05, color: Colors.white),
            ),
          )
        : Column(
            children: faqItems.map((item) {
              // print(item.question.length);
              return Column(
                children: [
                  FAQTEMPELATE(question: item.question, answer: item.answer),
                  SizedBox(
                    height: size.width * 0.02,
                  ),
                ],
              );
            }).toList(),
          );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({
    required this.question,
    required this.answer,
  });
}
