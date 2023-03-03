import 'package:dio/dio.dart';
import 'package:quads/base_api/orginal_api.dart';
import 'package:quads/main.dart';

class GetDailyUpdates {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.json));

  Future<Response> getUpdates(date) async {
    var id = sessionlog.getString('userId');

    try {
      Response response =
          await dio.get('DailyUpdatesController/view_updates/$id/$date');
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
