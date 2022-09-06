import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_agora_sample/component/widgets.dart';
import 'package:whatsapp_agora_sample/controller/user_contact_controller.dart';
import 'package:whatsapp_agora_sample/controller/user_inbox_list_controller.dart';

// ignore: must_be_immutable
class ContactListScreen extends StatelessWidget {
  ContactListScreen({Key? key}) : super(key: key);

  UserContactController userContactController =
      Get.put(UserContactController());
  UserInboxListController userInboxListController =
      Get.put(UserInboxListController());
  int editIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: (() {
                    userContactController.addToContact();
                  }),
                  child: const Text('Add to Contact')),
              ElevatedButton(
                  onPressed: (() {
                    userContactController.editContact(editIndex);
                  }),
                  child: const Text('Update')),
            ],
          ),
          SizedBox(
            child: Obx(
              () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: userContactController.contactList.length,
                  itemBuilder: ((context, index) => GestureDetector(
                        onTap: (() {
                          userContactController
                                  .phoneTextEditingController.text =
                              userContactController.contactList[index].phone;

                          userContactController
                                  .usernameTextEditingController.text =
                              userContactController.contactList[index].name;

                          editIndex = index;
                        }),
                        //TODO imagePath is empty an hard code
                        child: GestureDetector(
                          onTap: (() {
                            userInboxListController.addToInbox(
                                name: userContactController
                                    .contactList[index].name,
                                phone: userContactController
                                    .contactList[index].phone);
                            Get.back();
                          }),
                          child: userItem(
                              index: index,
                              name:
                                  userContactController.contactList[index].name,
                              imagePath: "",
                              lastMaeeage: "lastMaeeage",
                              time: "22:00"),
                        ),
                      ))),
            ),
          )
        ]),
      ),
    ));
  }
}
