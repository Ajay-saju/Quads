import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:quads/controller/daily_updates_controller.dart';
import 'package:quads/view/constants/app_constants.dart';
import 'package:intl/intl.dart';

class DailyUpdateTabView extends StatefulWidget {
  const DailyUpdateTabView({
    super.key,
  });

  @override
  State<DailyUpdateTabView> createState() => _DailyUpdateTabViewState();
}

class _DailyUpdateTabViewState extends State<DailyUpdateTabView> {
  final dailyUpdateController = Get.put(DailyUpdatesController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dailyUpdateController.getCurrentDate();
  }

  @override
  Widget build(BuildContext context) {
    // var filesCounts = dailyUpdateController.files.length;
    // print(filesCounts.toString());
    return Center(
      child: Column(
        children: [
          AppSize.kSizedBox20h,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: dailyUpdateController.dateController,
              readOnly: true,
              decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                labelText: 'Select date',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => selectDate(context),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a Time';
                }
                return null;
              },
            ),
          ),
          AppSize.kSizedBox20h,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  dailyUpdateController.pickFiles();
                },
                child: const Text("Select File")),
          ),
          AppSize.kSizedBox20h,
          Obx(() {
            var count = dailyUpdateController.files.length;
            return Visibility(
                visible: dailyUpdateController.counterVisibility.value,
                child: Text('$count file selected '));
          }),
          AppSize.kSizedBox20h,
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(label: Text('Caption')),
            ),
          ),
          AppSize.kSizedBox20h,
          ElevatedButton(onPressed: () {}, child: Text('Upload'))
        ],
      ),
    );
  }

  DateTime? selectedDate;
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dailyUpdateController.dateController.text =
            DateFormat('dd-MM-yyyy').format(selectedDate!);
      });
    }
  }
}
