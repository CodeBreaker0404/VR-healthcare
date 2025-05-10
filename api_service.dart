import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nii_ui/models/response_model.dart';

class ApiService {
  final String _url =
      'http://your_backend_url'; // Replace with your backend URL

  // Function to send file data and get the backend response
  Future<ResponseModel> sendFileData(Map<String, dynamic> fileData) async {
    try {
      final response = await http.post(
        Uri.parse('$_url/process-file'), // Your backend endpoint
        body: json.encode(fileData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return ResponseModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
