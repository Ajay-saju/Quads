import 'dart:convert';

import 'package:get/get.dart';
import 'package:quads/models/get_user_approval_model.dart';
import 'package:quads/service/get_user_approval_service.dart';
import 'package:quads/service/post_approval_service.dart';
import 'package:quads/view/constants/loading_class.dart';

class UserApprovalController extends GetxController {
  var isLoading = true.obs;

  Rx<GetUserApprovalModel?> getUserApprovalModel = GetUserApprovalModel().obs;
  var userApprovalData = [].obs;

  Future getAllApprovals() async {
    UserApprovalService userApprovalService = UserApprovalService();
    try {
      var response = await userApprovalService.getUserApproval();
      if (response.statusCode == 200) {
        getUserApprovalModel.value =
            GetUserApprovalModel.fromJson(response.data);
        userApprovalData.value = getUserApprovalModel.value!.data!.toList();
        print(getUserApprovalModel.value!.data!.length);
        isLoading.value = false;
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  Future acceptApproval(
      {required String id, required String isApproved}) async {
    DialogHelper.showLoading();
    PostApprovalService postApprovalService = PostApprovalService();
    Map approval = {'id': id, 'userApprove': isApproved};
    print(approval);
    String jsonStr = jsonEncode(approval);
    print(jsonStr);
    try {
      var reponse = await postApprovalService.postApproval(jsonStr);
      if (reponse.statusCode == 200) {
        print(reponse.data);
        getAllApprovals();
        DialogHelper.hideLoading();
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }
}
