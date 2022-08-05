import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:whatsapp_agora_sample/controller/user_contact_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  UserContactController userContactController =
      Get.put(UserContactController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          TextFormField(
            decoration: const InputDecoration(hintText: "@username"),
            controller: userContactController.usernameTextEditingController,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: "@phone"),
            controller: userContactController.phoneTextEditingController,
          ),
          //TODO file picker for profile picture
          ElevatedButton(
              onPressed: (() {
                userContactController.addToContact();
              }),
              child: Text('Add to Contact')),
          SizedBox(
            child: Obx(
              () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: userContactController.contactList.length,
                  itemBuilder: ((context, index) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(userContactController
                                  .contactList[index].name),
                              Text(userContactController
                                  .contactList[index].phone)
                            ],
                          ),
                        ),
                      ))),
            ),
          )
        ]),
      ),
    ));
  }
}
