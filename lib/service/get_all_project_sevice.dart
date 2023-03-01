import 'package:dio/dio.dart';
import 'package:quads/base_api/orginal_api.dart';

import '../main.dart';

class GetAllProjectService {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.json));

  Future<Response> getAllProject(pageNo) async {
    var id = sessionlog.getString('userId');

    print(orginalApi.baseUrl +
        "AdminController/getall_project/$id?pageNo=$pageNo");
    try {
      Response response =
          await dio.get('AdminController/getall_project/$id?pageNo=$pageNo');
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
