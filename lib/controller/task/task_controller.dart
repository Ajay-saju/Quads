import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quads/models/task/get_all_task_model.dart';
import 'package:quads/service/task/get_all_task_service.dart';

class TaskTabController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllTask();
  }
  var isLoading = true.obs;
  Rx<GetAllTaskModel> getAllTaskModel = GetAllTaskModel().obs;
  final getAllTaskService = GetAllTaskService();
  Future getAllTask() async {
    try {
      var response = await getAllTaskService.getAllTask();
      if (response.statusCode == 200) {
        isLoading.value = false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
