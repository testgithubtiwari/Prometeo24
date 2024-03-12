import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/constants.dart';
import 'package:prometeo/login_signup_new/login.dart';
import 'package:prometeo/pages/homepage.dart';
// import 'package:prometeo/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:prometeo/models/userdata.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserDetails extends StatefulWidget {
  final String firstName, lastName, email, password;
  const UserDetails({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    // required this.name,
    super.key,
  });

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final formKey = GlobalKey<FormState>();

  String? _phoneNumber, _collegeName, _referral = "";
  bool isAccomodation = false;
  bool isCAprogram = false;
  // ignore: unused_field
  String? _city, _secondaryEmail;
  String selectedGender = 'Gender';
  String selectedYear = 'Select Year';
  String selectedState = 'Select State';
  List<String> gender = ['Gender', 'Male', 'Female', 'Not Say', 'Other'];
  List<String> year = [
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

  List<String> state = [
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

  void register(String? firstname, String? lastname, String? email,
      String? password, UserDataProvider userdataProvider) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      // List<String> nameParts = name!.split(' ');
      // String firstName = nameParts[0];
      // String lastName = nameParts.length > 1 ? nameParts[1] : '';
      if (selectedGender == 'Gender') {
        FloatingSnackBar(
          message: 'Please select the Gender!',
          context: context,
          textColor: Colors.black,
          textStyle: const TextStyle(color: Colors.red),
          duration: const Duration(milliseconds: 2000),
          backgroundColor: Colors.white,
        );
      } else if (selectedYear == 'Select Year') {
        FloatingSnackBar(
          message: 'Please select the Year!',
          context: context,
          textColor: Colors.black,
          textStyle: const TextStyle(color: Colors.red),
          duration: const Duration(milliseconds: 2000),
          backgroundColor: Colors.white,
        );
      } else if (selectedState == 'Select State') {
        FloatingSnackBar(
          message: 'Please select the State!',
          context: context,
          textColor: Colors.black,
          textStyle: const TextStyle(color: Colors.red),
          duration: const Duration(milliseconds: 2000),
          backgroundColor: Colors.white,
        );
      } else {
        formKey.currentState!.save();
        String yearValue = mapYearToValue(selectedYear);

        Map<dynamic, dynamic> requestPayload = {
          // "state": selectedState,
          "email": email,
          "first_name": firstname,
          "last_name": lastname,
          "college": _collegeName,
          "contact": _phoneNumber,
          "current_year": yearValue,
          "password": password,
          "gender": selectedGender,
          "accommodation": isAccomodation,
          "ambassador": isCAprogram,
          "referral_code": _referral,
          "secondaryEmail": _secondaryEmail,
          "city": _city,
        };
        print(requestPayload);
        var url = Uri.parse(urlRegisterMain);
        var response = await http.post(
          url,
          body: jsonEncode(requestPayload),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );

        // var body = jsonDecode(response.body);
        if (response.statusCode == 201) {
          // print(body);
          // Registration success, show a success Snackbar
          // ignore: use_build_context_synchronously
          FloatingSnackBar(
            message: 'Registration Successful!',
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
        } else if (response.statusCode == 409) {
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
            message: 'Registration failed! Try again',
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
    var userDataProvider = Provider.of<UserDataProvider>(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(preregistrationbackground),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
            child: Container(
          width: size.width,
          height: size.width * 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * 0.02),
            color: const Color.fromRGBO(42, 29, 61, 1),
            border: Border.all(width: 1, color: Colors.blue),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 6),
                blurRadius: 8,
                spreadRadius: 0,
              )
            ],
          ),
          padding: EdgeInsets.all(size.width * 0.05),
          margin: EdgeInsets.only(
            //   top: size.width * 0.20,
            left: size.width * 0.05,
            right: size.width * 0.05,
            bottom: size.width * 0.20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: size.width * 0.09,
                  child: Image.asset(
                    prometeoLogo,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: size.width * 0.03,
                ),
                Text(
                  'Fill Your Details',
                  style: GoogleFonts.orbitron(
                      color: Colors.white,
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: size.width * 0.01,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: GoogleFonts.poppins(
                          color: Colors.grey[500],
                          fontSize: size.width * 0.02,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.005,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                              color: Colors.blue,
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.width * 0.03,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
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
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _phoneNumber = value;
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
                                    borderRadius: BorderRadius.circular(
                                        size.width * 0.03),
                                    borderSide: BorderSide(
                                        color: Colors.blue.shade400))),
                          ),
                        )
                      ]),
                      SizedBox(height: size.width * 0.030),
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
                                _collegeName = value;
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
                                    borderRadius: BorderRadius.circular(
                                        size.width * 0.03),
                                    borderSide: BorderSide(
                                        color: Colors.blue.shade400))),
                          ),
                        )
                      ]),
                      SizedBox(height: size.width * 0.030),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(59, 59, 59, 0.7),
                            prefixIcon: Icon(
                              Icons.category,
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
                        value: selectedGender,
                        isExpanded: true,
                        alignment: Alignment.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.03,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedGender = newValue!;
                          });
                        },
                        items: gender.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: size.width * 0.030),
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
                        value: selectedYear,
                        dropdownColor: const Color.fromRGBO(42, 29, 61, 1),
                        elevation: 5,
                        isExpanded: true,
                        alignment: Alignment.center,
                        style: TextStyle(
                            color: Colors.white, fontSize: size.width * 0.03),
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
                      SizedBox(height: size.width * 0.030),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(59, 59, 59, 0.7),
                            prefixIcon: Icon(
                              Icons.location_on,
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
                        value: selectedState,
                        isExpanded: true,
                        alignment: Alignment.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.03,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedState = newValue!;
                          });
                        },
                        items: state.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: size.width * 0.030),
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
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.02),
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
                      SizedBox(height: size.width * 0.030),
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
                                _secondaryEmail = value;
                              });
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(59, 59, 59, 0.7),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.02),
                              ),
                              hintText: 'Secondary Email',
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
                                borderSide:
                                    BorderSide(color: Colors.blue.shade400),
                              ),
                            ),
                          ),
                        )
                      ]),
                      SizedBox(height: size.width * 0.030),
                      Row(children: [
                        Flexible(
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            autocorrect: true,
                            obscureText: false,
                            enableSuggestions: true,
                            cursorColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                _referral = value;
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
                                hintText: 'Referral Code (if any?)',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * 0.03,
                                ),
                                prefixIcon: Icon(
                                  Icons.people_sharp,
                                  size: size.width * 0.045,
                                  color: Colors.white,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue.shade400))),
                          ),
                        )
                      ]),
                      SizedBox(height: size.width * 0.025),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                              value: isCAprogram,
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Colors
                                        .blue; // Color when the checkbox is selected (checked).
                                  }
                                  return Colors
                                      .white; // Color when the checkbox is unselected (unchecked).
                                },
                              ),
                              onChanged: (val) {
                                setState(() {
                                  isCAprogram = val!;
                                });
                              }),
                          Expanded(
                            child: Text(
                              'I want to register for Campus Ambassador Program',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: size.width * 0.021),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: size.width * 0.020),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                              value: isAccomodation,
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Colors
                                        .blue; // Color when the checkbox is selected (checked).
                                  }
                                  return Colors
                                      .white; // Color when the checkbox is unselected (unchecked).
                                },
                              ),
                              onChanged: (val) {
                                setState(() {
                                  isAccomodation = val!;
                                });
                              }),
                          Expanded(
                            child: Text(
                              "I would like to avail accommodation at IIT Jodhpur campus and agree to abide by the guidelines of the same",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: size.width * 0.021),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.width * 0.055,
                      ),
                      Container(
                        width: size.width,
                        height: size.height * 0.06,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.02),
                          color: Color.fromRGBO(129, 9, 135, 1),
                        ),
                        child: TextButton(
                          onPressed: () {
                            register(
                              widget.firstName,
                              widget.lastName,
                              widget.email,
                              widget.password,
                              userDataProvider,
                            );
                          },
                          child: Text(
                            'Register',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      ),
      // bottomNavigationBar: NavBar(currentIndex: 3),
    );
  }
}
