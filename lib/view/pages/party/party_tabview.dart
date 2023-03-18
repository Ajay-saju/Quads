import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quads/controller/party_controller.dart';
import 'package:quads/view/constants/app_constants.dart';
import 'package:quads/view/constants/validations.dart';

class PartyTabView extends StatefulWidget {
  const PartyTabView({
    super.key,
  });

  @override
  State<PartyTabView> createState() => _PartyTabViewState();
}

class _PartyTabViewState extends State<PartyTabView> {
  final partyController = Get.put(PartyController());
  @override
  Widget build(BuildContext context) {
    return Center(
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
                          if (partyController.partyFormKey.currentState!
                              .validate()) {
                            partyController.addNewParty(
                              partyController.partyName.text,
                              partyController.phoneNo.text,
                              partyController.des.text,''
                            );
                          }
                        },
                        child: const Text('Submit'))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
