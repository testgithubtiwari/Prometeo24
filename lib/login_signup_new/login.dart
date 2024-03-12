import 'dart:convert';

// import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:intl/intl.dart';
import 'package:prometeo/constants.dart';
import 'package:prometeo/login_signup_new/signup.dart';
// import 'package:prometeo/pages/campus_ambassador.dart';
// import 'package:prometeo/pages/homepage.dart';
// import 'package:prometeo/widgets/bottom_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:prometeo/widgets/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  // FlutterGifController? controller;
  final formKey = GlobalKey<FormState>();
  bool _isVisible = true;
  bool isTick1 = false;

  // ignore: unused_field
  String? _password, _email;

  void Login() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      formKey.currentState!.save();

      Map<dynamic, dynamic> requestPayload = {
        // "state": selectedState,
        "email": _email,
        "password": _password,
      };
      print(requestPayload);
      var url = Uri.parse(urlLoginMain);
      var response = await http.post(
        url,
        body: jsonEncode(requestPayload),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // var body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // print(body);
        // Registration success, show a success Snackbar
        // ignore: use_build_context_synchronously

        final Map<String, dynamic> responseData = json.decode(response.body);
        final String accessToken = responseData['access'];
        final String refreshToken = responseData['refresh'];
        await _saveTokenToPrefs(accessToken, refreshToken);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Login Successful!',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(164, 0, 0, 0),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            dismissDirection: DismissDirection.up,
            duration: const Duration(milliseconds: 2000),
            backgroundColor: Colors.white,
            action: SnackBarAction(
              label: 'CLOSE',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              textColor: Colors.red,
            ),
            // behavior: SnackBarBehavior.floating,
          ),
        );
        print(response.body);
        // Navigate to the home page
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DashBoard()),
        );
      } else if (response.statusCode == 401) {
        // Registration with an already used email
        // ignore: use_build_context_synchronously
        print('Invalid Credentials');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            // margin: EdgeInsets.all(10),
            content: Text(
              'Invalid Credentials',
              style: GoogleFonts.poppins(
                color: Color.fromARGB(248, 224, 12, 12),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            dismissDirection: DismissDirection.up,
            duration: const Duration(milliseconds: 2000),
            backgroundColor: Colors.white,
            action: SnackBarAction(
              label: 'CLOSE',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              textColor: const Color.fromARGB(144, 0, 0, 0),
            ),
            // behavior: SnackBarBehavior.floating,
          ),
        );
      } else {
        // Other server error, show an error Snackbar
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Login Failed! Please try again later',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(185, 244, 67, 54),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            dismissDirection: DismissDirection.up,
            duration: const Duration(milliseconds: 2000),
            backgroundColor: Colors.white,
            action: SnackBarAction(
              label: 'CLOSE',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              textColor: const Color.fromARGB(151, 0, 0, 0),
            ),
            // behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  Future<void> _saveTokenToPrefs(
      String accesstoken, String refreshToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accesstoken', accesstoken);
    await prefs.setString('refreshToken', refreshToken);
  }

  @override
  void initState() {
    super.initState();
    _checkForStoredToken();
  }

  Future<void> _checkForStoredToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString('accesstoken');
    final String? refeshToken = prefs.getString('refreshToken');
    print(accessToken);
    print("Refresh Token : ${refeshToken}");
    final Uri checkAccessTokenUri = Uri.parse(urlUserData);
    final Map<String, String> headers = {
      "Authorization": "Bearer $accessToken"
    };

    final http.Response response =
        await http.get(checkAccessTokenUri, headers: headers);

    if (response.statusCode == 200) {
      print("Access token is valid.");
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(
      //       'You are already Logged In!',
      //       style: GoogleFonts.poppins(
      //         color: Color.fromARGB(184, 14, 70, 122),
      //         fontSize: 16,
      //         fontWeight: FontWeight.w500,
      //       ),
      //     ),
      //     dismissDirection: DismissDirection.up,
      //     duration: const Duration(milliseconds: 4000),
      //     backgroundColor: Colors.white,
      //     action: SnackBarAction(
      //       label: 'CLOSE',
      //       onPressed: () {
      //         ScaffoldMessenger.of(context).hideCurrentSnackBar();
      //       },
      //       textColor: const Color.fromARGB(151, 0, 0, 0),
      //     ),
      //     // behavior: SnackBarBehavior.floating,
      //   ),
      // );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashBoard()),
      );
    } else {
      print("Access token is invalid or expired.");
      final String refreshToken = refeshToken!;
      final Uri refreshUri = Uri.parse(urlTokenRefresh);
      final Map<String, String> refreshHeaders = {
        "Content-Type": "application/json"
      };
      final Map<String, String> refreshData = {"refresh": refreshToken};
      final http.Response refreshResponse = await http.post(
        refreshUri,
        headers: refreshHeaders,
        body: jsonEncode(refreshData),
      );

      if (refreshResponse.statusCode == 200) {
        // If refresh is successful, update the access token
        final Map<String, dynamic> responseData =
            jsonDecode(refreshResponse.body);
        final String newAccessToken = responseData["access"];
        final String newRefreshToken = responseData['refresh'];
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('accesstoken', newAccessToken);
        await prefs.setString('refreshToken', newRefreshToken);
        print("Access token refreshed successfully.");
        print("New Access Token: $newAccessToken");
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text(
        //       'You are already Logged In!',
        //       style: GoogleFonts.poppins(
        //         color: const Color.fromARGB(185, 244, 67, 54),
        //         fontSize: 16,
        //         fontWeight: FontWeight.w500,
        //       ),
        //     ),
        //     dismissDirection: DismissDirection.up,
        //     duration: const Duration(milliseconds: 4000),
        //     backgroundColor: Colors.white,
        //     action: SnackBarAction(
        //       label: 'CLOSE',
        //       onPressed: () {
        //         ScaffoldMessenger.of(context).hideCurrentSnackBar();
        //       },
        //       textColor: const Color.fromARGB(151, 0, 0, 0),
        //     ),
        //     // behavior: SnackBarBehavior.floating,
        //   ),
        // );
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DashBoard()));
      } else {
        // If refresh token is expired or invalid
        print("Unable to refresh access token.");
        final Map<String, dynamic> errorResponse =
            jsonDecode(refreshResponse.body);
        print(errorResponse);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Please Log in again',
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
    }
  }

  googleLogin() async {
    print("googleLogin method Called");
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      var result = await googleSignIn.signIn();
      if (result == null) {
        return;
      }
      final userData = await result.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
          await FirebaseAuth.instance.signInWithCredential(credential);

      await postUserData(
          finalResult.user?.email, finalResult.user?.displayName);
      print("Result $finalResult");
      print(finalResult.user?.displayName);
      print(finalResult.user?.email);
      print(finalResult.user?.photoURL);
    } catch (error) {
      print(error);
    }
  }

  Future<void> postUserData(String? email, String? name) async {
    if (email != null && name != null) {
      Map<String, dynamic> requestPayload = {
        "email": email,
        "given_name": name,
      };

      print(requestPayload);
      var url = Uri.parse(urlgoogle_login);
      var response = await http.post(
        url,
        body: jsonEncode(requestPayload),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        // print(body);
        // Registration success, show a success Snackbar
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Login Successful!',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(164, 0, 0, 0),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            dismissDirection: DismissDirection.up,
            duration: const Duration(milliseconds: 2000),
            backgroundColor: Colors.white,
            action: SnackBarAction(
              label: 'CLOSE',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              textColor: Colors.red,
            ),
            // behavior: SnackBarBehavior.floating,
          ),
        );

        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final String newAccessToken = responseData["access_token"];
        print(newAccessToken);
        final String newRefreshToken = responseData['refresh_token'];
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('accesstoken', newAccessToken);
        await prefs.setString('refreshToken', newRefreshToken);

        await Future.delayed(const Duration(seconds: 1));

        // Navigate to the home page
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashBoard()),
        );
      } else {
        // Other server error, show an error Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Unable to login. Please try again!',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(164, 0, 0, 0),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            dismissDirection: DismissDirection.up,
            duration: const Duration(milliseconds: 2000),
            backgroundColor: Colors.white,
            action: SnackBarAction(
              label: 'CLOSE',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              textColor: Colors.red,
            ),
            // behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
                        // controller: controller!,
                        prometeoLogo,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.03,
                    ),
                    Text(
                      'Login to your account',
                      style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.01,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account yet?",
                            style: GoogleFonts.poppins(
                              color: Colors.grey[500],
                              fontSize: size.width * 0.025,
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
                                      builder: (context) => const SignUp()));
                            },
                            child: Text(
                              'SignUp',
                              style: GoogleFonts.poppins(
                                  color: Colors.blue,
                                  fontSize: size.width * 0.030,
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
                                    return "Please fill the details";
                                  } else {
                                    if (!RegExp(r'[0-9]').hasMatch(value)) {
                                      return "One Numeric value required";
                                    } else {
                                      return null;
                                    }
                                  }
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
                        ],
                      ),
                    ),
                    // SizedBox(height: size.height * 0.005),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Checkbox(
                    //           value: isTick1,
                    //           fillColor:
                    //               MaterialStateProperty.resolveWith<Color>(
                    //             (Set<MaterialState> states) {
                    //               if (states.contains(MaterialState.selected)) {
                    //                 return Colors
                    //                     .blue; // Color when the checkbox is selected (checked).
                    //               }
                    //               return Colors
                    //                   .white; // Color when the checkbox is unselected (unchecked).
                    //             },
                    //           ),
                    //           onChanged: (val) {
                    //             setState(() {
                    //               isTick1 = val!;
                    //             });
                    //           },
                    //         ),
                    //         Text(
                    //           "Remember me",
                    //           style: GoogleFonts.poppins(
                    //               color: Colors.white,
                    //               fontSize: size.width * 0.018),
                    //         ),
                    //       ],
                    //     ),
                    //     Text(
                    //       'Forgot your password?',
                    //       style: GoogleFonts.poppins(
                    //           color: Colors.blue,
                    //           fontSize: size.width * 0.025,
                    //           fontWeight: FontWeight.w700),
                    //     )
                    //   ],
                    // ),
                    SizedBox(
                      height: size.width * 0.045,
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
                          Login();
                        },
                        child: Text(
                          'Login'.toUpperCase(),
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: size.width * 0.04,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.045,
                    ),
                    Text(
                      'Or'.toUpperCase(),
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: size.width * 0.040,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // SizedBox(
                    //   height: size.width * 0.025,
                    // ),
                    TextButton(
                      onPressed: () {
                        googleLogin();
                      },
                      child: Container(
                        height: size.width * 0.10,
                        width: size.width * 0.10,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/google.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: NavBar(currentIndex: 3),
    );
  }
}
