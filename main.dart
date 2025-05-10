import 'package:flutter/material.dart';
import 'package:nii_ui/services/file_service.dart'; // Import the file service
import 'package:nii_ui/models/file_model.dart'; // Import the FileModel class
import 'package:nii_ui/services/unity_service.dart'; // Import Unity service

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Unity Integration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UploadScreen(), // Set UploadScreen as the home screen
    );
  }
}

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final FileService fileService = FileService(); // Instance of FileService

  // Method to handle file selection and backend communication
  void uploadFile() async {
    // Step 1: Create a FileModel instance
    FileModel file =
        FileModel(filePath: '/path/to/your/file.nii', fileName: 'file.nii');

    // Step 2: Process the file (e.g., select a .nii file)
    String? filePath = await fileService.processFile(file);

    if (filePath != null) {
      // Step 3: Send the selected file to the backend for processing
      await fileService.sendFileToBackend(filePath);
    } else {
      // Handle the case where no file is selected
      print("No file selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload File to Backend'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: uploadFile, // Trigger the file selection and upload
          child: Text('Select and Upload File'),
        ),
      ),
    );
  }
}
