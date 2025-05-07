import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_gallery_saver/flutter_image_gallery_saver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(CameraApp(camera: firstCamera));
}

class CameraApp extends StatefulWidget {
  final CameraDescription camera;

  const CameraApp({super.key, required this.camera});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late final CameraController _cameraCOntroller;
  //Future == Promise (js)
  late final Future<void> _initController;

  @override
  void initState() {
    super.initState();
    _cameraCOntroller = CameraController(
      widget.camera, //Description camera
      ResolutionPreset.high
    );
    
    //Ativa a camera e deixa pronta para uso
    _initController = _cameraCOntroller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    //Libera a camera
    _cameraCOntroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: _initController, 
            builder: (context, snapshot) { 
              if(snapshot.connectionState == ConnectionState.done){
                  return takePictureWidget();
              }
              return CircularProgressIndicator();
            })
        ),
      ),
    );
  }

  Column takePictureWidget() {
    return Column(
          children: [
            CameraPreview(this._cameraCOntroller),
            ElevatedButton(onPressed: () async { 
              XFile pic = await _cameraCOntroller.takePicture();
              print(pic.path);
              saveToGallery(pic);
            } , child: Text("Tirar foto"))
          ],
        );
  }
  
  void saveToGallery(XFile pic) async {
    Uint8List imagebytes =  await pic.readAsBytes();
    FlutterImageGallerySaver.saveImage(imagebytes);
  }
}