import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:smart_popup/smart_popup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Builder(builder: (context) {
            return GestureDetector(
              onTapDown: (details) {
                SmartPopup.show(context, position: details.globalPosition, items: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(100)
                      ),child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.cabin),
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(100)
                      ),child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.cabin),
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(100)
                      ),child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.cabin),
                    ),
                    ),
                  ),

                  

                ], totalHeight: 40,totalWidth: 130);
              },
              child: ElevatedButton(
                onPressed: null,
                child: Text("Press me"),
              ),
            );
          }),
        ),
      ),
    );
  }
}
