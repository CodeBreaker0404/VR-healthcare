import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nii_ui/models/file_model.dart'; // Ensure you have this model for the file
import 'unity_service.dart'; // Import UnityService to load the model into Unity

class FileService {
  // This function simulates file processing (e.g., selecting a file)
  Future<String> processFile(FileModel file) async {
    // Here you might implement the logic to select the file (e.g., using a file picker to choose the .nii file)
    return file
        .filePath; // Return the file path for now (mocked for simplicity)
  }

  // Send the file path to the backend (Python Flask API)
  Future<void> sendFileToBackend(String filePath) async {
    try {
      final response = await http.post(
        Uri.parse(
            'http://localhost:5000/process-file'), // URL of your Python backend
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'filePath': filePath}), // Send file data (file path)
      );

      if (response.statusCode == 200) {
        // Handle success: Process the .obj file path returned from backend
        var data = json.decode(response.body);
        String objFilePath =
            data['filePath']; // Path to the generated .obj file

        // Load the model into Unity using UnityService
        UnityService().loadModelInUnity(objFilePath);
      } else {
        // Handle backend error
        print('Error processing file: ${response.body}');
      }
    } catch (e) {
      // Catch errors (e.g., network issues)
      print('Error sending file to backend: $e');
    }
  }
}
