import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../route/route.dart';

 Future showSignUpSuccess(BuildContext context) {
  // set up the button
  Widget okButton = ElevatedButton(
    child: Text("OK"),
    onPressed: () {
      Get.back();
      Get.toNamed(navController);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Sign up successful"),
    actions: [
      okButton,
    ],
  );
  // show the dialog
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Future showSignInSuccess(BuildContext context) {
  // set up the button
  Widget okButton = ElevatedButton(
    child: Text("OK"),
    onPressed: () {
      Get.back();
      Get.toNamed(navController);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Sign In successful"),
    actions: [
      okButton,
    ],
  );
  // show the dialog
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Future showSignInInvalid(BuildContext context) {
  // show the dialog
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Sign In successful"),
      );
    },
  );
}