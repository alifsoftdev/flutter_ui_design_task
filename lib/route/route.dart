import 'package:flutter_ui_design_task/views/auth/SignUp.dart';
import 'package:flutter_ui_design_task/views/auth/change_pass.dart';
import 'package:flutter_ui_design_task/views/auth/forget_pass.dart';
import 'package:get/get.dart';
import '../../views/onbording/welcome.dart';
import '../../views/home/bottomNevController.dart';
import '../../views/location/view/location.dart';
import '../../views/auth/success.dart';
import '../../views/onbording/onbording.dart';
import '../views/auth/chagepass_complete.dart';
import '../views/home/view/details_rasto_screen.dart';


const String onbording='/Onbording_Screen';
const String navController='/BottomNavController_Screen';
const String detailsRasto='/DetailsStore_Screen';
const String success='/Success_Screen';
const String forgetPass='/ForgetPassword_Screen';
const String welcome='/Welcome_Screen';
const String changePass='/ChangePassword_Screen';
const String changePassComplete='/ChangePassComplete_Screen';
const String location='/Location_Screen';

//controll our page route flow

List<GetPage> getpages = [
  GetPage(name: onbording, page: ()=>OnbordingScreen()),
  GetPage(name: navController, page: ()=>BottomNavController()),
  GetPage(name: detailsRasto, page: ()=>DetailsRastoScreen()),
  GetPage(name: success, page: ()=>SuccessScreen()),
  GetPage(name: forgetPass, page: ()=>ForgetPassword()),
  GetPage(name: welcome, page: ()=>WelcomeScreen()),
  GetPage(name: changePass, page: ()=>ChangePassword()),
  GetPage(name: changePassComplete, page: ()=>ChangePassComplete()),
  GetPage(name: location, page: ()=>LocationScreen()),
];