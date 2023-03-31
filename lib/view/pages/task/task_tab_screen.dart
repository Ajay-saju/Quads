import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quads/controller/task/task_controller.dart';

class TaskTabView extends StatefulWidget {
  const TaskTabView({super.key});

  @override
  State<TaskTabView> createState() => _TaskTabViewState();
}

class _TaskTabViewState extends State<TaskTabView> {
  final taskTabViewController = Get.put(TaskTabController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return taskTabViewController.isLoading.value == true
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black87,
                strokeWidth: 2.5,
              ),
            )
          : Center(
              child: Column(
                children: [
                  PaginatedDataTable(
                      columns: const [
                        DataColumn(label: Text('Sl No')),
                        DataColumn(label: Text('Task Name')),
                        DataColumn(label: Text('Starts')),
                        DataColumn(label: Text('Ends')),
                        DataColumn(label: Text('Status')),
                        DataColumn(label: Text('Progress')),
                        DataColumn(label: Text('Time left')),
                        DataColumn(label: Text('Tagged users')),
                        DataColumn(label: Text('Edit')),
                      ],
                      source: CustomeTaskDataTableSourse(
                          data:
                              taskTabViewController.getAllTaskModel.value.data))
                ],
              ),
            );
    });
  }
}

class CustomeTaskDataTableSourse extends DataTableSource {
  final data;

  CustomeTaskDataTableSourse({required this.data});
  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(data[index].slNo.toString())),
      const DataCell(Text('')),
      DataCell(Text(data[index].starts.toString())),
      DataCell(Text(data[index].ends.toString())),
      DataCell(Text(data[index].status.toString())),
      const DataCell(Text('%')),
      DataCell(Text(data[index].timeLeft.toString())),
      DataCell(Text(data[index].taggedUser.toString())),
      DataCell(ElevatedButton(onPressed: () {}, child: Text('Edit'))),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;
  @override
  // TODO: implement rowCount
  int get rowCount => data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
