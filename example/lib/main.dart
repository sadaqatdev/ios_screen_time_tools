import 'package:flutter/material.dart';
import 'package:ios_screen_time_tools/ios_screen_time_tools.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('iOS Screen Time Tools Example'),
        ),
        body: const ScreenTimeDemo(),
      ),
    );
  }
}

class ScreenTimeDemo extends StatefulWidget {
  const ScreenTimeDemo({Key? key}) : super(key: key);

  @override
  State<ScreenTimeDemo> createState() => _ScreenTimeDemoState();
}

class _ScreenTimeDemoState extends State<ScreenTimeDemo> {
  final _screenTime = IosScreenTimeTools();
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              final result = await _screenTime.getScreenTimeData();
              setState(() => _result = result);
            },
            child: const Text('Get Screen Time Data'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final result = await _screenTime.selectAppsToDiscourage();
              setState(() => _result = result);
            },
            child: const Text('Set App Restrictions'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final result = await _screenTime.removeAllRestrictions();
              setState(() => _result = result);
            },
            child: const Text('Remove All Restrictions'),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(_result),
          ),
        ],
      ),
    );
  }
} 