import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProjectDetailsScreen extends StatefulWidget {
  final String projectName;
  const ProjectDetailsScreen({super.key, required this.projectName});

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.projectName),
          bottom: const TabBar(isScrollable: true, tabs: [
            Text('Daily Updates'),
            Text('Add Party'),
            Text('Attendence'),
            Text('Transactions'),
            Text('Materials'),
            Text('Supervision'),
            Text('Tasks'),
          ]),
        ),
      ),
    );
  }
}
