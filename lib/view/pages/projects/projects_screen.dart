import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quads/view/constants/app_constants.dart';
import 'package:quads/view/pages/projects/add_new_project_screen.dart';
import 'package:quads/view/pages/projects/project_details_screen.dart';

import '../../../controller/projects_controller.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final ScrollController _scrollController = ScrollController();

  final ProjectsController projectsController = Get.put(ProjectsController());

  // int count = 1;
  // var _dataTableSource;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    projectsController.getAllProjects('1');
    // getAllProjects('1');
    // _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  // Future<void> _scrollListener() async {
  //   if (projectsController.isLoadingMore.value) return;
  //   if (_scrollController.position.pixels ==
  //       _scrollController.position.minScrollExtent) {
  //     projectsController.isLoadingMore.value = true;

  //     count = count + 1;
  //     await projectsController.getAllProjects(count.toString());
  //     projectsController.isLoadingMore.value = false;
  //   } else {}
  // }

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
                      PaginatedDataTable(
                          columns: const [
                            DataColumn(label: Text('Project Name')),
                            DataColumn(label: Text('City')),
                            DataColumn(label: Text('Address')),
                            DataColumn(label: Text('Created on'))
                          ],
                          source: CustomeDataTableSourse(
                              datas: projectsController
                                  .getAllProjectsModel.value.data)),
                      AppSize.kSizedBox20h,
                      // Row(
                      //   children: [],
                      // )
                    ],
                  ),
                )),
              );
      }),
    );
  }

  // DataTable createDataTable(data) {
  //   return DataTable(
  //       columns: _createColumns(),
  //       rows: List<DataRow>.generate(
  //           projectsController.isLoadingMore.value ? data.length : data.length,
  //           (index) {
  //         if (index < data.length) {
  //           return DataRow(cells: [
  //             DataCell(Text(data[index].projectName),
  //                 onTap: () => Get.to(ProjectDetailsScreen(
  //                       projectName: data[index].projectName,
  //                     ))),
  //             DataCell(Text(data[index].address ?? ''),
  //                 onTap: () => Get.to(ProjectDetailsScreen(
  //                       projectName: data[index].projectName,
  //                     ))),
  //             DataCell(Text(data[index].city ?? ''),
  //                 onTap: () => Get.to(ProjectDetailsScreen(
  //                       projectName: data[index].projectName,
  //                     ))),
  //             DataCell(Text(data[index].createdOn),
  //                 onTap: () => Get.to(ProjectDetailsScreen(
  //                       projectName: data[index].projectName,
  //                     )))
  //           ]);
  //         } else {
  //           return const DataRow(cells: [
  //             DataCell(Center(
  //               child: CircularProgressIndicator(),
  //             ))
  //           ]);
  //         }
  //       }));
  // }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(label: Text('Project Name')),
      const DataColumn(label: Text('City')),
      const DataColumn(label: Text('Address')),
      const DataColumn(label: Text('Created on'))
    ];
  }
}

class CustomeDataTableSourse extends DataTableSource {
  final datas;
  CustomeDataTableSourse({required this.datas});
  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(datas[index].projectName.toString()),
          onTap: () => Get.to(ProjectDetailsScreen(
                projectName: datas[index].projectName,
                projectId: datas[index].id,
              ))),
      DataCell(Text(datas[index].address ?? ''),
          onTap: () => Get.to(ProjectDetailsScreen(
              projectName: datas[index].projectName,
              projectId: datas[index].id))),
      DataCell(Text(datas[index].city ?? ''),
          onTap: () => Get.to(ProjectDetailsScreen(
              projectName: datas[index].projectName,
              projectId: datas[index].id))),
      DataCell(Text(datas[index].createdOn), onTap: () {
        Get.to(ProjectDetailsScreen(
            projectName: datas[index].projectName, projectId: datas[index].id));
      })
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => datas.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
