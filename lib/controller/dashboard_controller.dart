import 'dart:convert';

import 'package:get/get.dart';
import 'package:quads/main.dart';
import 'package:quads/models/get_dashboard_details_model.dart';
import 'package:quads/service/get_dashboard_service.dart';

class DashboardController extends GetxController {
  final String accType = sessionlog.getString('isAdmin').toString();
  var isLoading = true.obs;

  Rx<GetDashBordModel?> getDashBordModel = GetDashBordModel().obs;
  Future getDashData() async {
    isLoading.value = true;
    GetDashboardService getDashboardService = GetDashboardService();
    var id = sessionlog.getString('userId').toString();

    try {
      var response = await getDashboardService.getDashboardData(id);
      if (response.statusCode == 200) {
        isLoading.value = false;
        getDashBordModel.value = GetDashBordModel.fromJson(response.data);
        print(getDashBordModel.value!.data![0].completedProjects.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
