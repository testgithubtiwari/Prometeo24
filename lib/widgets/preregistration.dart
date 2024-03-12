import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:prometeo/constants.dart';
import 'dart:convert';
import 'package:prometeo/pages/homepage.dart';
// import 'package:prometeo/widgets/bottom_nav_bar.dart';
import 'package:floating_snackbar/floating_snackbar.dart';

class PreRegistration extends StatefulWidget {
  const PreRegistration({super.key});

  @override
  State<PreRegistration> createState() => _PreRegistrationState();
}

class _PreRegistrationState extends State<PreRegistration> {
  final formKey = GlobalKey<FormState>();
  bool isCAprogram = false;
  String? _name,
      _email,
      _phone,
      _year = 'Select Year',
      _state = 'Select State',
      // ignore: prefer_final_fields
      _gender = 'Select Gender',
      _city,
      _college,
      _ca = 'Apply for Campus Ambassador?';

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

  String mapcabooltoyes(bool ca) {
    switch (ca) {
      // ignore: constant_pattern_never_matches_value_type
      case true:
        return "Yes";
      // ignore: constant_pattern_never_matches_value_type
      case false:
        return "No";
      default:
        return "Unknown";
    }
  }

  var yearItems = [
    'Select Year',
    '1st Year',
    "2nd Year",
    "3rd Year",
    "4th Year",
    "5th Year",
    "Graduated",
    "Faculty/Staff",
    "NA"
  ];

  var caItems = ['Apply for Campus Ambassador?', 'Yes', 'No'];

  var genderItems = ['Select Gender', 'Male', 'Female', 'Not Say', 'Other'];

  var stateIitems = [
    'Select State',
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Lakshadweep",
    "Puducherry"
  ];

  void register() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      if (_year == 'Select Year') {
        FloatingSnackBar(
          message: 'Please select the correct year!',
          context: context,
          textColor: Colors.black,
          textStyle: const TextStyle(color: Colors.red),
          duration: const Duration(milliseconds: 2000),
          backgroundColor: Colors.white,
        );
      } else if (_state == 'Select State') {
        FloatingSnackBar(
          message: 'Please select the correct state!',
          context: context,
          textColor: Colors.black,
          textStyle: const TextStyle(color: Colors.red),
          duration: const Duration(milliseconds: 2000),
          backgroundColor: Colors.white,
        );
      } else if (_gender == 'Select Gender') {
        FloatingSnackBar(
          message: 'Please select the Gender',
          context: context,
          textColor: Colors.black,
          textStyle: const TextStyle(color: Colors.red),
          duration: const Duration(milliseconds: 2000),
          backgroundColor: Colors.white,
        );
      } else if (_ca == 'Apply for Campus Ambassador?') {
        FloatingSnackBar(
          message: 'Please choose the right for Campus Ambassador',
          context: context,
          textColor: Colors.black,
          textStyle: const TextStyle(color: Colors.red),
          duration: const Duration(milliseconds: 2000),
          backgroundColor: Colors.white,
        );
      } else {
        formKey.currentState!.save();
        String yearValue = mapYearToValue(_year!);
        Map<String, dynamic> requestPayload = {
          "email": _email,
          "name": _name,
          "college": _college,
          "contact": _phone,
          "year": yearValue,
          "state": _state,
          "city": _city,
          "gender": _gender,
          "ca": _ca,
        };
        // ignore: avoid_print
        print(requestPayload);
        var url = Uri.parse(urlPreregisterMain);
        var response = await http.post(
          url,
          body: jsonEncode(requestPayload),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );
        Map<String, dynamic> responseBody = json.decode(response.body);
        String message = responseBody['Message'];
        // var body = jsonDecode(response.body);
        if (message == 'Successfully PreRegistered') {
          // print(body);
          // Registration success, show a success Snackbar
          // ignore: use_build_context_synchronously
          FloatingSnackBar(
            message: 'Pre-Registration Successful!',
            context: context,
            textColor: Colors.black,
            textStyle: const TextStyle(color: Colors.red),
            duration: const Duration(milliseconds: 2000),
            backgroundColor: Colors.white,
          );
          // Navigate to the home page
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else if (message ==
            'PreRegistration already exists with this Email') {
          // Registration with an already used email
          // ignore: use_build_context_synchronously
          FloatingSnackBar(
            message: 'Email is already registered!',
            context: context,
            textColor: Colors.black,
            textStyle: const TextStyle(color: Colors.red),
            duration: const Duration(milliseconds: 2000),
            backgroundColor: Colors.white,
          );
        } else {
          // Other server error, show an error Snackbar
          // ignore: use_build_context_synchronously
          FloatingSnackBar(
            message: 'Pre-Registration failed! Try again',
            context: context,
            textColor: Colors.black,
            textStyle: const TextStyle(color: Colors.red),
            duration: const Duration(milliseconds: 2000),
            backgroundColor: Colors.white,
          );
        }
      }
    }
  }

  RegExp phoneRegExp = RegExp(r'^[0-9]{10}$');

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // print(size.width);
    // print(size.height);
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        // color: const Color.fromRGBO(42, 29, 61, 1),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/prere.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Container(
            width: size.width,
            height: size.width * 1.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.width * 0.015),
              color: const Color.fromRGBO(42, 29, 61, 1),
              border: Border.all(width: 1, color: Colors.blue),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 6),
                  blurRadius: 8,
                  spreadRadius: 1,
                )
              ],
            ),
            padding: EdgeInsets.all(size.width * 0.06),
            margin: EdgeInsets.only(
              // top: size.width * 0.20,
              left: size.width * 0.05,
              right: size.width * 0.05,
              bottom: size.width * 0.20,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Pre-Registration',
                          style: GoogleFonts.orbitron(
                              color: Colors.amberAccent,
                              fontSize: size.width * 0.045,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      SizedBox(width: size.width * 0.015),
                      SizedBox(
                        width: size.width * 0.06,
                        // height: size.width*0.10,
                        child: Image.asset(
                          prometeoLogo,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.width * 0.05,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(children: [
                          Flexible(
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              autocorrect: true,
                              obscureText: false,
                              enableSuggestions: true,
                              cursorColor: Colors.white,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please fill the Details";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _name = value;
                                });
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(59, 59, 59, 0.7),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.02),
                                ),
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * 0.03,
                                ),
                                prefixIcon: Icon(
                                  Icons.person_add,
                                  size: size.width * 0.045,
                                  color: Colors.white,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.03),
                                  borderSide:
                                      BorderSide(color: Colors.blue.shade400),
                                ),
                              ),
                            ),
                          )
                        ]),
                        SizedBox(
                          height: size.width * 0.028,
                        ),
                        Row(children: [
                          Flexible(
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              autocorrect: true,
                              obscureText: false,
                              enableSuggestions: true,
                              cursorColor: Colors.white,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please fill the Details";
                                } else if (!RegExp(
                                        r'^[\w-\.]+@([\w-\.]+[\w]{2,4})')
                                    .hasMatch(value)) {
                                  return 'Please fill the valid Email';
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                setState(() {
                                  _email = value;
                                });
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(59, 59, 59, 0.7),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        size.width * 0.02),
                                  ),
                                  hintText: 'Email-Id',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.03,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.email_rounded,
                                    size: size.width * 0.045,
                                    color: Colors.white,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue.shade400))),
                            ),
                          )
                        ]),
                        SizedBox(
                          height: size.width * 0.028,
                        ),
                        Row(children: [
                          Flexible(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: Colors.white),
                              autocorrect: true,
                              obscureText: false,
                              enableSuggestions: true,
                              cursorColor: Colors.white,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please fill the Details";
                                } else if (!phoneRegExp.hasMatch(value)) {
                                  return "Please fill the correct Details";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                setState(() {
                                  _phone = value;
                                });
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(59, 59, 59, 0.7),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        size.width * 0.02),
                                  ),
                                  hintText: 'Conatct',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.03,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.call,
                                    size: size.width * 0.045,
                                    color: Colors.white,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue.shade400))),
                            ),
                          )
                        ]),
                        SizedBox(
                          height: size.width * 0.028,
                        ),
                        Row(children: [
                          Flexible(
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              autocorrect: true,
                              obscureText: false,
                              enableSuggestions: true,
                              cursorColor: Colors.white,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please fill the Details!";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                setState(() {
                                  _college = value;
                                });
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(59, 59, 59, 0.7),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        size.width * 0.02),
                                  ),
                                  hintText: 'College Name',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.03,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.school,
                                    size: size.width * 0.045,
                                    color: Colors.white,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue.shade400))),
                            ),
                          )
                        ]),
                        SizedBox(
                          height: size.width * 0.028,
                        ),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(59, 59, 59, 0.7),
                              prefixIcon: Icon(
                                Icons.keyboard_arrow_down,
                                size: size.width * 0.045,
                              ),
                              prefixIconColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.02),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue.shade400))),
                          dropdownColor: const Color.fromRGBO(42, 29, 61, 1),
                          elevation: 5,
                          value: _year,
                          isExpanded: true,
                          alignment: Alignment.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.03,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _year = newValue!;
                            });
                          },
                          items: yearItems.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: size.width * 0.028,
                        ),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(59, 59, 59, 0.7),
                              prefixIcon: Icon(
                                Icons.keyboard_arrow_down,
                                size: size.width * 0.045,
                              ),
                              prefixIconColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.02),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue.shade400))),
                          value: _state,
                          dropdownColor: const Color.fromRGBO(42, 29, 61, 1),
                          elevation: 5,
                          isExpanded: true,
                          alignment: Alignment.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: size.width * 0.03),
                          onChanged: (String? newValue) {
                            setState(() {
                              _state = newValue!;
                            });
                          },
                          items: stateIitems.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: size.width * 0.028,
                        ),
                        Row(children: [
                          Flexible(
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              autocorrect: true,
                              obscureText: false,
                              enableSuggestions: true,
                              cursorColor: Colors.white,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please fill the Details!";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                setState(() {
                                  _city = value;
                                });
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(59, 59, 59, 0.7),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        size.width * 0.02),
                                  ),
                                  hintText: 'City',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.03,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.location_city,
                                    size: size.width * 0.045,
                                    color: Colors.white,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue.shade400))),
                            ),
                          )
                        ]),
                        SizedBox(
                          height: size.width * 0.028,
                        ),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(59, 59, 59, 0.7),
                              prefixIcon: Icon(
                                Icons.keyboard_arrow_down,
                                size: size.width * 0.045,
                              ),
                              prefixIconColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.02),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue.shade400))),
                          value: _gender,
                          dropdownColor: const Color.fromRGBO(42, 29, 61, 1),
                          elevation: 5,
                          isExpanded: true,
                          alignment: Alignment.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: size.width * 0.03),
                          onChanged: (String? newValue) {
                            setState(() {
                              _gender = newValue!;
                            });
                          },
                          items: genderItems.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: size.width * 0.028,
                        ),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(59, 59, 59, 0.7),
                              prefixIcon: Icon(
                                Icons.keyboard_arrow_down,
                                size: size.width * 0.045,
                              ),
                              prefixIconColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.02),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue.shade400))),
                          value: _ca,
                          dropdownColor: const Color.fromRGBO(42, 29, 61, 1),
                          elevation: 5,
                          isExpanded: true,
                          alignment: Alignment.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: size.width * 0.03),
                          onChanged: (String? newValue) {
                            setState(() {
                              _ca = newValue!;
                            });
                          },
                          items: caItems.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: size.width * 0.10,
                        ),
                        Container(
                          height: size.height * 0.06,
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.03),
                            color: Color.fromRGBO(129, 9, 135, 1),
                          ),
                          child: TextButton(
                            onPressed: () {
                              // print('I am Pressed');
                              register();
                            },
                            child: Text(
                              "REGISTER",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.03,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // bottomNavigationBar: NavBar(
      //   currentIndex: -1,
      // ),
    );
  }
}
