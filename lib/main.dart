import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quads/view/pages/dashboard/dashboard_screen.dart';
import 'package:quads/view/pages/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sessionlog;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sessionlog = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: sessionlog.getBool('isLoggedIn') == null
          ? const LoginScreen()
          : const DashBoardScreen(),
    );
  }
}
