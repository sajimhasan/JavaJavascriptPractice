import 'package:flutter/material.dart';
import 'package:todo_game/core/style.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sign In.',style: Style2.heding,)
            
          ],
        ),
      ),

    );
  }
}