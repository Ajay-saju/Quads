import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quads/view/constants/app_constants.dart';
import 'package:quads/view/constants/validations.dart';
import 'package:quads/view/pages/login/signup_screen.dart';

import '../../../controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Form(
                key: loginController.loginFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: loginController.emailController,
                        validator: (value) {
                          validateEmail(value!);
                          return null;
                        },
                      ),
                      AppSize.kSizedBox20h,
                      TextFormField(
                        controller: loginController.passwordController,
                      ),
                      AppSize.kSizedBox20h,
                      ElevatedButton(
                          onPressed: () {
                            if (loginController.loginFormKey.currentState!
                                .validate()) {
                              loginController.loginFormKey.currentState!.save();
                              loginController.getUserData(
                                  loginController.emailController.text,
                                  loginController.passwordController.text);
                            }
                            
                          },
                          child: const Text('Submit'))
                    ],
                  ),
                )),
            ElevatedButton(
                onPressed: () {
                  Get.to(const SignUpScreen());
                },
                child: const Text('Signup'))
          ],
        ),
      )),
    );
  }
}
