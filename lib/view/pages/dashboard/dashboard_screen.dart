import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quads/controller/dashboard_controller.dart';
import 'package:quads/main.dart';
import 'package:quads/view/constants/app_constants.dart';
import 'package:quads/view/pages/login/login_screen.dart';
import 'package:quads/view/pages/projects/projects_screen.dart';
import 'package:quads/view/pages/user_approval/user_approval_screen.dart';

import '../add_user/add_user_screen.dart';

class DashBoardScreen extends StatefulWidget {
  final String accType;
  const DashBoardScreen({super.key, required this.accType});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  DashboardController dashboardController = Get.put(DashboardController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dashboardController.getDashData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quads'),
        centerTitle: true,
        backgroundColor: const Color(0xff764abc),
      ),
      drawer: Drawer(
          child: widget.accType == 'admin'
              ? ListView(
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color(0xff764abc),
                      ),
                      child: Text('Drawer Header'),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.home,
                      ),
                      title: const Text('Dashboard'),
                      onTap: () {
                        // Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.home,
                      ),
                      title: const Text('Projects'),
                      onTap: () {
                        Get.to(const ProjectsScreen());
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.home,
                      ),
                      title: const Text('Add user'),
                      onTap: () {
                        Get.to(const AddUserScreen());
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.home,
                      ),
                      title: const Text('Permission'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.home,
                      ),
                      title: const Text('User Approval'),
                      onTap: () {
                        Get.to(const UserApprovalScreen());
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.logout_rounded,
                      ),
                      title: const Text('Logout'),
                      onTap: () async {
                        await sessionlog.remove('isAdmin');
                        await sessionlog.remove('isLoggedIn');
                        Get.offAll(const LoginScreen());
                      },
                    ),
                  ],
                )
              : ListView(
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color(0xff764abc),
                      ),
                      child: Text('Drawer Header'),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.home,
                      ),
                      title: const Text('Dashboard'),
                      onTap: () {
                        // Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.home,
                      ),
                      title: const Text('Projects'),
                      onTap: () {
                        // Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.logout_rounded,
                      ),
                      title: const Text('Logout'),
                      onTap: () async {
                        await sessionlog.remove('isAdmin');
                        await sessionlog.remove('isLoggedIn');
                        Get.offAll(const LoginScreen());
                      },
                    ),
                  ],
                )),
      body: Obx(() {
        // ignore: unrelated_type_equality_checks
        return dashboardController.isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black87,
                  strokeWidth: 2.5,
                ),
              )
            : SafeArea(
                child: Center(
                child: Column(
                  children: [
                    AppSize.kSizedBox20h,
                    AppSize.kSizedBox20h,
                    Container(
                      width: 300,
                      height: 150,
                      color: const Color.fromARGB(255, 30, 207, 48),
                      child: Center(
                        child: Column(
                          children: [
                            AppSize.kSizedBox20h,
                            const Text(
                              'No.of Projects',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            AppSize.kSizedBox10h,
                            Text(
                              dashboardController.getDashBordModel.value!
                                  .data![0].completedProjects
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppSize.kSizedBox20h,
                    Container(
                      width: 300,
                      height: 150,
                      color: const Color.fromARGB(255, 44, 111, 188),
                      child: Center(
                        child: Column(
                          children: [
                            AppSize.kSizedBox20h,
                            const Text(
                              'Completed',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            AppSize.kSizedBox10h,
                            Text(
                              dashboardController.getDashBordModel.value!
                                  .data![0].completedProjects
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppSize.kSizedBox20h,
                    Container(
                      width: 300,
                      height: 150,
                      color: const Color.fromARGB(255, 232, 48, 60),
                      child: Center(
                        child: Column(
                          children: [
                            AppSize.kSizedBox20h,
                            const Text(
                              'On going Projects',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            AppSize.kSizedBox10h,
                            Text(
                              dashboardController.getDashBordModel.value!
                                  .data![0].ongoingProjects
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ));
      }),
    );
  }
}
