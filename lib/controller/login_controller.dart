import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quads/main.dart';
import 'package:quads/models/user_signin_model.dart';
import 'package:quads/service/user_signup_servise.dart';
import 'package:quads/view/constants/loading_class.dart';
import 'package:quads/view/pages/dashboard/dashboard_screen.dart';
import 'package:quads/view/pages/login/login_screen.dart';

import '../models/user_data_model.dart';
import '../service/user_login_servise.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final signinFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  Rx<UserDataModel> userData = UserDataModel().obs;
  Future<UserDataModel?> getUserData(String email, String password) async {
    UserLoginServise userLoginServise = UserLoginServise();

    Map<String, dynamic> credentials = {'email': email, 'password': password};
    String jsonStr = json.encode(credentials);

    try {
      DialogHelper.showLoading();
      final response = await userLoginServise.getUserLogin(jsonStr);

      if (response.statusCode == 200) {
        DialogHelper.hideLoading();

        userData.value = UserDataModel.fromJson(response.data);
        print(userData.value.data!.acctype.toString());
        saveUserLoginSession(
            accType: userData.value.data!.acctype.toString(), isLoggedIn: true);
        await Get.offAll(const DashBoardScreen());
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Rx<UserSignin?> userSignin = UserSignin().obs;
  Future creteNewuser(
      {required String name,
      required String phone,
      required String email,
      required String password}) async {
    UserSignupServise userSignupServis = UserSignupServise();

    Map<String, dynamic> credentials = {
      'email': email,
      'password': password,
      'fullName': name,
      'phone': phone
    };
    String jsonStr = json.encode(credentials);
    try {
      DialogHelper.showLoading();
      final response = await userSignupServis.createNewUser(jsonStr);
      if (response.statusCode == 200) {
        DialogHelper.hideLoading();
        userSignin.value = UserSignin.fromJson(response.data);
        print(userSignin.value!.message.toString());
        if (userSignin.value!.message.toString() ==
            'User created succcessfully') {
          Get.defaultDialog(
            title: userSignin.value!.status.toString(),
            middleText: userSignin.value!.message.toString(),
            titleStyle: const TextStyle(
              fontFamily: "Nunito",
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            middleTextStyle: const TextStyle(
              fontFamily: "Nunito",
              color: Colors.black87,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            confirm: ElevatedButton(
              onPressed: () {
                Get.offAll(const LoginScreen());
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              child: const Text('ok'),
            ),
          );
        } else {
          Get.defaultDialog(
            title: userSignin.value!.status.toString(),
            middleText: userSignin.value!.message.toString(),
            titleStyle: const TextStyle(
              fontFamily: "Nunito",
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            middleTextStyle: const TextStyle(
              fontFamily: "Nunito",
              color: Colors.black87,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            confirm: ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              child: const Text('ok'),
            ),
          );
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> saveUserLoginSession(
      {required bool isLoggedIn, required String accType}) async {
    await sessionlog.setBool('isLoggedIn', isLoggedIn);
    await sessionlog.setString('isAdmin', accType);
    // print("${a.toString()}=============================");
  }
}
