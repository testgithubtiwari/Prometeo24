import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/constants.dart';
import 'package:prometeo/login_signup_new/userdetails.dart';
import 'package:prometeo/login_signup_new/login.dart';
// import 'package:prometeo/widgets/bottom_nav_bar.dart';
// import 'package:provider/provider.dart';
// import 'package:prometeo/models/userdata.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  bool _isVisible = true;
  bool isTick1 = false;

  // ignore: unused_field
  String? _password, _email, _firstName, _lastName, _confirmPassword;
  @override
  Widget build(BuildContext context) {
    // final userDataProvider =
    //     Provider.of<UserDataProvider>(context, listen: false);
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: size.width * 0.04,
                  // ),
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
                    'Create an account',
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
                                  _firstName = value;
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
                                  hintText: 'First Name',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.03,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person,
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
                                  return "Please fill the Details";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _lastName = value;
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
                                  hintText: 'Last Name',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.03,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person,
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
                                  hintText: 'Email Address',
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
                              autocorrect: false,
                              style: const TextStyle(color: Colors.white),
                              obscureText: _isVisible,
                              enableSuggestions: false,
                              cursorColor: Colors.white,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please fill the password";
                                  // if (!RegExp(r'[0-9]').hasMatch(value)) {
                                  //   return "Password must contain 8 character\nOne Numeric value required";
                                  // } else {
                                  //   return "Password must contain 8 character";
                                  // }
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _password = value;
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
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.03,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    size: size.width * 0.045,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                      });
                                    },
                                    icon: _isVisible
                                        ? Icon(
                                            Icons.visibility_off,
                                            color: Colors.grey.shade500,
                                          )
                                        : const Icon(
                                            Icons.visibility,
                                            color: Colors.white,
                                          ),
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
                              autocorrect: false,
                              style: const TextStyle(color: Colors.white),
                              obscureText: _isVisible,
                              enableSuggestions: false,
                              cursorColor: Colors.white,
                              validator: (value) {
                                if (value!.isEmpty || value != _password) {
                                  return "Password do not match";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _confirmPassword = value;
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
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.03,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    size: size.width * 0.045,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                      });
                                    },
                                    icon: _isVisible
                                        ? Icon(
                                            Icons.visibility_off,
                                            color: Colors.grey.shade500,
                                          )
                                        : const Icon(
                                            Icons.visibility,
                                            color: Colors.white,
                                          ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          size.width * 0.03),
                                      borderSide: BorderSide(
                                          color: Colors.blue.shade400))),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.055,
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width * 0.02),
                      color: Color.fromRGBO(129, 9, 135, 1),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // userDataProvider.setUserData(
                          //   UserData(
                          //     name: _name,
                          //     email: _email,

                          //   ),
                          // );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserDetails(
                                    email: _email!,
                                    password: _password!,
                                    firstName: _firstName!,
                                    lastName: _lastName!)),
                          );
                        }
                      },
                      child: Text(
                        'Next',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: size.width * 0.03,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      // bottomNavigationBar: NavBar(currentIndex: 3),
    );
  }
}
