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
                SmartPopup.show(context, position: details.globalPosition,animationDuration:
                const Duration(milliseconds: 400),
                    items: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(100)
                          ),child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.cabin),
                        ),
                        ),
                        Text("Himanshu")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(100)
                          ),child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.cabin),
                        ),
                        ),
                        Text("Himanshu")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(100)
                          ),child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.cabin),
                        ),
                        ),
                        Text("Himanshu")
                      ],
                    ),
                  ),

                ], totalHeight: 70,totalWidth: 300);
              },
              child: const ElevatedButton(
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
