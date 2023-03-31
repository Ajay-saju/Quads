import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quads/controller/party_controller.dart';
import 'package:quads/view/constants/app_constants.dart';
import 'package:quads/view/constants/validations.dart';

class PartyTabView extends StatefulWidget {
  final String projectId;
  const PartyTabView({
    super.key,
    required this.projectId,
  });

  @override
  State<PartyTabView> createState() => _PartyTabViewState();
}

class _PartyTabViewState extends State<PartyTabView> {
  final partyController = Get.put(PartyController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return partyController.isLoading.value == true
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black87,
                strokeWidth: 2.5,
              ),
            )
          : Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppSize.kSizedBox20h,
                    Form(
                        key: partyController.partyFormKey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: partyController.partyName,
                                validator: (value) {
                                  validateName(value!);
                                },
                              ),
                              AppSize.kSizedBox10h,
                              TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10)
                                  ],
                                  controller: partyController.phoneNo,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    validateMobile(value!);
                                  }),
                              AppSize.kSizedBox10h,
                              TextFormField(
                                controller: partyController.des,
                              ),
                              AppSize.kSizedBox20h,
                              ElevatedButton(
                                  onPressed: () {
                                    if (partyController
                                        .partyFormKey.currentState!
                                        .validate()) {
                                      partyController.addNewParty(
                                          partyController.partyName.text,
                                          partyController.phoneNo.text,
                                          partyController.des.text,
                                          widget.projectId);
                                    }
                                  },
                                  child: const Text('Submit'))
                            ],
                          ),
                        )),
                    AppSize.kSizedBox20h,
                    PaginatedDataTable(
                        columns: const [
                          DataColumn(label: Text('Sl No')),
                          DataColumn(label: Text('Party Name')),
                          DataColumn(label: Text('Phone Number')),
                          DataColumn(label: Text('Description')),
                        ],
                        source: CustomePartytDataTableSourse(
                            data: partyController.getAllPartyModel.value!.data))
                  ],
                ),
              ),
            );
    });
  }
}

class CustomePartytDataTableSourse extends DataTableSource {
  // ignore: prefer_typing_uninitialized_variables
  final data;

  CustomePartytDataTableSourse({required this.data});
  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(data[index].slNo.toString())),
      DataCell(Text(data[index].partyName.toString())),
      DataCell(Text(data[index].phoneNo.toString())),
      DataCell(Text(data[index].description.toString()))
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;
  @override
  // TODO: implement rowCount
  int get rowCount => data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
