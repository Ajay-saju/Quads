import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quads/main.dart';
// import 'package:quads/models/task/get_all_task_model.dart';
import 'package:quads/models/task/select_users_model';
import 'package:quads/service/task/get_all_task_service.dart';

class TaskTabController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getAllTask();
  }

  var isLoading = true.obs;
  List<Data> items = [];
  // Rx<GetAllTaskModel> getAllTaskModel = GetAllTaskModel().obs;
  // Rx<SelectUserModel> selectUserModel = SelectUserModel().obs;
  final getAllTaskService = GetAllTaskService();
 

  Future getAllTask({
    required String projectId,
    required String status,
    required String myTask,
    required String searchTask,
  }) async {
    var id = sessionlog.getString('userId');
    final data = {
      "projectId": projectId,
      "userId": id,
      "status": "ALL",
      "progress": "ALL",
      "myTask": "",
      "searchTask": "",
      "pageNo": "1"
    };
    try {
      var response = await getAllTaskService.getAllTasks();
      if (response.statusCode == 200) {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }
}
