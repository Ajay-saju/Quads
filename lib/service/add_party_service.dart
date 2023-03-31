import 'package:dio/dio.dart';
import 'package:quads/base_api/orginal_api.dart';
import 'package:quads/main.dart';

class AddPartyService {
  static OrginalApi orginalApi = OrginalApi();
  // final dio = Dio(BaseOptions(
  //     baseUrl: orginalApi.baseUrl, responseType: ResponseType.json));
  final dio = Dio(BaseOptions(responseType: ResponseType.json));

  Future<Response> addparty(data) async {
    try {
      Response response = await dio.post(
          'https://api.bigwave.in/test_quads/PartyController/add_party',
          data: data);
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> viewAllParty(pageNo) async {
    var id = sessionlog.getString('userId');
    try {
      Response response = await dio.get(
          'https://api.bigwave.in/test_quads/PartyController/viewall_party/$id?pageNo=1');
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
