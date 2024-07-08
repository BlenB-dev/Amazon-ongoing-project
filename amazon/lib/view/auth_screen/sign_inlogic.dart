// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:amazon/view/auth_screen/auth_screen.dart';
import 'package:amazon/view/user/user_data_screen/user_data_input_screen.dart';
import 'package:amazon/view/user/user_persistant_nav_bar/user_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../controller/services/auth_services/auth_services.dart';
import '../../controller/services/auth_services/user_data_crud_services/user_data_CRUD_services.dart';


class SignInlogic extends StatefulWidget {
  const SignInlogic({super.key});

  @override
  State<SignInlogic> createState() => _SignInlogicState();
}

class _SignInlogicState extends State<SignInlogic> {
  checkUser() async {
    bool userAlreadyThere = await UserDataCRUD.checkUser();
    log(userAlreadyThere.toString());
    if (userAlreadyThere == true) {
      Navigator.push(
        context,
        PageTransition(
            child: const UserBottomNavBar(),
            type: PageTransitionType.rightToLeft),
      );
    } else {
      Navigator.push(
          context,
          PageTransition(
              child: const UserDataInputScrren(),
              type: PageTransitionType.rightToLeft));
    }
  }

  checkAuthentication() {
    bool userIsAuthenticated = AuthServices.checkAuthentication();
    userIsAuthenticated
        ? checkUser()
        : Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: const AuthScreen(),
                type: PageTransitionType.rightToLeft),
            (route) => false);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkAuthentication();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        image: AssetImage('assets/images/amazon_splash_screen.png'),
        fit: BoxFit.fill,
      ),
    );
  }
}
