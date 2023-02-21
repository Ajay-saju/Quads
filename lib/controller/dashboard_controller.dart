import 'package:get/get.dart';
import 'package:quads/main.dart';

class DashboardController extends GetxController {
  final String accType = sessionlog.getString('isAdmin').toString();
}
