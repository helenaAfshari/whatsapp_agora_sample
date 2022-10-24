import 'package:hive_flutter/adapters.dart';
import 'message_model.dart';
part 'user_inbox_list_model.g.dart';

//flutter packages pub run build_runner build

@HiveType(typeId: 1)
class UserInboxListModel extends HiveObject {

  @HiveField(0)
  String name;
  @HiveField(1)
  String phone; //peerID
  @HiveField(2)
  String userProfile;
  @HiveField(4)
  List<MessageModel> messageList = [];

  UserInboxListModel({
    required this.name,
    required this.phone,
    required this.userProfile,
    required this.messageList,
  });
  
}

 