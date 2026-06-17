import 'package:flutter/material.dart';

class ControllerScreen extends StatefulWidget {
  const ControllerScreen({super.key});
  @override
  State<ControllerScreen> createState() => _ControllerScreenState();
}

class _ControllerScreenState extends State<ControllerScreen> {
  final _controller = TransformationController();
  double _scale = 1.0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _reset() {
    _controller.value = Matrix4.identity();
    setState(() => _scale = 1.0);
  }

  void _zoom(double factor) {
    final m = _controller.value.clone()..scale(factor, factor);
    _controller.value = m;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scale: ${_scale.toStringAsFixed(2)}x'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        actions: [IconButton(icon: const Icon(Icons.refresh), onPressed: _reset)],
      ),
      body: Column(children: [
        Expanded(
          child: InteractiveViewer(
            transformationController: _controller,
            minScale: 0.5,
            maxScale: 5.0,
            onInteractionUpdate: (_) {
              setState(() => _scale = _controller.value.getMaxScaleOnAxis());
            },
            child: Image.network('https://picsum.photos/800/600', fit: BoxFit.contain),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(icon: const Icon(Icons.zoom_out), onPressed: () => _zoom(0.7)),
            ElevatedButton(onPressed: _reset, child: const Text('Reset')),
            IconButton(icon: const Icon(Icons.zoom_in), onPressed: () => _zoom(1.5)),
          ]),
        ),
      ]),
    );
  }
}