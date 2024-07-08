// ignore_for_file: unused_local_variable

import 'dart:developer';
import 'package:amazon/constant/constants.dart';
import 'package:amazon/model/address_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:amazon/model/user_model.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../constant/common_function.dart';
import '../../../../view/auth_screen/sign_inlogic.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataCRUD {
  static Future addNewUser({
    required UserModel userModel,
    required BuildContext context,
  }) async {
    try {
      await firestore
          .collection('users')
          .doc(auth.currentUser!.phoneNumber)
          .set(userModel.toMap())
          .whenComplete(() {
        log('Data Added');
        CommonFunctions.showSuccessToast(
            context: context, message: 'User Added Successful');
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: const SignInlogic(),
                type: PageTransitionType.rightToLeft),
            (route) => false);
      });
    } catch (e) {
      log(e.toString());
      CommonFunctions.showErrorToast(context: context, message: e.toString());
    }
  }

  static Future<bool> checkUser() async {
    bool userPresent = false;
    try {
      await firestore
          .collection('users')
          .where('mobileNum', isEqualTo: auth.currentUser!.phoneNumber)
          .get()
          .then((value) {
        value.size > 0 ? userPresent = true : userPresent = false;
        log(value.toString());
      });
    } catch (e) {
      log(e.toString());
    }
    log(userPresent.toString());
    return userPresent;
  }

  static Future addUserAddress(
      {required BuildContext context,
      required AddressModel addressModel,
      required String docID}) async {
    try {
      await firestore
          .collection('Address')
          .doc(auth.currentUser!.phoneNumber)
          .collection('address')
          .doc(docID)
          .set(addressModel.toMap())
          .whenComplete(() {
        log('Data Added');
        CommonFunctions.showSuccessToast(
            context: context, message: 'Address Added Successful');
        Navigator.pop(context);
      });
    } catch (e) {
      log(e.toString());
      CommonFunctions.showErrorToast(context: context, message: e.toString());
    }
  }

  static Future<bool> checkUsersAddress() async {
    bool addressPresent = false;
    try {
      await firestore
          .collection('Address')
          .doc(auth.currentUser!.phoneNumber)
          .collection('address')
          .get()
          .then((value) {
        value.size > 0 ? addressPresent = true : addressPresent = false;
        log(value.toString());
      });
    } catch (e) {
      log(e.toString());
    }
    log(addressPresent.toString());
    return addressPresent;
  }

  static Future<List<AddressModel>> getAllAddress() async {
    List<AddressModel> allAddress = [];
    AddressModel defaultAddress = AddressModel();
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Address')
          .doc(auth.currentUser!.phoneNumber)
          .collection('address')
          .get();

      for (var element in snapshot.docs) {
        allAddress.add(AddressModel.fromMap(element.data()));
        AddressModel currentAddresss = AddressModel.fromMap(element.data());
        if (currentAddresss.isDefault == true) {
          defaultAddress = currentAddresss;
        }
      }
    } catch (e) {
      log('error Found');
      log(e.toString());
    }
    for (var data in allAddress) {
      log(data.toMap().toString());
    }
    return allAddress;
  }

  static Future getCurrentSelectedAddress() async {
    AddressModel defaultAddress = AddressModel();
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Address')
          .doc(auth.currentUser!.phoneNumber)
          .collection('address')
          .get();

      for (var element in snapshot.docs) {
        AddressModel currentAddresss = AddressModel.fromMap(element.data());
        if (currentAddresss.isDefault == true) {
          defaultAddress = currentAddresss;
        }
      }
    } catch (e) {
      log('error Found');
      log(e.toString());
    }
    return defaultAddress;
  }
}
