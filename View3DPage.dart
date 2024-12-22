import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:camera/camera.dart';

class View3DPage extends StatefulWidget {
  @override
  _View3DPageState createState() => _View3DPageState();
}

class _View3DPageState extends State<View3DPage> {
  late CameraController _cameraController;
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;
  late ArPointCloudManager arPointCloudManager;
  bool isQRScanned = false;
  String qrData = "";

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  // Initialize the camera for QR scanning
  _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    _cameraController = CameraController(camera, ResolutionPreset.high);
    await _cameraController.initialize();

    _cameraController.startImageStream((image) {
      _scanQRCode(image);
    });
  }

  // Scan QR code from the camera feed
  _scanQRCode(CameraImage image) async {
    final inputImage = InputImage.fromCameraImage(image);
    final BarcodeScanner barcodeScanner = GoogleMlKit.vision.barcodeScanner();
    final List<Barcode> barcodes = await barcodeScanner.processImage(inputImage);

    for (var barcode in barcodes) {
      setState(() {
        qrData = barcode.displayValue ?? "";
        isQRScanned = true;
      });

      // Stop scanning once QR code is detected
      _cameraController.stopImageStream();
      break;
    }
  }

  // AR session setup
  _onArSessionReady(ARSessionManager arSessionManager) {
    this.arSessionManager = arSessionManager;
    arSessionManager.onNodeTap = (nodes) {
      print('Tapped on AR node');
    };
  }

  // Create AR scene (3D object)
  _addArObject() {
    if (isQRScanned) {
      // You can replace the model asset path below with a custom 3D model
      arObjectManager.addNode(
        name: "3D_Model",
        position: ArPosition(x: 0, y: 0, z: -1),
        scale: ArScale(x: 1, y: 1, z: 1),
        modelUri: 'assets/3d_model.glb', // Your 3D model file
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View 3D with AR"),
      ),
      body: isQRScanned
          ? ArSceneView(
        onArSessionReady: _onArSessionReady,
        onNodeCreated: (node) {
          arObjectManager = node;
          _addArObject();
        },
      )
          : Center(
        child: Text('Scanning QR Code...'),
      ),
      floatingActionButton: isQRScanned
          ? FloatingActionButton(
        onPressed: () {
          // You can add a button to reset or add new 3D objects
          _addArObject();
        },
        child: Icon(Icons.add),
      )
          : null,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }
}
