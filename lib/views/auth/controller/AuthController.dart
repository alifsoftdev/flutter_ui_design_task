import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user_model.dart';

class AuthController extends GetxController{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ///Sign In
  Rx<TextEditingController> usernameControllerIn = TextEditingController().obs;
  Rx<TextEditingController> passwordControllerIn = TextEditingController().obs;
  ///signUp
  Rx<TextEditingController> usernameControllerUp = TextEditingController().obs;
  Rx<TextEditingController> passwordControllerUp = TextEditingController().obs;
  Rx<TextEditingController> nameControllerUp=TextEditingController().obs;
  ///forget pass
  Rx<TextEditingController> emailForForgetPass=TextEditingController().obs;
  Rx<TextEditingController> newPass=TextEditingController().obs;
  Rx<TextEditingController> confirmNewPass=TextEditingController().obs;
  RxBool authValue=false.obs;
  RxBool formFill = false.obs;
  ///

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

  RxList<User> users = <User>[].obs;

  @override
  void onInit() {
    _loadUsers();
    super.onInit();
  }

  Future<void> _loadUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? userStrings = prefs.getStringList('users');

    if (userStrings != null) {
      users.value = userStrings.map((userString) {
        List<String> userData = userString.split('|');
        return User(name: userData[0], username: userData[1], password: userData[2]);
      }).toList();
    }
  }

  Future<void> _saveUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> userStrings =
    users.map((user) => '${user.name}|${user.username}|${user.password}').toList();
    prefs.setStringList('users', userStrings);
  }

  Future<void> addUser(String name, String username, String password) async {
    users.add(User(name: name, username: username, password: password));
    await _saveUsers();
  }

  Future<void> updateUser(User oldUser, String newName, String newUsername, String newPassword) async {
    oldUser.name = newName;
    oldUser.username = newUsername;
    oldUser.password = newPassword;
    await _saveUsers();
  }

  Future<void> deleteUser() async {
    users.remove(users);
    await _saveUsers();
  }

  bool signUp(String newName, String newUsername, String newPassword) {
    bool usernameExists = users.any((user) => user.username == newUsername);

    if (!usernameExists) {
      addUser(newName, newUsername, newPassword);
      return true;
    } else {
      return false; // Username already exists
    }
  }
}
