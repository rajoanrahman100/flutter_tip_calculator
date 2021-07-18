import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerClass extends StatefulWidget {
  @override
  _ImagePickerClassState createState() => _ImagePickerClassState();
}

class _ImagePickerClassState extends State<ImagePickerClass> {

  final ImagePicker _picker = ImagePicker();


  Future<void> getLostData() async {
    final LostDataResponse response =
    await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        if (response.type == RetrieveType.video) {
          print(response.file);
        } else {
          print(response.file);
        }
      });
    } else {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FlatButton(
            onPressed: ()async{
              final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
              setState(() {
                getLostData();
              });

            },child: Text("Open Camera"),
          ),
        ),
      ),
    );
  }
}
