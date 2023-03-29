import 'dart:convert';
import 'package:flutter/material.dart';
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}
class _MyWidgetState extends State<MyWidget> {
  List<dynamic> jsonConfig = [
    {
      "type": "text",
      "text": "Hello, World!",
      "style": {
        "color": "red",
        "fontSize": 16.0
      }
    },
    {
      "type": "button",
      "text": "Click me",
      "onPressed": "onButtonPressed"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Widget"),
      ),
      body: Column(
        children: _buildChildren(),
      ),
    );
  }
  List<Widget> _buildChildren() {
    List<Widget> children = [];
    for (var item in jsonConfig) {
      if (item["type"] == "text") {
        children.add(
          Text(
            item["text"],
            style: TextStyle(
                color: _parseColor(item["style"]["color"]),
                fontSize: item["style"]["fontSize"]
            ),
          ),
        );
      } else if (item["type"] == "button") {
        children.add(
         GestureDetector(
            child: Text(item["text"]),
            onTap: () => _onButtonPressed(),
          ),
        );
      }
    }
    return children;
  }
  Color _parseColor(String color) {
    switch (color) {
      case "red":
        return Colors.red;
      case "green":
        return Colors.green;
      case "blue":
        return Colors.blue;
      default:
        return Colors.black;
    }
  }
  void _onButtonPressed() {
    print("Button pressed.");
  }
}