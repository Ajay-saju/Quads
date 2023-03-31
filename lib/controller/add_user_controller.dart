import 'package:get/get.dart';
import 'package:quads/models/get_all_users_model.dart';
import 'package:quads/service/delete_user_service.dart';
import 'package:quads/service/get_all_user_service.dart';
import 'package:quads/view/constants/loading_class.dart';

class AddUserController extends GetxController {
  var isLoading = true.obs;

  Rx<GetAllUsers> getAllUsersModel = GetAllUsers().obs;

  Future getAllUsersDetails(pageNo) async {
    GetAllUserService getAllUserService = GetAllUserService();

    try {
      var response = await getAllUserService.getAllUsers(pageNo);
      if (response.statusCode == 200) {
        getAllUsersModel.value = GetAllUsers.fromJson(response.data);
        isLoading.value = false;
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  Future deleteUser({required String id,required String pageNo}) async {
    DialogHelper.showLoading();
    DeleteUserService deleteUserService = DeleteUserService();

    try {
      var response = await deleteUserService.deleteUser(id);
      if (response.statusCode == 200) {
        getAllUsersDetails(pageNo);
        DialogHelper.hideLoading();
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }
}
