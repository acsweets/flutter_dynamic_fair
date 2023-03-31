import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

@FairPatch()
class DynamicPage extends StatefulWidget {
  final dynamic fairProps;

  const DynamicPage({Key? key, this.fairProps}) : super(key: key);

  @override
  State<DynamicPage> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  @FairProps()
  var fairProps;

  @override
  void initState() {
    super.initState();

    /// 需要将 widget.fairProps 赋值给 fairProps
    fairProps = widget.fairProps;
  }

  String getTitle() {
    return fairProps['title'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTitle()),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'fair_page_two', arguments: {
                'path': 'assets/bundle/lib_page2page_page_two.fair.json',
                'data': {'title': 'PageTwo'}
              });
            },
            child: Text('选择图片页面'),
          )
        ],
      ),
    );
  }
}
