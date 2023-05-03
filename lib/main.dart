import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double distance = 0, fare = 0;
  final TextEditingController _dist = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Auto Fare Calculator'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 165,
                  child: TextField(
                    controller: _dist,
                    focusNode: _focusNode,
                    decoration:
                        const InputDecoration(hintText: 'Enter distance in km'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      distance = double.parse(_dist.text);
                      if (distance < 2) {
                        fare = 30;
                      } else {
                        fare = 30 + (distance - 2) * 15;
                      }
                    });
                  },
                  child: const Text('Calculate'),
                ),
                const SizedBox(
                  height: 50,
                ),
                distance != 0
                    ? Text(
                        'Fare for $distance kms is $fare',
                        style: const TextStyle(fontSize: 18),
                      )
                    : const Text(''),
                const SizedBox(
                  height: 70,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      distance = 0;
                      fare = 0;
                      _dist.clear();
                      _focusNode.unfocus();
                    });
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
