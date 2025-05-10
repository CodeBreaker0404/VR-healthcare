import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FileUploadButton extends StatelessWidget {
  final Function onFilePicked;

  FileUploadButton({required this.onFilePicked});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        FilePickerResult? result = await FilePicker.platform
            .pickFiles(type: FileType.custom, allowedExtensions: ['nii']);
        if (result != null) {
          onFilePicked(result.files.single.path!, result.files.single.name);
        } else {
          // Handle when no file is selected
        }
      },
      child: Text('Upload .nii File'),
    );
  }
}
