
import 'package:flutter/material.dart';

import 'analyze_json.dart';
import 'custom_page.dart';
import 'fair_detail_page.dart';
import 'form_page.dart';
import 'json_widght.dart';

class DomePage extends StatefulWidget {
  const DomePage({Key? key}) : super(key: key);

  @override
  State<DomePage> createState() => _DomePageState();
}

class _DomePageState extends State<DomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('dome'),
      ),
      body: Column(
        children: [
          TextButton(
            child: Text("动态更新页面"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FairDetailPage(),
                ),
              );
              /*    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return FairDetailPage();
                    }),
                  );*/
            },
          ),
          TextButton(
              child: Text("动态更新页面"),
              onPressed: () async {
                String jsonString =
                await DefaultAssetBundle.of(context).loadString('assets/config.json');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CustomPage(jsonConfig: jsonString)),
                );
              }
          ),
          TextButton(
              child: Text("表单页面"),
              onPressed: () async {
/*                String jsonString =
                await DefaultAssetBundle.of(context).loadString('assets/widget.json');*/
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FromPage()),
                );
              }
          ),

          TextButton(
            child: Text("通过json生成的页面"),
            onPressed: () async {
              String jsonString =
              await DefaultAssetBundle.of(context).loadString('assets/config.json');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JsonFormPage(json: jsonString,)),
              );
            }),
          Container(
            height: 200,
            width: 200,
            child: MyWidget(),
          ),
        ],
      ),
    );
  }
}
