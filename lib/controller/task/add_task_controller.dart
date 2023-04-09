import 'package:get/get.dart';
import 'package:quads/models/task/select_users_model';
import 'package:quads/service/task/get_all_task_service.dart';

class AddTaskConroller extends GetxController {
  var isLoading = true.obs;
  List<Data> items = [];
  // Rx<GetAllTaskModel> getAllTaskModel = GetAllTaskModel().obs;
  Rx<SelectUserModel> selectUserModel = SelectUserModel().obs;
  final getAllTaskService = GetAllTaskService();
  Future getUsersList() async {
    try {
      var response = await getAllTaskService.getUserslist();
      if (response.statusCode == 200) {
        selectUserModel.value = SelectUserModel.fromJson(response.data);
        items = selectUserModel.value.data!;
        isLoading.value = false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  Future postTask()async{

  }
}
