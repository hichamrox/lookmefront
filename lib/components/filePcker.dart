import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:open_file/open_file.dart';

class FilesPicker extends StatelessWidget {
  const FilesPicker({Key? key}) : super(key: key);
  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      padding: EdgeInsets.all(32),
      alignment: Alignment.center,
      child: ElevatedButton(
        child: Text("Importer image"),
        onPressed: () async {
          final result = await FilePicker.platform.pickFiles();
          if (result == null) return;
          final file = result.files.first;
          openFile(file);
        },
      ),
    );
  }
}
