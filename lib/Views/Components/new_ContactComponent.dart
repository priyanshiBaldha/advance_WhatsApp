import 'package:flutter/material.dart';

class new_ContactComponent extends StatefulWidget {
  const new_ContactComponent({Key? key}) : super(key: key);

  @override
  State<new_ContactComponent> createState() => _new_ContactComponentState();
}

class _new_ContactComponentState extends State<new_ContactComponent> {
  int initialStep = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: initialStep,
      onStepContinue: (){
        setState(() {
          if(initialStep < 1) {
            ++initialStep;
          }
        }

        );
      },
      onStepCancel: (){
        setState(() {
          if(initialStep>0){
            --initialStep;
          }
        });
      },
      onStepTapped: (val){
        setState(() {
          initialStep= val;
        });
      },
      steps: [
        Step(
          isActive: (initialStep>=0)?true:false,
          title: Text("NAME"),
          subtitle: Text("Enter name"),
          content: TextField(
            decoration: InputDecoration(
              hintText: "Priyanshi Baldha",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Step(
          isActive: (initialStep>=1)?true:false,
          title: Text("Contact No."),
          subtitle: Text("Enter Contact Number"),
          content: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "+91 9512057000",
            ),
          ),
        ),
      ],

    );
  }
}
