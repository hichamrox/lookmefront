import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class FilesPicker extends StatefulWidget {
  const FilesPicker({Key? key}) : super(key: key);

  @override
  State<FilesPicker> createState() => _FilesPickerState();
}

class _FilesPickerState extends State<FilesPicker> {
  File? image;

  Future upload() async {
    if (image == null)
      return;
    else if (image != null) {
      Dio dio = new Dio();
      var formData = FormData.fromMap({
        "imageURL": await MultipartFile.fromFile(
          image!.path,
        ),
      });
      try {
        var response = await dio
            .post('https://flutterauth10.herokuapp.com/upload', data: formData);
        print(response.data);
      } on DioError catch (e) {
        return ("e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      padding: EdgeInsets.all(32),
      alignment: Alignment.center,
      child: Column(
        children: [
          ElevatedButton(
            child: Text("Importer image"),
            onPressed: () async {
              try {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (image == null) return;
                final imageTemp = File(image.path);
                setState(() => this.image = imageTemp);
                upload();
              } on PlatformException catch (e) {
                print('Failed to pick image $e');
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          image != null ? Image.file(image!) : Text("no image available"),
        ],
      ),
    );
  }
}

// FilePickerResult? result = await FilePicker.platform.pickFiles();
//           if (result == null) return;
//           PlatformFile file = result.files.single;
//           upload(file);