import 'package:dio/dio.dart';
import 'package:quads/base_api/orginal_api.dart';

class GetAllUserService {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.json));

  Future<Response> getAllUsers() async {
    try {
      Response response = await dio.get('AdminController/getall_user?pageNo=1');
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
