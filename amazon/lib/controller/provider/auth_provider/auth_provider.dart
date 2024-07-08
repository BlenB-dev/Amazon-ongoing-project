import 'package:flutter/material.dart';

class Authprovider extends ChangeNotifier {
  String phoneNumber = '';
  String verificationId = '';
  String otp = '';
  // bool _isSignedIn = false;
  // bool get isSignedIn => _isSignedIn;
  // bool _isLoading = false;
  // bool get isLoading => _isLoading;
  String? _uid;
  String get uid => _uid!;

  upDatePhoneNum({required String num}) {
    phoneNumber = num;
    notifyListeners();
  }

  upDateverificationId({required String verID}) {
    verificationId = verID;
    notifyListeners();
  }
}
