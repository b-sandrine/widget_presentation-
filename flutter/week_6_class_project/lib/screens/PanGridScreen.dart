import 'package:flutter/material.dart';

class PanGridScreen extends StatelessWidget {
  const PanGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pan Grid'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(100),
        minScale: 0.1,
        maxScale: 3.0,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
          itemCount: 100,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.primaries[index % Colors.primaries.length],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text('$index', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  }
}