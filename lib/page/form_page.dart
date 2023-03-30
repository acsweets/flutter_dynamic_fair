import 'package:flutter/material.dart';

class FromPage extends StatefulWidget {
  @override
  _FromPageState createState() => _FromPageState();
}

class _FromPageState extends State<FromPage> {
  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: '应用名称'),
                onChanged: (value) {
                  setState(() {
                    _formData['name'] = value;
                  });
                },
              ),
         /*     TextFormField(
                decoration: InputDecoration(labelText: '访问key'),
                onChanged: (value) {
                  setState(() {
                    _formData['accessKey'] = value;
                  });
                },
              ),*/
              TextFormField(
                decoration: InputDecoration(labelText: '访问密钥'),
                onChanged: (value) {
                  setState(() {
                    _formData['accessSecret'] = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '回调地址'),
                onChanged: (value) {
                  setState(() {
                    _formData['callbackUrl'] = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '认证地址'),
                onChanged: (value) {
                  setState(() {
                    _formData['authUrl'] = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '数据地址'),
                onChanged: (value) {
                  setState(() {
                    _formData['dataUrl'] = value;
                  });
                },
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // submit form
                  }
                },
                child: Text('提交'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
