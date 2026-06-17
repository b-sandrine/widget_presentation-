import 'package:flutter/material.dart';
import 'package:week_3_class_project/screens/FormScreen.dart';
import 'package:week_3_class_project/screens/BasicZoomScreen.dart';
import 'package:week_3_class_project/screens/PanGridScreen.dart';
import 'package:week_3_class_project/screens/ControllerScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const HomeMenu(),
    );
  }
}

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  void _go(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InteractiveViewer Demo'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Pick an example:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _card(context, 'Original Form Screen', 'Your existing project screen', Colors.deepPurple, Icons.article_outlined, FormScreen()),
            const SizedBox(height: 12),
            _card(context, 'Example 1 — Basic Zoom', 'Pinch to zoom and pan an image', Colors.blue, Icons.zoom_in, const BasicZoomScreen()),
            const SizedBox(height: 12),
            _card(context, 'Example 2 — Pan Grid', 'Pan around a large colorful grid', Colors.green, Icons.grid_view, const PanGridScreen()),
            const SizedBox(height: 12),
            _card(context, 'Example 3 — Controller', 'Live scale tracker + zoom buttons', Colors.purple, Icons.tune, const ControllerScreen()),
          ],
        ),
      ),
    );
  }

  Widget _card(BuildContext context, String title, String subtitle, Color color, IconData icon, Widget screen) {
    return InkWell(
      onTap: () => _go(context, screen),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          border: Border.all(color: color.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: color)),
            Text(subtitle, style: const TextStyle(fontSize: 13, color: Colors.black54)),
          ])),
          Icon(Icons.chevron_right, color: color),
        ]),
      ),
    );
  }
}