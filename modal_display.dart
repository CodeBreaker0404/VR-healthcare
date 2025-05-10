import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class ModelDisplay extends StatelessWidget {
  final String modelPath;

  ModelDisplay({required this.modelPath});

  @override
  Widget build(BuildContext context) {
    return UnityWidget(
      onUnityCreated: (controller) {
        controller.postMessage(
          'GameObjectName', // Replace with the actual Unity object name
          'LoadModel',
          modelPath, // Pass the .obj model path to Unity
        );
      },
    );
  }
}
