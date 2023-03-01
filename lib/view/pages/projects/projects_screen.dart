import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quads/view/constants/app_constants.dart';
import 'package:quads/view/constants/validations.dart';
import 'package:quads/view/pages/projects/add_new_project_screen.dart';
import 'package:quads/view/pages/projects/project_details_screen.dart';

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

    projectsController.getAllProjects('1');
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
                              .getAllProjectsModel.value.data)),
                      AppSize.kSizedBox20h,
                      Row(children: [
                        
                        
                      ],)
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
                  DataCell(Text(data[index].projectName),
                      onTap: () => Get.to(ProjectDetailsScreen(
                            projectName: data[index].projectName,
                          ))),
                  DataCell(Text(data[index].address ?? ''),
                      onTap: () => Get.to(ProjectDetailsScreen(
                            projectName: data[index].projectName,
                          ))),
                  DataCell(Text(data[index].city ?? ''),
                      onTap: () => Get.to(ProjectDetailsScreen(
                            projectName: data[index].projectName,
                          ))),
                  DataCell(Text(data[index].createdOn),
                      onTap: () => Get.to(ProjectDetailsScreen(
                            projectName: data[index].projectName,
                          )))
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
}
