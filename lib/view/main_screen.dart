import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_agora_sample/component/text_style.dart';
import 'package:whatsapp_agora_sample/constants/whatsapp_color.dart';
import 'package:whatsapp_agora_sample/controller/user_inbox_list_controller.dart';

import '../component/widgets.dart';
import 'chat_screen.dart';
import 'contact_list.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  RxInt selectedTabIndex = 0.obs;

  UserInboxListController userInboxListController =
      Get.put(UserInboxListController());

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    log("initState");
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
    log("dispose");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      userInboxListController.readInbox();
    }
  }

  @override
  Widget build(BuildContext context) {
    var tabSize = Get.width / 4;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 35,
            color: whatsappColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //camnera
                SizedBox(
                  width: Get.width / 13,
                  child: const Icon(
                    Icons.camera,
                    color: Colors.white,
                  ),
                ),
                //tabs
                Expanded(
                  child: SizedBox(
                    height: 34,
                    child: Center(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: tabTitleList.length,
                            shrinkWrap: true,
                            itemBuilder: ((context, index) => GestureDetector(
                                  onTap: (() {
                                    selectedTabIndex.value = index;
                                  }),
                                  child: Obx(
                                    () => SizedBox(
                                        width: tabSize,
                                        child: Center(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              tabTitleList[index],
                                              style: index ==
                                                      selectedTabIndex.value
                                                  ? selectedTabBarTextStyle
                                                  : unselectedTabBarTextStyle,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4),
                                              child: AnimatedOpacity(
                                                  duration: const Duration(
                                                      milliseconds: 500),
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
                                )))),
                  ),
                )
              ],
            ),
          ),

          //chats
          Obx(
            () => IndexedStack(
              index: selectedTabIndex.value,
              children: [
                chatScreen(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Tap to add status update
                    Container(
                      color: Colors.blue,
                      height: 60,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Recent updates"),
                    ),
                    //recent updates
                    ListView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.black26,
                                height: 60,
                              ));
                        })),

                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Recent updates"),
                    ),
                    //recent updates
                    ListView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: 2,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.black26,
                                height: 60,
                              ));
                        }))
                  ],
                ),
                Container(
                  color: Colors.blue,
                  height: 50,
                )
              ],
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (() {
            Get.to(ContactListScreen());
          }),
          child: const Icon(Icons.chat)),
    ));
  }

  Widget chatScreen() {
    return SizedBox(
      child: Obx(
        () => ListView.builder(
            shrinkWrap: true,
            itemCount: userInboxListController.inboxList.length,
            itemBuilder: ((context, index) => GestureDetector(
                  onTap: (() {
                    //TODO Go to Chat Screen
                    Get.to(const ChatScreen());
                  }),

                  //TODO imagePath is empty an hard code
                  child: userItem(
                      index: index,
                      name: userInboxListController.inboxList[index].name,
                      imagePath: "",
                      lastMaeeage: "lastMaeeage",
                      time: "22:00"),
                ))),
      ),
    );
  }
}

List<String> tabTitleList = ['CHATS', 'STATUS', 'CALLS'];
