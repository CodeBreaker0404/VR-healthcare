import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class UnityService {
  // Load Unity preloaded models
  void loadPreloadedModel(String modelName) {
    UnityWidgetController? controller; // You should initialize this properly
    controller?.postMessage(
      'GameObjectName', // Replace with actual Unity object name
      'LoadModel',
      modelName, // Send model name to Unity
    );
  }

  // Load model into Unity (after processing by Python)
  void loadModelInUnity(String modelPath) {
    UnityWidgetController? controller; // Initialize the controller here
    controller?.postMessage(
      'GameObjectName', // Replace with actual Unity object name
      'LoadModel',
      modelPath, // Path to the .obj file
    );
  }
}
