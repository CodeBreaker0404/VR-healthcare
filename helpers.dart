import 'dart:io';

class Helpers {
  // Function to validate if the file name is valid (e.g., m1, m2)
  static bool isValidFileName(String fileName) {
    List<String> validFileNames = ['m1', 'm2', 'm3', 'm4', 'm5', 'm6'];
    return validFileNames.contains(fileName);
  }

  // Function to check if the file is a valid .nii file
  static bool isNiiFile(String fileName) {
    return fileName.endsWith('.nii');
  }
}
