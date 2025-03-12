import 'package:flutter/material.dart';
import 'package:graman_kotha/unilt/customrowofpage15.dart';

class Page15 extends StatelessWidget {
  const Page15({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset("image/32.png"),
            SizedBox(height: 15,),
            Text("German Phrases",style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 30
            ),),
            SizedBox(height: 30,),
           Customrowofpage15(maintext: "German"),
           SizedBox(height: 10,),
           Customrowofpage15(maintext: "Pronunciation"),
           SizedBox(height: 10,),
           Customrowofpage15(maintext: "Meaning "),
           SizedBox(height: 20,),
           customrowmakebystart(maintext: 'German'),
           SizedBox(height: 10,),
           customrowmakebystart(maintext: 'Pronunciation'),
           SizedBox(height: 10,),
           customrowmakebystart(maintext: 'Meaning '),
           SizedBox(height:20,),
           Customrowofpage15(maintext: "German"),
           SizedBox(height: 10,), Customrowofpage15(maintext: "Pronunction"),
           SizedBox(height: 10,),
            Customrowofpage15(maintext: "Meaning"),
           SizedBox(height: 10,),
           
          
           
          ],
        ),
      ),

    );
  }
}