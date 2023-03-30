import 'dart:convert';
import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final String type;
  final Map<String, dynamic> config;
  CustomWidget({required this.type, required this.config});
  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 'text':
        return Text(
          config['text'],
          style: TextStyle(
            color: Color(int.parse(config['style']['color'])),
            fontSize: double.parse(config['style']['fontSize']),
          ),
        );
      case 'button':
        return ElevatedButton(
          onPressed: () => {
            print('点击事件'),
          },
          child: Text(config['text']),
        );
      default:
        return SizedBox.shrink();
    }
  }
}
class CustomPage extends StatelessWidget {
  final String jsonConfig;
  CustomPage({required this.jsonConfig});
  @override
  Widget build(BuildContext context) {
    List<dynamic> config = jsonDecode(jsonConfig);
    List<Widget> children = [];
    for (final item in config) {
      children.add(CustomWidget(type: item['type'], config: item));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Page"),
      ),
      body: Column(
        children: children,
      ),
    );
  }
}