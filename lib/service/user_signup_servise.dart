import 'package:dio/dio.dart';
import 'package:quads/base_api/orginal_api.dart';

class UserSignupServise {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.json));

  Future<Response> createNewUser(var userData) async {
    try {
      Response response = await dio.post(
        'AdminController/signup',
        data: userData,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      return response;
    }  on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
