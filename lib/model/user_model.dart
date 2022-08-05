
import 'package:hive_flutter/adapters.dart';
part 'user_model.g.dart';
//flutter packages pub run build_runner build

@HiveType(typeId: 0)
class UserContactListModel extends HiveObject{

    @HiveField(0)
    String name;
    @HiveField(1)
    String phone;
    @HiveField(2)
    String userProfile;

    UserContactListModel(
      {
        required this.name,
        required this.phone,
        required this.userProfile,
      }
    );

}