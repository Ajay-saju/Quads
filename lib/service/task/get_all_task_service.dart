import 'package:dio/dio.dart';
import 'package:quads/base_api/orginal_api.dart';
import '../../main.dart';

class GetAllTaskService {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.json));

  Future<Response> getAllTasks() async {
    var id = sessionlog.getString('userId');

    print(orginalApi.baseUrl + "TaskController/getall_task");

    try {
      Response response = await dio.post('TaskController/getall_task');
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
