import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quads/controller/task/add_task_controller.dart';
import 'package:quads/controller/task/task_controller.dart';
import 'package:quads/view/constants/app_constants.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final addTaskConroller = Get.put(AddTaskConroller());
  
  DateTime _selectedDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  String selectedItem = '';
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
  ];

  String selectedItem2 = 'Status';
  List<String> items2 = [
    'Status',
    'Pending',
    'On going',
    'Completed',
  ];

  @override
  void initState() {
    // TODO: implement onInit
    super.initState();
    // getAllTask();
    addTaskConroller.getUsersList();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectSecondDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Task'),
        ),
        body: Obx(() {
          return
          addTaskConroller.isLoading.value == true?
          const Center(
              child: CircularProgressIndicator(
                color: Colors.black87,
                strokeWidth: 2.5,
              ),
            ):
           SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    DropdownButton<String>(
                      value: selectedItem.isNotEmpty ? selectedItem : null,
                      items: addTaskConroller.items.map((item) {
                        return DropdownMenuItem<String>(
                          value: item.fullName,
                          child: Text(item.fullName.toString()),
                        );
                      }).toList(),
                      onChanged: (selectedItem) {
                        setState(() {
                          this.selectedItem = selectedItem!;
                        });
                      },
                    ),
                    AppSize.kSizedBox20h,
                    TextFormField(
                      decoration:
                          const InputDecoration(label: Text('Task Name')),
                    ),
                    AppSize.kSizedBox20h,
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Selected date: ${DateFormat('dd-MM-yyyy').format(_selectedDate)}',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () => _selectDate(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppSize.kSizedBox20h,
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Selected date: ${DateFormat('dd-MM-yyyy').format(selectedDate)}',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () => _selectSecondDate(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppSize.kSizedBox20h,
                    DropdownButton<String>(
                      value: selectedItem2,
                      items: items2.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (selectedItem) {
                        setState(() {
                          selectedItem2 = selectedItem!;
                        });
                      },
                    ),
                    AppSize.kSizedBox20h,
                    TextFormField(
                      decoration:
                          const InputDecoration(label: Text('Description')),
                    ),
                    AppSize.kSizedBox20h,
                    ElevatedButton(
                        onPressed: () {
                          addTaskConroller.postTask();
                        }, child: const Text('Submit'))
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
