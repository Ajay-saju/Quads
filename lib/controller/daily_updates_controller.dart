import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../models/get_daily_update_model.dart';
import '../service/getdaily_update_service.dart';

class DailyUpdatesController extends GetxController {
  final dateController = TextEditingController();

  var files = [].obs;
  var counterVisibility = false.obs;

  Future<void> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'jpg'],
    );
    if (result != null) {
      counterVisibility.value = true;
      files.value = result.paths.map((path) => File(path!)).toList();
    } else {
      print('no files found');
    }
    update();
  }

  String getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    String formattedDateForApi = DateFormat('yy-MM-dd').format(now);
    getDailyUpdates(formattedDateForApi);
    return dateController.text = formattedDate;
    // print(formattedDate);
  }

  Rx<GetDailyUpdatesModel> getDailyUpdatesModel = GetDailyUpdatesModel().obs;
  Future getDailyUpdates(date) async {
    print(date.toString());
    GetDailyUpdates getDailyUpdates = GetDailyUpdates();
    // DialogHelper.showLoading();

    try {
      var response = await getDailyUpdates.getUpdates(date);
      if (response.statusCode == 200) {
        log(response.data);

        getDailyUpdatesModel.value =
            GetDailyUpdatesModel.fromJson(jsonDecode(response.data));
        print(getDailyUpdatesModel.value.data![0].date);
        // DialogHelper.hideLoading();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
