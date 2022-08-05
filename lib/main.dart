import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:whatsapp_agora_sample/model/user_model.dart';
import 'package:whatsapp_agora_sample/view/main_screen.dart';

void main() async {

  await Hive.initFlutter();
  Hive.registerAdapter(UserContactListModelAdapter());
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
 
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
 