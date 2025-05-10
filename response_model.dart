class ResponseModel {
  final bool success;
  final String message;
  final String filePath;

  ResponseModel(
      {required this.success, required this.message, required this.filePath});

  // Convert JSON response to ResponseModel
  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      success: json['success'],
      message: json['message'],
      filePath: json['filePath'],
    );
  }

  // Convert ResponseModel to JSON format
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'filePath': filePath,
    };
  }
}
