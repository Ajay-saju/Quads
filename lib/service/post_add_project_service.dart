import 'package:dio/dio.dart';

import '../base_api/orginal_api.dart';

class AddProjectService {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.json));
  Future<Response> postNewProject(data) async {
    try {
      Response response = await dio.post(
        'AdminController/add_project',
        data: data,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
