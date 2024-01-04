import 'package:flutter/material.dart';
import 'package:route_summary_timeline/component.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showBottomSheet = false;

  void _toggleBottomSheeat() {
    setState(() {
      _showBottomSheet = !_showBottomSheet;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            ElevatedButton(
              onPressed: _toggleBottomSheeat,
              child: _showBottomSheet ? const Text('Hide') : const Text('Show'),
            ),
          ],
        ),
      ),
      bottomSheet: _showBottomSheet
          ? Component(
              toggleBottomSheet: _toggleBottomSheeat,
            )
          : null,
    );
  }
}

class Component extends StatelessWidget {
  const Component({
    super.key,
    required this.toggleBottomSheet,
  });

  final void Function() toggleBottomSheet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '경로안내',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              IconButton(
                onPressed: toggleBottomSheet,
                icon: const Icon(Icons.close),
              )
            ],
          ),
          const Text(
            '40분',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Timeline()
        ],
      ),
    );
  }
}
