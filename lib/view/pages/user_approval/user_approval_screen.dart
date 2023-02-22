// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../controller/user_appoval_controller.dart';

class UserApprovalScreen extends StatefulWidget {
  const UserApprovalScreen({super.key});

  @override
  State<UserApprovalScreen> createState() => _UserApprovalScreenState();
}

class _UserApprovalScreenState extends State<UserApprovalScreen> {
  UserApprovalController userApprovalController =
      Get.put(UserApprovalController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userApprovalController.getAllApprovals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pending Approvals'),
      ),
      body: Obx(() {
        return userApprovalController.isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black87,
                  strokeWidth: 2.5,
                ),
              )
            : SingleChildScrollView(
                child: SafeArea(
                    child: userApprovalController
                                .getUserApprovalModel.value!.data ==
                            null
                        ? Center(
                            child: Column(
                              children: const [
                                SizedBox(
                                  height: 40,
                                ),
                                Text('No pending approvals'),
                              ],
                            ),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: createDataTable(userApprovalController
                                .getUserApprovalModel.value!.data),
                          )),
              );
      }),
    );
  }

  DataTable createDataTable(data) {
    return DataTable(
      columns: createColumns(),
      rows: List<DataRow>.generate(
          data.length,
          (index) => DataRow(cells: [
                DataCell(Text(data[index].slNo.toString())),
                DataCell(Text(data[index].fullName)),
                DataCell(Text(data[index].email)),
                DataCell(Text(data[index].phone)),
                DataCell(ElevatedButton(
                  onPressed: () {
                    userApprovalController.acceptApproval(
                      id: data[index].id,
                      isApproved: 'accept',
                    );
                    // userApprovalController.update();
                  },
                  child: const Text('Accept'),
                )),
                DataCell(ElevatedButton(
                  onPressed: () {
                    userApprovalController.acceptApproval(
                      id: data[index].id,
                      isApproved: 'decline',
                    );
                    // userApprovalController.update();
                  },
                  child: const Text('Decline'),
                )),
              ])),
    );
  }

  List<DataColumn> createColumns() {
    return [
      const DataColumn(label: Text('Sl No')),
      const DataColumn(label: Text('Full Name')),
      const DataColumn(label: Text('Email')),
      const DataColumn(label: Text('Phone')),
      const DataColumn(label: Text('Edit')),
      const DataColumn(label: Text('Delete')),
    ];
  }
}
