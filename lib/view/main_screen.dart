import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:whatsapp_agora_sample/component/text_style.dart';
import 'package:whatsapp_agora_sample/constants/whatsapp_color.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  RxInt selectedTabIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    var tabSize = Get.width / 4;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: (() {
                log("search");
              }),
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: (() {
                log("menu");
              }),
              icon: const Icon(Icons.menu)),
        ],
        title: const Text("WhatsApp"),
      ),
      body: Column(children: [
        Container(
          height: 35,
          color: whatsappColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width / 13,
                child: const Icon(
                  Icons.camera,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child:SizedBox(
                    height: 34,
                    child: Center(
                      child:  
                           ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: tabTitleList.length,
                              shrinkWrap: true,
                              itemBuilder: ((context, index) => GestureDetector(
                                    onTap: (() {
                                      selectedTabIndex.value = index;
                                    }),
                                    child: Obx(
                                      ()=> SizedBox(
                                          width: tabSize,
                                          child: Center(
                                              child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                tabTitleList[index],
                                                style: index == selectedTabIndex.value
                                                    ? selectedTabBarTextStyle
                                                    : unselectedTabBarTextStyle,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 4),
                                                child: AnimatedOpacity(
                                                  duration: Duration(milliseconds: 500),
                                                    opacity: index ==
                                                            selectedTabIndex.value
                                                        ? 1
                                                        : 0,
                                                    child: Container(
                                                      height: 2,
                                                      color: Colors.white,
                                                    )),
                                              )
                                            ],
                                          ))),
                                    ),
                                  ))) 
                      
                     
                    ),
                  ),
                
              )
            ],
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(onPressed: (() {
        
      }),child: Icon(Icons.chat)),
    
    ));
  }
}

List<String> tabTitleList = ['CHATS', 'STATUS', 'CALLS'];
