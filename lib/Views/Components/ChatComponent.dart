import 'package:flutter/material.dart';

import '../Model/contact.dart';

class ChatComponent extends StatefulWidget {
  const ChatComponent({Key? key}) : super(key: key);

  @override
  State<ChatComponent> createState() => _ChatComponentState();
}

class _ChatComponentState extends State<ChatComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: AllContact.map(
                (e) => GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    height: 300,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(e['image']),
                        ),
                        SizedBox(height: 20,),
                        Text("${e['name']}",style: TextStyle(fontSize: 20),),
                        Text("${e['des']}",style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 10,),
                        ElevatedButton(
                          onPressed: () {

                          },
                          child: Text("Send Message"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancle"),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(e['image']),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${e['name']}",style: TextStyle(fontSize: 18),),
                        Text("${e['des']}",style: TextStyle(color: Colors.grey),),
                      ],
                    ),
                    Spacer(),
                    Text("${e['Time']}"),
                  ],
                ),
              ),
            ),
          ).toList(),
        ),
      ),
    );
  }
}
