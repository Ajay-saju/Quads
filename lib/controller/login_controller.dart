import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quads/view/constants/loading_class.dart';

import '../models/user_data_model.dart';
import '../service/user_login_servise.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final signinFormKey =GlobalKey<FormState>();
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
        
      }
    } catch (e) {}
    return null;
  }
}
