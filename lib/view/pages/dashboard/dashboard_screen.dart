import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quads/controller/dashboard_controller.dart';
import 'package:quads/main.dart';
import 'package:quads/view/pages/login/login_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  DashboardController dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    print(dashboardController.accType.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quads'),
        centerTitle: true,
        backgroundColor: const Color(0xff764abc),
      ),
      drawer: Drawer(
          child: dashboardController.accType == 'admin'
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
                        // Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.home,
                      ),
                      title: const Text('Add user'),
                      onTap: () {
                        // Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.home,
                      ),
                      title: const Text('Permission'),
                      onTap: () {
                        // Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.home,
                      ),
                      title: const Text('User Approval'),
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
    );
  }
}
