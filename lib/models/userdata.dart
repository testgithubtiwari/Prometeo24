import 'package:flutter/material.dart';

class UserData {
  final String? name;
  final String? email;
  final String? college;
  final String? contact;
  final String? gender;
  final String? state;
  final String? city;

  UserData({
    required this.city,
    required this.college,
    required this.contact,
    required this.gender,
    required this.state,
    required this.name,
    required this.email,
  });
}

class UserDataProvider extends ChangeNotifier {
  UserData? userData;

  void setUserData(UserData data) {
    userData = data;
    notifyListeners();
  }
}
