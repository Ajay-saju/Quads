import 'package:dio/dio.dart';
import 'package:quads/base_api/orginal_api.dart';
import 'package:quads/main.dart';

class AddPartyService {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.json));

  Future<Response> Addparty(data) async {
    var id = sessionlog.getString('userId');

    // print(orginalApi.baseUrl +
    //     "AdminController/getall_project/$id?pageNo=$pageNo");
    try {
      Response response =
          await dio.get('PartyController/add_party', data: data);
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
