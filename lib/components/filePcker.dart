import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lookmefront/components/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilesPicker extends StatefulWidget {
  const FilesPicker({Key? key}) : super(key: key);

  @override
  State<FilesPicker> createState() => _FilesPickerState();
}

class _FilesPickerState extends State<FilesPicker> {
  File? image;
  String? imageURL;
  addStringToSF(imageUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('image', imageUrl);
  }

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
        var res = (response.data.toString().split(" ")[1].split("}")[0]);
        addStringToSF(res);
      } on DioError catch (e) {
        return ("e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      padding: EdgeInsets.all(32),
      alignment: Alignment.center,
      child: Row(
        children: [
          Button("Choisir photo", false, true, size.width * 0.4, 40, () async {
            try {
              final image =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (image == null) return;
              final imageTemp = File(image.path);
              setState(() => this.image = imageTemp);
              upload();
            } on PlatformException catch (e) {
              // print('Failed to pick image $e');
            }
          }, 5),
          Container(
            height: 60,
            child: image != null
                ? Image.file(
                    image!,
                  )
                : Text("no image available"),
          ),
        ],
      ),
    );
  }
}
