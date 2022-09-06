import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:whatsapp_agora_sample/constants/hive_keys.dart';
import 'package:whatsapp_agora_sample/model/user_inbox_list_model.dart';

class UserInboxListController extends GetxController {
  RxList<UserInboxListModel> inboxList = RxList();

  @override
  onInit() async {
    super.onInit();
    await readInbox();
  }

  addToInbox({required String name, required String phone}) async {
    var box = await Hive.openBox(HiveFieldConstant.userInboxListBox);
    var user = UserInboxListModel(
        name: name, phone: phone, userProfile: "userProfile");
    box.add(user);

    inboxList.clear();
    //read users from box
    for (var element in box.values) {
      UserInboxListModel user = element;
      inboxList.add(user);
      //print(user.name);
    }
  }

  readInbox() async {
    var box = await Hive.openBox(HiveFieldConstant.userInboxListBox);
    for (var element in box.values) {
      UserInboxListModel user = element;
      inboxList.add(user);
      //print(user.name);
    }
  }
}
