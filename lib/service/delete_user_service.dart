import 'package:dio/dio.dart';
import 'package:quads/base_api/orginal_api.dart';

class DeleteUserService {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.json));

  Future<Response> deleteUser(String id) async {
    try {
      Response response = await dio.delete('AdminController/delete_user/$id');
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
