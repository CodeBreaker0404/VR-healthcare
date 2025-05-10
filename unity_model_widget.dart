import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class UnityModelWidget extends StatefulWidget {
  final String modelPath;

  UnityModelWidget(
      {required this.modelPath}); // Constructor to accept model path

  @override
  _UnityModelWidgetState createState() => _UnityModelWidgetState();
}

class _UnityModelWidgetState extends State<UnityModelWidget> {
  late UnityWidgetController _unityWidgetController;

  // This function is called once the UnityWidget is created and Unity is initialized
  void _onUnityCreated(UnityWidgetController controller) {
    _unityWidgetController = controller;

    // Send a message to Unity to load the model
    controller.postMessage(
      'GameObjectName', // Replace with the actual name of the GameObject in Unity
      'LoadModel', // The Unity method to call for loading the model
      widget.modelPath, // Path to the .obj model file that we pass from Flutter
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unity Model Viewer'),
      ),
      body: UnityWidget(
        onUnityCreated: _onUnityCreated, // Pass Unity initialization callback
        onUnityMessage: (message) {
          // Optionally, you can handle Unity messages here
          print("Message from Unity: $message");
        },
        onUnitySceneLoaded: (sceneName) {
          // Handle scene load completion if needed
          print("Unity scene $sceneName loaded.");
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _unityWidgetController.dispose(); // Clean up the Unity controller
  }
}
