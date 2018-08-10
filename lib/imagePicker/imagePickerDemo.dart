import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class ImagePickderDemo extends StatefulWidget {
  ImagePickderDemo();
  @override
  _ImagePickderDemo createState() => _ImagePickderDemo();
}
class _ImagePickderDemo extends State<ImagePickderDemo> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Image Picker'),
        ),
        body: Center(
          child: _image == null
              ? Text('No Image Picked!')
              : Image.file(_image),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          tooltip: 'Pick Image',
          child: Icon(Icons.add_a_photo),
        ),
      );
    }
}