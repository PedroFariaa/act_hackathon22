import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with WidgetsBindingObserver {
  CameraController? controller;
  bool initialized_model = false;

  // Initial Values
  bool _isCameraInitialized = false;
  bool _isRearCameraSelected = true;
  final resolutionPresets = ResolutionPreset.values;
  ResolutionPreset currentResolutionPreset = ResolutionPreset.high;

  @override
  void initState() {
    // Hide the status bar
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    asyncInit();
    super.initState();
  }

  void asyncInit() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      cameras = await availableCameras();
    } on CameraException catch (e) {
      debugPrint('Error in fetching the cameras: $e');
    }
    onNewCameraSelected(cameras[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isCameraInitialized
          ? Stack(alignment: Alignment.bottomLeft, children: [
              AspectRatio(
                aspectRatio: 1 / controller!.value.aspectRatio,
                child: controller!.buildPreview(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isCameraInitialized = false;
                      });
                      onNewCameraSelected(
                          cameras[_isRearCameraSelected ? 1 : 0]);
                      setState(() {
                        _isRearCameraSelected = !_isRearCameraSelected;
                      });
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Icon(
                          Icons.circle,
                          color: Colors.black38,
                          size: 60,
                        ),
                        Icon(
                          _isRearCameraSelected
                              ? Icons.camera_front
                              : Icons.camera_rear,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ])
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(),
                const Text(
                  'Permission denied',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // getPermissionStatus();
                  },
                  child: const Text('Give permission'),
                ),
              ],
            ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;
    // Instantiating the camera controller
    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    // Dispose the previous controller
    await previousCameraController?.dispose();

    // Replace with the new controller
    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    // Initialize controller
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      debugPrint('Error initializing camera: $e');
    }

    // Update the Boolean
    if (mounted) {
      setState(() {
        _isCameraInitialized = controller!.value.isInitialized;
      });

      cameraController.startImageStream((image) {
        if (initialized_model) {
          print("result----------------");
        } else {
          debugPrint("unINtialized Model !");
        }
      });
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      // Free up memory when camera not active
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // Reinitialize the camera with same properties
      onNewCameraSelected(cameraController.description);
    }
  }
}
