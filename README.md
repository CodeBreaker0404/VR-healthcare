# VR-healthcare
created a project where we can visualize medical modalities via VR

Unity and Flutter Integration Project
This project demonstrates the integration of Unity 3D with a Flutter mobile application. It enables the ability to display Unity models inside a Flutter app, allowing the use of Unity’s 3D rendering capabilities while maintaining the flexibility of Flutter’s UI and features.

Table of Contents
Project Description

Features

Prerequisites

Setup Instructions

Flutter Configuration

Unity Setup

Running the Application

Troubleshooting

Contributing

License

Project Description
This project allows Flutter to integrate with Unity, enabling the use of Unity's powerful 3D engine within a Flutter mobile app. The integration uses the flutter_unity_widget plugin, which allows Flutter to render Unity scenes and interact with them. In this example, .obj files (3D models) are processed and loaded into Unity from the Flutter side.

Features
Unity 3D models loaded and displayed within a Flutter app.

Real-time interaction between Flutter and Unity via Unity's C# scripts.

Support for sending data (like file paths) from Flutter to Unity to load 3D models.

Supports Android (can be extended to iOS or other platforms).

Prerequisites
Before starting with this project, ensure you have the following installed:

Flutter: Install Flutter

Unity: Download the latest version from Unity's Official Website.

Android Studio: For Android development, install Android Studio with the necessary SDK and NDK.

Java Development Kit (JDK): Required for Android development.

Gradle: Make sure Gradle is installed and properly configured for Android development.

Setup Instructions
Clone the Repository
Start by cloning the project to your local machine:

bash
Copy
git clone https://github.com/yourusername/nii_ui.git
cd nii_ui
Install Flutter Dependencies
In the project folder, run the following to install all Flutter dependencies:

bash
Copy
flutter pub get
Configure Unity
Export the Unity Project:

Open Unity and either create a new Unity project or open an existing project.

Go to File > Build Settings and select Android.

Make sure Export Project is checked.

Build the Unity project and export it to a folder.

The unityLibrary folder will be created after export, which should be copied to your Flutter project’s android/ directory.

Import Unity to Flutter:

Copy the unityLibrary folder into the android/ directory of your Flutter project.

Flutter Configuration
Make sure your settings.gradle and build.gradle files are correctly configured to include the unityLibrary and flutter_unity_widget dependencies. Refer to the settings.gradle and build.gradle examples in the previous sections.

Unity Setup
Unity Export Settings:

Open Unity and go to File > Build Settings.

Select Android as the target platform.

Check Export Project.

Build the Unity project.

Copy the unityLibrary folder to your Flutter project’s android/ directory.

Unity Script:

In Unity, create a C# script (e.g., UnityModelLoader.cs) to load the 3D model and attach it to a GameObject.

Ensure that the GameObject in Unity has the correct script attached to receive messages from Flutter.

Running the Application
After setting up both Flutter and Unity, run the following command in the project directory to start the Flutter app:

bash
Copy
flutter run
This will launch the Flutter app on an emulator or device, where it will load the Unity scene.

Troubleshooting
Unity Model Not Loading: Ensure that the path to the .obj file is correct and that the file exists in the expected location.

Gradle Sync Issues: If Gradle dependencies are not resolving, make sure to sync Gradle by running flutter clean and flutter pub get before trying again.

Android Build Errors: Ensure that you are using compatible versions of Android SDK and NDK for Unity integration.

Contributing
Feel free to fork this repository and submit pull requests. If you find any issues or improvements, please open an issue or contribute to the code.

To contribute:

Fork the repository.

Create a new branch (git checkout -b feature-branch).

Make your changes and commit them (git commit -am 'Add new feature').

Push to the branch (git push origin feature-branch).

Create a pull request.

License
This project is licensed under the MIT License - see the LICENSE file for details.
