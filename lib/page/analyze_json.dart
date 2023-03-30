import 'dart:convert';

import 'package:flutter/material.dart';

class JsonFormPage extends StatefulWidget {
  final String json;

  const JsonFormPage({Key? key, required this.json}) : super(key: key);

  @override
  _JsonFormPageState createState() => _JsonFormPageState();
}

class _JsonFormPageState extends State<JsonFormPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<dynamic> config = jsonDecode(widget.json);
    List<Widget> children = [];
    String title ='';
    String type ='';
    for (final item in config) {
     title = item['title'];
   //  type = item ['type']; //不同的类型用不同的组件

    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('This is a generated page.'),
      ),
    );
  }
}
