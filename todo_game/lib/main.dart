import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_game/UI/home_page.dart';
import 'package:todo_game/UI/signIn.dart';
void main(){
  runApp(myapp());
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Signin(),

    );
  }
}