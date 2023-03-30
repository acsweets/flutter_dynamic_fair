import 'package:flutter/material.dart';

class WorkflowJdDataManagerAddApplicationPage extends StatefulWidget {
  @override
  _WorkflowJdDataManagerAddApplicationPageState createState() => _WorkflowJdDataManagerAddApplicationPageState();
}

class _WorkflowJdDataManagerAddApplicationPageState extends State<WorkflowJdDataManagerAddApplicationPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _accessKey = '';
  String _accessSecret = '';
  String _callbackUrl = '';
  String _authUrl = '';
  String _dataUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workflow-JdDataManager-addApplication'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: '应用名称',
                border: UnderlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return '请输入应用名称';
                }
                return null;
              },
              onSaved: (value) {
                _name = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '访问key',
                border: UnderlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return '请输入访问key';
                }
                return null;
              },
              onSaved: (value) {
                _accessKey = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '访问密钥',
                border: UnderlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return '请输入访问密钥';
                }
                return null;
              },
              onSaved: (value) {
                _accessSecret = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '回调地址',
                border: UnderlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return '请输入回调地址';
                }
                return null;
              },
              onSaved: (value) {
                _callbackUrl = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '认证地址',
                border: UnderlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return '请输入认证地址';
                }
                return null;
              },
              onSaved: (value) {
                _authUrl = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '数据地址',
                border: UnderlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return '请输入数据地址';
                }
                return null;
              },
              onSaved: (value) {
                _dataUrl = value!;
              },
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              child: Text('提交'),
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
// TODO: 提交表单数据
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
