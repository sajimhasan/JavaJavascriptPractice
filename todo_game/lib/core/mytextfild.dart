import 'package:flutter/material.dart';

class Mytextfild extends StatelessWidget {
  // final hint
  const Mytextfild({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
       border: InputBorder.none,
       hintText: "",
       label: Text('')
      
      ),

    );
  }
}