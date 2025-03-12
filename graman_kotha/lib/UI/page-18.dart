import 'package:flutter/material.dart';

class page18 extends StatelessWidget {
  const page18({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff64D7BB),
      appBar: AppBar(
        leading: CircleAvatar(
          child: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.transparent,
        title: Text("Vocabulary",style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('image/35.png'))

        ],
      ),

    );
  }
}