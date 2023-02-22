import 'package:get/get.dart';
import 'package:quads/service/get_all_project_sevice.dart';

import '../models/get_all_project_model.dart';

class ProjectsController extends GetxController {
  var isLoading = true.obs;
  
  Rx<GetAllProjects> getAllProjectsModel = GetAllProjects().obs;
  GetAllProjectService getAllProjectService = GetAllProjectService();
  Future getAllProjects() async {
    try {
      var response = await getAllProjectService.getAllProject();
      if (response.statusCode == 200) {
        getAllProjectsModel.value = GetAllProjects.fromJson(response.data);
        isLoading.value = false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
