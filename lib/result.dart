import 'package:flutter/material.dart';
import 'package:iguard/data/model/api_result_model.dart';
class ScreenArguments {
  final String username;

  ScreenArguments(this.username);
}

class ResultPage extends StatefulWidget {
  static const routeName = '/extractArguments';
  final String username;
  const ResultPage({
    Key? key,
    required this.username
  }) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Response"),
      ),
      body: Text(widget.username,
        style: TextStyle(
          fontSize:30
        ),
      ),
    );
  }

}
