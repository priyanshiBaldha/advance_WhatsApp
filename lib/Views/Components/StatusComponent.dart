import 'package:flutter/material.dart';
import 'package:whatsapp/Views/Model/contact.dart';

class StatusComponents extends StatefulWidget {
  const StatusComponents({Key? key}) : super(key: key);

  @override
  State<StatusComponents> createState() => _StatusComponentsState();
}

class _StatusComponentsState extends State<StatusComponents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  CircleAvatar(
                    child: CircleAvatar(
                      radius: 31,
                      backgroundImage: NetworkImage("https://images.unsplash.com/photo-1673191898498-9bac443b2407?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDIxfGJvOGpRS1RhRTBZfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                    ),
                    radius: 35,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("My Status",style: TextStyle(fontSize: 18),),
                      Text("Today , 2:09 PM",style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.more_horiz_sharp),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,top: 10),
              child: Text("Recent updates",style: TextStyle(color: Colors.grey,fontSize: 16),),
            ),
            Column(
              children: Status.map(
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
                              onPressed: () {},
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
                          child: CircleAvatar(
                            radius: 32,
                            backgroundImage: AssetImage(e['image']),
                          ),
                          radius: 35,
                          backgroundColor: Colors.green,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${e['name']}",style: TextStyle(fontSize: 18),),
                            Text("${e['Time']}",style: TextStyle(color: Colors.grey),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
