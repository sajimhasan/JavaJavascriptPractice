import 'package:flutter/material.dart';

class Customtextfile extends StatelessWidget {
  final String hinttext; 
  final String text; 
   Customtextfile({super.key,required this.hinttext, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(text),

                        ],
                      ),
                      TextField(
                    decoration: InputDecoration(
                      hintText: hinttext,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black
                        )
                      )
                    ),
                   
    )]));
  }
}