import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:nii_ui/widgets/custom_loader.dart';
import 'package:nii_ui/services/file_service.dart';
import 'package:nii_ui/services/unity_service.dart';
import 'package:nii_ui/models/file_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  String _message = '';
  FileModel? _file;

  // Function to handle file upload
  Future<void> _uploadFile() async {
    setState(() {
      _isLoading = true;
      _message = '';
    });

    // Show file picker to upload .nii file
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['nii']);

    if (result != null) {
      // File is selected
      _file = FileModel(
          filePath: result.files.single.path!,
          fileName: result.files.single.name);
      setState(() {
        _message = 'File uploaded: ${_file!.fileName}';
      });

      // Process the file based on name and interact with backend (mocked here)
      bool isPreloadedModel = _file!.fileName.startsWith('m');
      if (isPreloadedModel) {
        // Load Unity preloaded models
        UnityService().loadPreloadedModel(_file!.fileName);
      } else {
        // Process with Python model
        FileService().processFile(_file!).then((outputPath) {
          setState(() {
            _message = 'File processed, output path: $outputPath';
            _isLoading = false;
          });
          UnityService().loadModelInUnity(outputPath);
        }).catchError((e) {
          setState(() {
            _message = 'Error processing file: $e';
            _isLoading = false;
          });
        });
      }
    } else {
      setState(() {
        _isLoading = false;
        _message = 'No file selected';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Unity and File Upload')),
      body: Center(
        child: _isLoading
            ? CustomLoader() // A loading spinner
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _uploadFile,
                    child: Text('Upload .nii File'),
                  ),
                  SizedBox(height: 20),
                  Text(_message),
                ],
              ),
      ),
    );
  }
}
