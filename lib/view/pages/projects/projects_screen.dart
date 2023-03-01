import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:quads/base_api/orginal_api.dart';
import 'package:quads/main.dart';
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
  final ScrollController _scrollController = ScrollController();
  ProjectsController projectsController = Get.put(ProjectsController());

  // static OrginalApi orginalApi = OrginalApi();
  // final dio = Dio(BaseOptions(
  //     baseUrl: orginalApi.baseUrl, responseType: ResponseType.json));
  int count = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    projectsController.getAllProjects('1');
    // getAllProjects('1');
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  Future<void> _scrollListener() async {
    // projectsController.getAllProjects(count.toString());
    if (_scrollController.position.pixels ==
        _scrollController.position.minScrollExtent) {
      projectsController.isLoadingMore.value = true;

      count = count + 1;
      await projectsController.getAllProjects(count.toString());
      projectsController.isLoadingMore.value = false;

      // projectsController.getAllProjects(count.toString());
    } else {}
    // if (_scrollController.offset >=
    //         _scrollController.position.maxScrollExtent &&
    //     !_scrollController.position.outOfRange) {
    //   // Reach the end of the list, load more data
    //   setState(() {
    //     datas.addAll(
    //         List.generate(10, (index) => 'Item ${datas.length + index}'));
    //   });
    // }
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
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          child: createDataTable(
                              projectsController.projetectData)),
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

  DataTable createDataTable(data) {
    return DataTable(
        columns: _createColumns(),
        rows: List<DataRow>.generate(
            projectsController.isLoadingMore.value
                ? data.length + 1
                : data.length, (index) {
          return DataRow(cells: [
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
          ]);
        }));
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(label: Text('Project Name')),
      const DataColumn(label: Text('City')),
      const DataColumn(label: Text('Address')),
      const DataColumn(label: Text('Created on'))
    ];
  }

  // List post = [];
  // Future getAllProjects(pageNo) async {
  //   var id = sessionlog.getString('userId');
  //   try {
  //     var response =
  //         await dio.get('AdminController/getall_project/$id?pageNo=$pageNo');

  //     if (response.statusCode == 200) {
  //       final json = jsonDecode(response.data) as List;
  //       setState(() {
  //         post = json;
  //       });
  //       print(post);
  //     }
  //   } on DioError catch (e) {
  //     print(e.message);
  //     rethrow;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
