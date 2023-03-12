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
    addUserController.getAllUsersDetails('1');
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

                      PaginatedDataTable(
                        // key:const Key('row-0'),
                          columns: const [
                            DataColumn(label: Text('Sl No')),
                            DataColumn(label: Text('Full Name')),
                            DataColumn(label: Text('Email')),
                            DataColumn(label: Text('Phone')),
                            DataColumn(label: Text('Acc_Type')),
                            DataColumn(label: Text('Edit')),
                            DataColumn(label: Text('Delete')),
                          ],
                          source: AddUserDatatable(
                              addUserData: addUserController
                                  .getAllUsersModel.value.data))

                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: createDataTable(
                      //       addUserController.getAllUsersModel.value.data),
                      // )
                    ],
                  ),
                )),
              );
      }),
    );
  }

  // createDataTable(data) {
  //   return DataTable(
  //       columns: createColumns(),
  //       rows: List<DataRow>.generate(
  //           data.length,
  //           (index) => DataRow(cells: [
  //                 DataCell(Text(data[index].slNo.toString())),
  //                 DataCell(Text(data[index].fullName)),
  //                 DataCell(Text(data[index].email)),
  //                 DataCell(Text(data[index].phone)),
  //                 DataCell(Text(data[index].accType ?? '')),
  //                 DataCell(ElevatedButton(
  //                   onPressed: () {},
  //                   child: const Text('Edit'),
  //                 )),
  //                 DataCell(ElevatedButton(
  //                   onPressed: () {
  //                     addUserController.deleteUser(
  //                         pageNo: data[index].id.toString(), id: '1');
  //                   },
  //                   child: const Text('Delete'),
  //                 )),
  //               ])));
  // }

//   List<DataColumn> createColumns() {
//     return [
//       const DataColumn(label: Text('Sl No')),
//       const DataColumn(label: Text('Full Name')),
//       const DataColumn(label: Text('Email')),
//       const DataColumn(label: Text('Phone')),
//       const DataColumn(label: Text('Acc_Type')),
//       const DataColumn(label: Text('Edit')),
//       const DataColumn(label: Text('Delete')),
//     ];
//   }
}

class AddUserDatatable extends DataTableSource {
  
  final addUserData;

  AddUserDatatable({required this.addUserData});
  final addUserController = Get.find<AddUserController>();

  @override
  DataRow? getRow(int index) {
    return DataRow(
      // key: Key(addUserData[index].id),
      cells: [
      DataCell(Text(addUserData[index].slNo.toString())),
      DataCell(Text(addUserData[index].fullName)),
      DataCell(Text(addUserData[index].email)),
      DataCell(Text(addUserData[index].phone)),
      DataCell(Text(addUserData[index].accType ?? '')),
      DataCell(ElevatedButton(
        onPressed: () {},
        child: const Text('Edit'),
      )),
      DataCell(ElevatedButton(
        onPressed: () {
          addUserController.deleteUser(
              id: addUserData[index].id.toString(), pageNo: '1');
        },
        child: const Text('Delete'),
      )),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => addUserData.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
