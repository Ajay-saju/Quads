import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quads/view/constants/app_constants.dart';
import 'package:quads/view/constants/validations.dart';
import 'package:quads/view/pages/projects/add_new_project_screen.dart';

import '../../../controller/projects_controller.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  ProjectsController projectsController = Get.put(ProjectsController());
  @override
  void initState() {
    // TODO: implement initState

    projectsController.getAllProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
        centerTitle: true,
      ),
      // backgroundColor: Colors.black,
      body: Obx(() {
        // ignore: unrelated_type_equality_checks
        return projectsController.isLoading == true
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
                        onPressed: () async {
                          Get.to(const AddNewProjectScreen());
                        },
                        child: const Text('Add Project'),
                      ),
                      AppSize.kSizedBox20h,
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: createDataTable(projectsController
                              .getAllProjectsModel.value.data))
                    ],
                  ),
                )),
              );
      }),
    );
  }

  DataTable createDataTable(data) {
    return DataTable(
        columns: _createColumns(),
        rows: List<DataRow>.generate(
            data.length,
            (index) => DataRow(cells: [
                  DataCell(Text(data[index].projectName)),
                  DataCell(Text(data[index].address ?? '')),
                  DataCell(Text(data[index].city ?? '')),
                  DataCell(Text(data[index].createdOn))
                ])));
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(label: Text('Project Name')),
      const DataColumn(label: Text('City')),
      const DataColumn(label: Text('Address')),
      const DataColumn(label: Text('Created on'))
    ];
  }

  List<DataRow> _createRows(data) {
    return [
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('Flutter Basics')),
        DataCell(Text('David John')),
        DataCell(Text('David John'))
      ]),
      DataRow(cells: [
        DataCell(Text('#101')),
        DataCell(Text('Dart Internals')),
        DataCell(Text('Alex Wick')),
        DataCell(Text('Alex Wick'))
      ])
    ];
  }
}
