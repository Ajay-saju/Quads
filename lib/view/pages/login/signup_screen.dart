import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quads/view/constants/app_constants.dart';
import 'package:quads/view/constants/validations.dart';

import '../../../controller/login_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
              key: loginController.signinFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: loginController.nameController,
                    validator: (value) => validateName(value!),
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                  AppSize.kSizedBox20h,
                  TextFormField(
                    controller: loginController.phoneController,
                    validator: (value) => validateMobile(value!),
                    decoration: const InputDecoration(hintText: 'Phone Number'),
                  ),
                  AppSize.kSizedBox20h,
                  TextFormField(
                    controller: loginController.emailController,
                    // validator: (value) => validateEmail(value!),
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  AppSize.kSizedBox20h,
                  TextFormField(
                    controller: loginController.passwordController,
                    decoration: const InputDecoration(hintText: 'password'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (loginController.signinFormKey.currentState!
                            .validate()) {
                          loginController.signinFormKey.currentState!.save();

                          loginController.creteNewuser(
                            email: loginController.emailController.text,
                            name: loginController.nameController.text,
                            password: loginController.passwordController.text,
                            phone: loginController.phoneController.text,
                          );
                        } else {
                          print('error in input');
                        }
                      },
                      child: const Text('Submit'))
                ],
              )),
        ),
      )),
    );
  }
}
