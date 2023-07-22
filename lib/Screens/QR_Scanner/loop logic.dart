import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool a = true;

  void _showDialogLoop(BuildContext context) {
    while (a) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  a = true; // Set the condition to true to trigger the loop.
                });
                _showDialogLoop(context);
              },
              child: Text('Start Loop'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  a = false; // Set the condition to false to stop the loop.
                });
              },
              child: Text('Stop Loop'),
            ),
          ],
        ),
      ),
    );
  }
}
