import 'package:dio/dio.dart';
import 'package:quads/base_api/orginal_api.dart';
import 'package:quads/main.dart';

class UserLoginServise {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.json));
  Future<Response> getUserLogin(var credentials) async {
    try {
      print(credentials);
      Response response = await dio.post(
        'AdminController/login',
        data: credentials,
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

  Future<void> saveUserLoginSession(bool isLoggedIn) async {
    await sessionlog.setBool('isLoggedIn', isLoggedIn);
  }
}
