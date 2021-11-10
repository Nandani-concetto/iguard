import 'dart:ffi';

import 'package:flutter/material.dart';

class FirstDemo extends StatefulWidget {
  const FirstDemo({Key? key}) : super(key: key);
  @override
  _FirstDemoState createState() => _FirstDemoState();
}
class _FirstDemoState extends State<FirstDemo> {
  int count=0;
  String? name;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   setState(() {
     name="Nandani";
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$count"),
          ElevatedButton(onPressed: (){setState(() {
            count++;
          });},
          child:Text("Click here") ,
          ),
          Text("$name,$count"),
        ],
      ),
    );
  }
}
