import 'package:dio/dio.dart';
import '../base_api/orginal_api.dart';

class UserApprovalService {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.json));

  Future<Response> getUserApproval() async {
    try {
      Response response = await dio.get('AdminController/get_userApproval');
      return response;
    }on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
