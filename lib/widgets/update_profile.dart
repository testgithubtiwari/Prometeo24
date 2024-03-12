import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/pages/homepage.dart';
import 'package:prometeo/widgets/custom_appbar.dart';
import 'package:prometeo/widgets/nav_drawer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UpdateProfile extends StatefulWidget {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? city;
  final String? contact;
  final String? college;
  final String? referralcode;
  final bool? ambassador;
  final bool? accomodation;
  final String? year;

  const UpdateProfile({
    required this.id,
    required this.accomodation,
    required this.ambassador,
    required this.city,
    required this.college,
    required this.referralcode,
    required this.year,
    required this.contact,
    required this.firstName,
    required this.lastName,
    Key? key,
  }) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  bool isCaprogram = false;
  bool isAccomodation = false;
  String selectedYear = '';
  List<String> year = [
    'Select Year',
    "1st Year",
    "2nd Year",
    "3rd Year",
    "4th Year",
    "5th Year",
    "Graduated",
    "Faculty/Staff",
    "NA"
  ];

  String mapValueToYear(String selectedYear) {
    switch (selectedYear) {
      case '1':
        return '1st Year';
      case '2':
        return '2nd Year';
      case '3':
        return '3rd Year';
      case '4':
        return '4th Year';
      case '5':
        return '5th Year';
      case '6':
        return 'Graduated';
      case '7':
        return 'Faculty/Staff';
      case '8':
        return 'NA';
      default:
        return '';
    }
  }

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController collegeController = TextEditingController();
  final TextEditingController referralController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with the existing values
    selectedYear = mapValueToYear(widget.year!);
    firstNameController.text = widget.firstName!;
    lastNameController.text = widget.lastName!;
    cityController.text = widget.city!;
    contactController.text = widget.contact!;
    collegeController.text = widget.college!;
    isCaprogram = widget.ambassador!;
    isAccomodation = widget.accomodation!;
    referralController.text = widget.referralcode!;
  }

  String mapYearToValue(String selectedYear) {
    switch (selectedYear) {
      case '1st Year':
        return '1';
      case '2nd Year':
        return '2';
      case '3rd Year':
        return '3';
      case '4th Year':
        return '4';
      case '5th Year':
        return '5';
      case 'Graduated':
        return '6';
      case 'Faculty/Staff':
        return '7';
      case 'NA':
        return '8';
      default:
        return '';
    }
  }

  Future<void> Update() async {
    String firstname = firstNameController.text;
    String lastname = lastNameController.text;
    String _collegeName = collegeController.text;
    String _phoneNumber = contactController.text;
    String yearValue = mapYearToValue(selectedYear);
    bool isCAprogram = isCaprogram;
    bool isAccoModation = isAccomodation;
    String _referral = referralController.text;
    String _city = cityController.text;
    Map<dynamic, dynamic> requestPayload = {
      "first_name": firstname,
      "last_name": lastname,
      "college": _collegeName,
      "contact": _phoneNumber,
      "current_year": yearValue,
      "accommodation": isAccoModation,
      "ambassador": isCAprogram,
      "referral_code": _referral,
      "city": _city,
    };
    print(requestPayload);
    final baseUrl = 'https://apiv.prometeo.in/accounts/update/${widget.id}/';
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    try {
      // Make the PATCH request
      final response = await http.patch(
        Uri.parse(baseUrl),
        headers: headers,
        body: jsonEncode(requestPayload),
      );

      if (response.statusCode == 200) {
        // Handle successful response
        print('Update successful!');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Profile Updated Successfully!',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            dismissDirection: DismissDirection.up,
            duration: const Duration(milliseconds: 4000),
            backgroundColor: Color.fromARGB(94, 8, 8, 8),
            action: SnackBarAction(
              label: 'CLOSE',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              textColor: Color.fromARGB(150, 218, 214, 214),
            ),
            // behavior: SnackBarBehavior.floating,
          ),
        );

        await Future.delayed(const Duration(milliseconds: 1500));

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        // Handle error response
        print('Update failed with status code: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Update failed! Try again!',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            dismissDirection: DismissDirection.up,
            duration: const Duration(milliseconds: 4000),
            backgroundColor: Color.fromARGB(94, 8, 8, 8),
            action: SnackBarAction(
              label: 'CLOSE',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              textColor: Color.fromARGB(150, 218, 214, 214),
            ),
            // behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      // Handle exceptions
      print('Error during API call: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavDrawer(),
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/dash.png'),
              fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.width * 0.06,
              ),
              Container(
                // width: size.width * 0.80,
                margin: EdgeInsets.fromLTRB(
                    size.width * 0.02, 0, size.width * 0.02, 0),
                padding: EdgeInsets.all(size.width * 0.04),
                decoration: BoxDecoration(
                  color: Color.fromARGB(68, 0, 0, 0),
                  borderRadius: BorderRadius.circular(size.width * 0.04),
                ),
                child: const CustomAppBar(
                  isHomePage: true,
                ),
              ),
              SizedBox(
                height: size.width * 0.03,
              ),
              Text(
                'Update profile'.toUpperCase(),
                style: GoogleFonts.orbitron(
                  color: const Color.fromARGB(207, 255, 193, 7),
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: size.width * 0.06,
              ),
              Container(
                padding: EdgeInsets.all(size.width * 0.03),
                width: size.width * 0.90,
                height: size.height * 0.60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.05),
                  color: Color.fromARGB(125, 0, 0, 0),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.width * 0.03,
                      ),
                      CustomTextField(
                        keyboardType: TextInputType.name,
                        controller: firstNameController,
                        labelText: 'First Name',
                      ),
                      SizedBox(
                        height: size.width * 0.05,
                      ),
                      CustomTextField(
                        keyboardType: TextInputType.name,
                        controller: lastNameController,
                        labelText: 'Last Name',
                      ),
                      SizedBox(
                        height: size.width * 0.05,
                      ),
                      CustomTextField(
                        keyboardType: TextInputType.name,
                        controller: cityController,
                        labelText: 'City',
                      ),
                      SizedBox(
                        height: size.width * 0.05,
                      ),
                      CustomTextField(
                        keyboardType: TextInputType.phone,
                        controller: contactController,
                        labelText: 'Contact',
                      ),
                      SizedBox(
                        height: size.width * 0.05,
                      ),
                      CustomTextField(
                        keyboardType: TextInputType.name,
                        controller: collegeController,
                        labelText: 'College',
                      ),
                      SizedBox(
                        height: size.width * 0.05,
                      ),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(0, 59, 59, 59),
                            // prefixIcon: Icon(
                            //   Icons.keyboard_arrow_down,
                            //   size: size.width * 0.045,
                            // ),
                            suffixIcon: Icon(
                              Icons.keyboard_arrow_down,
                              size: size.width * 0.045,
                            ),
                            suffixIconColor: Colors.white,
                            // prefixIconColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.02),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(162, 157, 34, 168)))),
                        value: selectedYear,
                        dropdownColor: const Color.fromRGBO(42, 29, 61, 1),
                        elevation: 5,
                        isExpanded: true,
                        alignment: Alignment.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.035,
                          fontWeight: FontWeight.w500,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedYear = newValue!;
                          });
                        },
                        items: year.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                      ),
                      // SizedBox(
                      //   height: size.width * 0.05,
                      // ),
                      // CustomTextField(
                      //   keyboardType: TextInputType.name,
                      //   controller: referralController,
                      //   labelText: 'Referral Code(if any)',
                      // ),
                      // SizedBox(
                      //   height: size.width * 0.05,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: [
                      //     Checkbox(
                      //         value: isCaprogram,
                      //         fillColor:
                      //             MaterialStateProperty.resolveWith<Color>(
                      //           (Set<MaterialState> states) {
                      //             if (states.contains(MaterialState.selected)) {
                      //               return Colors
                      //                   .blue; // Color when the checkbox is selected (checked).
                      //             }
                      //             return Colors
                      //                 .white; // Color when the checkbox is unselected (unchecked).
                      //           },
                      //         ),
                      //         onChanged: (val) {
                      //           setState(() {
                      //             isCaprogram = val!;
                      //           });
                      //         }),
                      //     Expanded(
                      //       child: Text(
                      //         'I want to register for Campus Ambassador Program',
                      //         overflow: TextOverflow.ellipsis,
                      //         maxLines: 2,
                      //         style: GoogleFonts.poppins(
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.w600,
                      //             fontSize: size.width * 0.025),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: size.width * 0.02,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: [
                      //     Checkbox(
                      //         value: isAccomodation,
                      //         fillColor:
                      //             MaterialStateProperty.resolveWith<Color>(
                      //           (Set<MaterialState> states) {
                      //             if (states.contains(MaterialState.selected)) {
                      //               return Colors
                      //                   .blue; // Color when the checkbox is selected (checked).
                      //             }
                      //             return Colors
                      //                 .white; // Color when the checkbox is unselected (unchecked).
                      //           },
                      //         ),
                      //         onChanged: (val) {
                      //           setState(() {
                      //             isAccomodation = val!;
                      //           });
                      //         }),
                      //     Expanded(
                      //       child: Text(
                      //         "I would like to avail accommodation at IIT Jodhpur campus and agree to abide by the guidelines of the same",
                      //         overflow: TextOverflow.ellipsis,
                      //         maxLines: 4,
                      //         style: GoogleFonts.poppins(
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.w600,
                      //             fontSize: size.width * 0.025),
                      //         textAlign: TextAlign.justify,
                      //       ),
                      //     )
                      //   ],
                      // ),
                      SizedBox(
                        height: size.width * 0.06,
                      ),
                      Container(
                        height: size.height * 0.06,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.02),
                          color: const Color.fromRGBO(0, 94, 131, 1),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Update();
                          },
                          child: Text(
                            "Update".toUpperCase(),
                            style: GoogleFonts.orbitron(
                                color: Colors.white,
                                fontSize: size.width * 0.04,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.width * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;

  const CustomTextField({
    required this.controller,
    required this.labelText,
    required this.keyboardType,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          isFocused = hasFocus;
        });
      },
      child: TextField(
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.width * 0.040,
          fontWeight: FontWeight.w500,
        ),
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          labelText: widget.labelText.toUpperCase(),
          labelStyle: GoogleFonts.poppins(
            color: isFocused ? Colors.amberAccent : Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.04,
            fontWeight: FontWeight.w500,
          ),
          hintStyle: GoogleFonts.poppins(
              color: Colors.white, fontSize: size.width * 0.025),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(isFocused ? 15.0 : 8.0),
            borderSide: BorderSide(
              color: isFocused ? Colors.amberAccent : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
