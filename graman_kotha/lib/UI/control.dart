import 'package:flutter/material.dart';
import 'package:graman_kotha/unilt/fildcontainer.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){

        }, icon: Icon(Icons.arrow_back_ios)),
        title: Text("Lesson",style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
           Icon(Icons.favorite, color: Colors.grey[300], size: 28),
                const SizedBox(width: 8),
                ...List.generate(4, (index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(Icons.favorite, color: Colors.red, size: 28),
                )),    
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Column(
                  children: [
                    MyWidget(hindimage: "image/13.png", headtext: "Comment vas-tu luch bin spat heute "),
                    SizedBox(height: 50,),
                    MyWidget(hindimage: "image/15.png", headtext: "Comment vas-tu Ich bin spat heute"),

                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 40,),
                    MyWidget(hindimage: "image/16.png", headtext: 'আমি ঠিক আছি আমি জার্মান ভাষা জানি না'),
                    SizedBox(height: 40,),
                    MyWidget(hindimage: "image/14.png", headtext: 'আমি ঠিক আছি আমি জার্মান ভাষা জানি না')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}