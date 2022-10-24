import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_agora_sample/constants/dimens.dart';
import 'package:whatsapp_agora_sample/gen/assets.gen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: const [
          SizedBox(
            width: Dimens.normal,
          ),
          Icon(Icons.video_call),
          SizedBox(
            width: Dimens.normal,
          ),
          Icon(CupertinoIcons.phone),
          SizedBox(
            width: Dimens.normal,
          ),
          Icon(Icons.menu),
          SizedBox(
            width: Dimens.normal,
          ),
        ],
         
        title: Row(
          children: [

          Image.asset(Assets.images.av.path,height: 33,),
          SizedBox(
            width: Dimens.normal,
         ),
            Expanded(
              child: Text(
                "ali sadeghi irancell",
                softWrap: false,
                overflow: TextOverflow.fade,
                ),
            ),
             
          // Expanded(
          //   child: FittedBox(
          //         child: Text(
          //           "amir hossein safari ",
                 
          //           ),
          //       ),
          // )
            
          ],
        ),

      ),
      body: Stack(children: [
        Positioned(child: Container(color: Colors.blue,)),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(color: Colors.red,width: 60,height: 30,),
              SizedBox(
                height: Get.height/2,
                width: Get.width,
                child: ListView.builder(
                 
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      color: Colors.black,),
                  );
                })),
              )
            ],
          ),
        )
      ]),
      bottomNavigationBar: Container(color: Colors.green,width: double.infinity,height: 60,),
    ));
  }
}
