import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
  
  getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    dateController.text = formattedDate;
    // print(formattedDate);
  }
}
