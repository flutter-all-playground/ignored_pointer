import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ignored Pointer',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 74),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _ignored = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ignored Pointer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _ignored = !_ignored;
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: _ignored ? Colors.red : Colors.blue),
                child: Text(_ignored ? 'Blocked' : 'All good'),
              ),
            ),
            IgnorePointer(
              ignoring: _ignored,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Click here'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
