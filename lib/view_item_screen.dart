import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class View_Item_Screen extends StatelessWidget {
  late ArCoreController arCoreController;

  _onArCoreViewCreated(ArCoreController _arCoreController) {
    arCoreController = _arCoreController;
    _addsphere(_arCoreController);
  }

  _addsphere(ArCoreController _arcoreController) {
    final material = ArCoreMaterial(color: Colors.red);
    final sphere = ArCoreSphere(materials: [material], radius: 0.2);
    final node = ArCoreNode(
      shape: sphere,
      position: vector.Vector3(
        0,
        0,
        -1,
      ),
    );
    _arcoreController.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 97, 89, 137),
          elevation: 3.0,
          toolbarHeight: 70.0,
          title: Container(
            child: Text(
              'AR',
              style: TextStyle(
                fontFamily: 'Rajdhani',
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
      ),
    );
  }
}
