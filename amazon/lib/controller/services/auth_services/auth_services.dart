import 'dart:developer';

import 'package:amazon/view/auth_screen/sign_inlogic.dart';

import 'package:amazon/view/auth_screen/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider/auth_provider.dart';

class AuthServices {
  static bool checkAuthentication() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      return true;
    }
    return false;
  }

  static receiveOTP(
      {required BuildContext context, required String mobileNo}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: mobileNo,
        verificationCompleted: (PhoneAuthCredential credential) {
          log(credential.toString());
        },
        verificationFailed: (FirebaseAuthException exception) {
          log(exception.toString());
        },
        codeSent: (String verificationID, int? resendToken) {
          context
              .read<Authprovider>()
              .upDateverificationId(verID: verificationID);
          context.read<Authprovider>().upDatePhoneNum(
                num: mobileNo,
              );
          Navigator.push(
            context,
            PageTransition(
              child: OTPScreen(mobileNumber: mobileNo),
              type: PageTransitionType.rightToLeft,
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationID) {},
      );
    } catch (e) {
      log(e.toString());
    }
  }

  static verifyOTP({required BuildContext context, required String otp}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: context.read<Authprovider>().verificationId,
        smsCode: otp,
      );
      await auth.signInWithCredential(credential);
      Navigator.push(
          context,
          PageTransition(
            child: const SignInlogic(),
            type: PageTransitionType.rightToLeft,
          ));
    } catch (e) {
      log(e.toString());
    }
  }
}
