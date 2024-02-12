import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<TextEditingController> nameController=TextEditingController().obs;
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