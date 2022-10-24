import 'package:hive_flutter/adapters.dart';
part 'message_model.g.dart';

//flutter packages pub run build_runner build

@HiveType(typeId: 2)
class MessageModel extends HiveObject {

  @HiveField(0)
  String? name;
  @HiveField(1)
  String? phone;
  @HiveField(2)
  String? userProfile;
  @HiveField(3)
  String? peerId;
  @HiveField(4)
  String? time;
  @HiveField(5)
  String? content;
  @HiveField(6)
  String? type;//text//voice//video//image//document


  MessageModel({
    required this.name,
    required this.phone,
    required this.userProfile,
    required this.peerId,
    required this.time,
    required this.content,
    required this.type,
 
  });
  
}

 