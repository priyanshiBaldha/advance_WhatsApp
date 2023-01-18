import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/contact.dart';

class CallComponent extends StatefulWidget {
  const CallComponent({Key? key}) : super(key: key);

  @override
  State<CallComponent> createState() => _CallComponentState();
}

class _CallComponentState extends State<CallComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: AllContact.map((e) => Container(
              padding: EdgeInsets.all(15),
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
                      Row(
                        children: [
                          Icon(CupertinoIcons.arrow_down_left,size: 20,color: Colors.green,),
                          Text("${e['call_Time']}",style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.call,size: 30,color: Colors.green,),
                ],
              ),
            ),).toList(),
          ),
        )
    );
  }
}
