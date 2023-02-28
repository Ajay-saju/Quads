import 'package:dio/dio.dart';
import 'package:quads/base_api/orginal_api.dart';

class GetDashboardService {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.json));
  Future<Response> getDashboardData(String id) async {
    try {
      Response response = await dio.get('DashboardController/dashboard/$id');
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
