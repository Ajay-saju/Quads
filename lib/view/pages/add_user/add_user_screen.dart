import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quads/view/constants/app_constants.dart';

import '../../../controller/add_user_controller.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  AddUserController addUserController = Get.put(AddUserController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addUserController.getAllUsersDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add User'),
      ),
      body: Obx(() {
        // ignore: unrelated_type_equality_checks
        return addUserController.isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black87,
                  strokeWidth: 2.5,
                ),
              )
            : SingleChildScrollView(
                child: SafeArea(
                    child: Center(
                  child: Column(
                    children: [
                      AppSize.kSizedBox10h,
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Add User'),
                      ),
                      AppSize.kSizedBox20h,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: createDataTable(
                            addUserController.getAllUsersModel.value.data),
                      )
                    ],
                  ),
                )),
              );
      }),
    );
  }

  createDataTable(data) {
    return DataTable(
        columns: createColumns(),
        rows: List<DataRow>.generate(
            data.length,
            (index) => DataRow(cells: [
                  DataCell(Text(data[index].slNo.toString())),
                  DataCell(Text(data[index].fullName)),
                  DataCell(Text(data[index].email)),
                  DataCell(Text(data[index].phone)),
                  DataCell(Text(data[index].accType ?? '')),
                  DataCell(ElevatedButton(
                    onPressed: () {},
                    child: const Text('Edit'),
                  )),
                  DataCell(ElevatedButton(
                    onPressed: () {},
                    child: const Text('Delete'),
                  )),
                ])));
  }

  List<DataColumn> createColumns() {
    return [
      const DataColumn(label: Text('Sl No')),
      const DataColumn(label: Text('Full Name')),
      const DataColumn(label: Text('Email')),
      const DataColumn(label: Text('Phone')),
      const DataColumn(label: Text('Acc_Type')),
      const DataColumn(label: Text('Edit')),
      const DataColumn(label: Text('Delete')),
    ];
  }
}
