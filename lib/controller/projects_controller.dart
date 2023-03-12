import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quads/main.dart';
import 'package:quads/service/get_all_project_sevice.dart';
import 'package:quads/service/post_add_project_service.dart';
import 'package:quads/view/constants/loading_class.dart';

import '../models/get_all_project_model.dart';

class ProjectsController extends GetxController {
  final createUserFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  var isLoading = true.obs;
  var isLoadingMore = false.obs;
  var projetectData = [].obs;

  ScrollController controller = ScrollController();
  var listLength = 10.obs;

  Future createNewUser(
      {required String name,
      required String address,
      required String city}) async {
    DialogHelper.hideLoading();
    AddProjectService addProjectService = AddProjectService();

    var userId = sessionlog.getString('userId');

    Map projectData = {
      'userId': userId,
      'projectName': name,
      'address': address,
      'city': city
    };
    var data = jsonEncode(projectData);
    print(data);

    try {
      var response = await addProjectService.postNewProject(data);
      if (response.statusCode == 200) {
        getAllProjects('1');
        DialogHelper.hideLoading();
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  Rx<GetAllProjects> getAllProjectsModel = GetAllProjects().obs;

  GetAllProjectService getAllProjectService = GetAllProjectService();
  Future getAllProjects(pageNO) async {
    isLoading.value = true;
    // var isLoading = true.obs;
    try {
      var response = await getAllProjectService.getAllProject(pageNO);
      if (response.statusCode == 200) {
        getAllProjectsModel.value = GetAllProjects.fromJson(response.data);
        print(getAllProjectsModel.value.data!.length);
        // if (pageNO == '1') {
        //   projetectData.value = getAllProjectsModel.value.data!.toList();
        //   print(projetectData.value.length);
        // } else {
        //   // ignore: invalid_use_of_protected_member
        //   projetectData.value.addAll(getAllProjectsModel.value.data!.toList());
        // }
        isLoading.value = false;
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }
}
