import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_agora_sample/component/text_style.dart';
import 'package:whatsapp_agora_sample/constants/whatsapp_color.dart';
import 'package:whatsapp_agora_sample/controller/user_contact_controller.dart';
import 'package:whatsapp_agora_sample/gen/assets.gen.dart';

class ContactListScreen extends StatelessWidget {
  ContactListScreen({Key? key}) : super(key: key);

  UserContactController userContactController =
      Get.put(UserContactController());

  int editIndex = -1;

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
                  child: Text('Update')),
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
                        child: contactItem(index),
                      ))),
            ),
          )
        ]),
      ),
    ));
  }

  Widget contactItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset(Assets.images.av.path).image)),
              ),
              const SizedBox(width: 12,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userContactController.contactList[index].name,style: usernameTextStyle,),
                  Text("last message!!",style: messageTextStyle,),
                ],
              ),
            ],
          )
          ,Column(
            
            children: [
                  Text("17:45",style: timeTextStyle,),
                  Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: badg
                    ),
                    child: const Center(child: Text("1")),
                  ),

          ],)
        
        ],
      ),
    );
  }
}
