import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

class CameraFunc extends StatefulWidget {
  const CameraFunc({Key? key}) : super(key: key);

  @override
  State<CameraFunc> createState() => _CameraFuncState();
}

class _CameraFuncState extends State<CameraFunc> {
  final List<XFile> _image = [];
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '相机功能',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('相机功能'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
            child: Wrap(
              children: _genImages(),
            )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _pickImage,
          tooltip: 'Pick Image',
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }

  _pickImage() {
    // 底部modal
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          height: 160,
          child: Column(
            children: [
              _item('拍照', true),
              _item('从相册选择', false),
            ],
          ),
        ));
  }

  Future<void> getImage(bool isTakePhoto) async {
    // 获取图片
    XFile? image = await _picker.pickImage(
        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 100);
    Navigator.pop(context);
    setState(() {
      _image.add(image!);
    });
    // if (isTakePhoto) {
    //   Uint8List imageData = await image!.readAsBytes();
    //   final result = await ImageGallerySaver.saveImage(imageData, quality: 80);
    //   print(result.toString());
    //   if (result["isSuccess"]) {
    //     print('图片保存 ok');
    //     _toastInfo("保存成功");
    //   } else {
    //     print('图片保存 error');
    //     _toastInfo("保存失败");
    //   }
    // }

  }

  _item(String title, bool isTakePhoto) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
        title: Text(title),
        onTap: () {
          getImage(isTakePhoto);
        },
      ),
    );
  }


  // 图片列表
  _genImages() {
    return _image.map((image) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.file(File(image.path), width: 120, height: 90, fit: BoxFit.fill,),
          ),
          Positioned(
              right: 5,
              top:5,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _image.remove(image);
                  });
                },
                child: ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(color: Colors.black54),
                    child: Icon(Icons.close, size: 18,color: Colors.white,),
                  ),
                ),
              )
          ),
        ],
      );
    }).toList();
  }
}