import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Views/Components/CallComponent.dart';
import 'package:whatsapp/Views/Components/ChatComponent.dart';
import 'package:whatsapp/Views/Components/StatusComponent.dart';
import 'package:whatsapp/Views/Components/new_ContactComponent.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

bool isIOS = false;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController tabController;
  PageController pageController = PageController();
  int currentCupertinoIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (isIOS == false)
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            home: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(0xff128C7E),
                  title: Text(
                    "WhatsApp",
                    style: TextStyle(fontSize: 25),
                  ),
                  bottom: TabBar(
                    controller: tabController,
                    onTap: (val) {
                      pageController.animateToPage(
                        val,
                        duration: Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.easeInOut,
                      );
                    },
                    tabs: [
                      Tab(
                        text: "Chats",
                      ),
                      Tab(
                        text: "Status",
                      ),
                      Tab(
                        text: "Calls",
                      ),
                    ],
                    indicatorColor: Colors.white,
                    indicatorWeight: 4,
                  ),
                  actions: [
                    Icon(Icons.camera_alt_outlined),
                    Switch(
                      value: isIOS,
                      onChanged: (val) {
                        setState(() {
                          isIOS = val;
                        });
                      },
                    ),
                  ],
                ),
                body: PageView(
                  onPageChanged: (val) {
                    tabController.animateTo(val);
                  },
                  controller: pageController,
                  children: [
                    ChatComponent(),
                    StatusComponents(),
                    CallComponent(),
                  ],
                ),
                floatingActionButton: Builder(builder: (context) {
                  return FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Container(
                              height: 300,
                              width: 300,
                              child: new_ContactComponent(),
                            ),
                          ),
                        );
                      });
                    },
                    child: Icon(
                      Icons.add,
                      size: 40,
                    ),
                    backgroundColor: Color(0xff128C7E),
                  );
                }),
              ),
            ),
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text(
                  "WhatsApp",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                ),
                trailing: CupertinoSwitch(
                  value: isIOS,
                  onChanged: (val) {
                    setState(() {
                      isIOS = val;
                    });
                  },
                ),
                backgroundColor: CupertinoColors.white,
              ),
              child: Container(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    IndexedStack(
                      index: currentCupertinoIndex,
                      children: [
                        ChatComponent(),
                        StatusComponents(),
                        CallComponent(),
                      ],
                    ),
                    CupertinoTabBar(
                      backgroundColor: CupertinoColors.white,
                      currentIndex: currentCupertinoIndex,
                      onTap: (val) {
                        setState(() {
                          currentCupertinoIndex = val;
                        });
                      },
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(
                              CupertinoIcons.chat_bubble_2,
                            ),
                            label: "Chats"),
                        BottomNavigationBarItem(
                            icon: Icon(
                              CupertinoIcons.arrow_down_left,
                            ),
                            label: "Status"),
                        BottomNavigationBarItem(
                            icon: Icon(
                              CupertinoIcons.phone,
                            ),
                            label: "Calls"),
                      ],
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
            ),
          );
  }
}
