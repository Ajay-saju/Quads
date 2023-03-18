import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quads/main.dart';
import 'package:quads/service/add_party_service.dart';
import 'package:quads/view/constants/loading_class.dart';

class PartyController extends GetxController {
  final partyFormKey = GlobalKey<FormState>();
  final partyName = TextEditingController();
  final phoneNo = TextEditingController();
  final des = TextEditingController();
  Future addNewParty(
      String partyName, String phoneNo, String desc, String projectId) async {
    DialogHelper.showLoading();
    AddPartyService addPartyService = AddPartyService();
    var id = sessionlog.getString('userId');
    final data = {
      "userId": id,
      'projectId': phoneNo,
      'partyName': partyName,
      'phone': phoneNo,
      'description': desc
    };
    String jsonStr = jsonEncode(data);

    try {
      var response = await addPartyService.Addparty(jsonStr);
      if (response.statusCode == 200) {
        DialogHelper.hideLoading();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
