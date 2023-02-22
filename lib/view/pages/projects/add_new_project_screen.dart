import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:quads/controller/projects_controller.dart';
import 'package:quads/view/constants/app_constants.dart';
import 'package:quads/view/constants/validations.dart';

class AddNewProjectScreen extends StatefulWidget {
  const AddNewProjectScreen({super.key});

  @override
  State<AddNewProjectScreen> createState() => _AddNewProjectScreenState();
}

class _AddNewProjectScreenState extends State<AddNewProjectScreen> {
  final projectsController = Get.find<ProjectsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Create New User'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: projectsController.createUserFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: projectsController.nameController,
                        validator: (value) => validateName(value!),
                        decoration: const InputDecoration(label: Text('Name')),
                      ),
                      AppSize.kSizedBox10h,
                      TextFormField(
                        controller: projectsController.addressController,
                        decoration:
                            const InputDecoration(label: Text('Adress')),
                      ),
                      AppSize.kSizedBox10h,
                      TextFormField(
                        controller: projectsController.cityController,
                        decoration: const InputDecoration(label: Text('City')),
                      ),
                      AppSize.kSizedBox20h,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            child: const Text("Cancel"),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          ElevatedButton(
                            child: const Text("Create"),
                            onPressed: () {
                              if (projectsController
                                  .createUserFormKey.currentState!
                                  .validate()) {
                                projectsController
                                    .createUserFormKey.currentState!
                                    .save();
                                projectsController.createNewUser(
                                    name:
                                        projectsController.nameController.text,
                                    address: projectsController
                                        .addressController.text,
                                    city:
                                        projectsController.cityController.text);
                              } else {
                                print('error occured');
                              }

                              Get.back();
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
