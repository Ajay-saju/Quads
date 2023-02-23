import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Column(
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
      ],
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
