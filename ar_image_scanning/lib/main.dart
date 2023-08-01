import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_obj/flutter_3d_obj.dart';

class ARScene extends StatefulWidget {
  @override
  _ARSceneState createState() => _ARSceneState();
}

class _ARSceneState extends State<ARScene> {
  ArCoreController arCoreController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AR Scene'),
        ),
        body: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    _addRemoteModel("YOUR_MODEL_URL_HERE");
  }

  void _addRemoteModel(String modelUrl) {
    final node = ARReferenceNode(
      url: modelUrl,
      position: vector.Vector3(0, 0, -1.5),
    );
    arCoreController.addArCoreNodeWithAnchor(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
