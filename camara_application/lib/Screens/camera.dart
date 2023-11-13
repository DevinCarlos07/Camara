import 'dart:ffi';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  int selectedCamera = 0;
  List<File> capturedImage = [];

  InitializeCamera(int cameraIdux) async {
    var resolutionPreset;
    _controller =
        CameraController(widget.cameras[cameraIdux], resolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void initState() {
    InitializeCamera(selectedCamera);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
