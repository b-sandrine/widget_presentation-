import 'package:flutter/material.dart';

class BasicZoomScreen extends StatelessWidget {
  const BasicZoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Zoom'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: InteractiveViewer(
        minScale: 0.5,
        maxScale: 4.0,
        child: Image.network('https://picsum.photos/800/600', fit: BoxFit.contain),
      ),
    );
  }
}