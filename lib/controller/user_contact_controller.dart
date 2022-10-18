import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:whatsapp_agora_sample/constants/hive_keys.dart';
import 'package:whatsapp_agora_sample/model/user_contact_list_model.dart';

class UserContactController extends GetxController {
  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  RxList<UserContactListModel> contactList = RxList();

  @override
  onInit() async {
    super.onInit();
    await readContacts();
  }

  addToContact() async {
    // add user to box
    var box = await Hive.openBox(HiveFieldConstant.userContactListBox);
    var user = UserContactListModel(
        name: usernameTextEditingController.text,
        phone: phoneTextEditingController.text,
        userProfile: "userProfile");
    box.add(user);

    contactList.clear();
    //read users from box
    box.values.forEach((element) {
      UserContactListModel userContactListModel = element;
      contactList.add(userContactListModel);
      print(userContactListModel.name);
    });
  }

  readContacts() async {
    var box = await Hive.openBox(HiveFieldConstant.userContactListBox);
    box.values.forEach((element) {
      UserContactListModel userContactListModel = element;
      contactList.add(userContactListModel);
      print(userContactListModel.name);
    });
  }

  editContact(int index) async {
    var box = await Hive.openBox(HiveFieldConstant.userContactListBox);

    UserContactListModel userContactListModel = box.getAt(index);

    userContactListModel.name = usernameTextEditingController.text;
    userContactListModel.phone = phoneTextEditingController.text;
    userContactListModel.save();

    contactList.clear();
    //read users from box

    readContacts();
  }

  search(String searchKey) async {
    contactList.clear();

    if (searchKey.isEmpty) {
      readContacts();
    } else {
      var box = await Hive.openBox(HiveFieldConstant.userContactListBox);

      box.values
          .where((element) => element.name.contains(searchKey))
          .forEach((element) {
        contactList.add(element);
      });

      await box.close();
    }
  }
}
