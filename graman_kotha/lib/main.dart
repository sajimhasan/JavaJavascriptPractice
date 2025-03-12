import 'package:flutter/material.dart';
import 'package:graman_kotha/UI/page-21.dart';
import 'package:graman_kotha/UI/page-22.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: page22(), // Using SignPage correctly
      debugShowCheckedModeBanner: false,
    );
  }
}