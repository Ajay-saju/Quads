import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quads/main.dart';
import 'package:quads/models/get_all_party_model.dart';
import 'package:quads/service/add_party_service.dart';
import 'package:quads/view/constants/loading_class.dart';

class PartyController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllParty('1');
  }

  final partyFormKey = GlobalKey<FormState>();
  final partyName = TextEditingController();
  final phoneNo = TextEditingController();
  final des = TextEditingController();
  var isLoading = true.obs;
  Future addNewParty(
      String partyName, String phoneNo, String desc, String projectId) async {
    DialogHelper.showLoading();
    AddPartyService addPartyService = AddPartyService();
    var id = sessionlog.getString('userId');
    final data = {
      "userId": id,
      'projectId': projectId,
      'partyName': partyName,
      'phone': phoneNo,
      'description': desc
    };
    String jsonStr = jsonEncode(data);
    print(jsonStr);

    try {
      var response = await addPartyService.addparty(jsonStr);
      if (response.statusCode == 200) {
        DialogHelper.hideLoading();
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  Rx<GetAllPartyModel?> getAllPartyModel = GetAllPartyModel().obs;
  Future getAllParty(pageNO) async {
    AddPartyService addPartyService = AddPartyService();
    try {
      var response = await addPartyService.viewAllParty(pageNO);
      if (response.statusCode == 200) {
        getAllPartyModel.value = GetAllPartyModel.fromJson(response.data);
        print(getAllPartyModel.value!.data![0].id);
        isLoading.value = false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
