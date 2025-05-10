import 'package:flutter/material.dart';
import 'package:nii_ui/widgets/custom_loader.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Processing...')),
      body: Center(
          child: CustomLoader()), // Displaying the custom loading spinner
    );
  }
}
