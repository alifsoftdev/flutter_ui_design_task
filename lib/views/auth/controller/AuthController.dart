import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../helper/db_helper.dart';

class AuthController extends GetxController{
  Rx<DatabaseHelper> dbHelper = DatabaseHelper().obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ///Sign In
  Rx<TextEditingController> usernameControllerIn = TextEditingController().obs;
  Rx<TextEditingController> passwordControllerIn = TextEditingController().obs;
  ///signUp
  Rx<TextEditingController> usernameControllerUp = TextEditingController().obs;
  Rx<TextEditingController> passwordControllerUp = TextEditingController().obs;
  Rx<TextEditingController> nameControllerUp=TextEditingController().obs;
  Rx<TextEditingController> emailForForgetPass=TextEditingController().obs;
  RxBool authValue=false.obs;
  RxBool formFill = false.obs;



  void formFillCheck(GlobalKey key){
    if (formKey.currentState!.validate()) {
      // Form is valid, perform your action here
      formFill.value=true;
      print('Form is valid');
    }else{
      formFill.value=false;
    }
  }


void authCheck(bool value){
    authValue.value=value;
}
}