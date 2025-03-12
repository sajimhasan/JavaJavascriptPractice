import 'package:flutter/material.dart';
import 'package:graman_kotha/unilt/customcontainerbutton.dart';

class Page13 extends StatefulWidget {
  const Page13({super.key});

  @override
  State<Page13> createState() => _Page13State();
}

class _Page13State extends State<Page13> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: CircleAvatar(
          backgroundColor: Colors.grey[100],
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite, color: Colors.grey, size: 28),
                const SizedBox(width: 8),
                ...List.generate(
                    4,
                    (index) => const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child:
                              Icon(Icons.favorite, color: Colors.red, size: 28),
                        )),
              ],
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Nazmun ! ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.grey),
                    ),
                    Text(
                      " What would like to practice?",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Customcontainerbutton(
                        heding: "German Phrases",
                        mainimage: "image/30.png",
                        ontap: () {}),
                        SizedBox(height: 40,),
                        Customcontainerbutton(heding: "Vocabulary", mainimage: "image/29.png", ontap: (){

                        })
                  ],
                ),
                Column(
                  children: [
                    Customcontainerbutton(heding: "Story time  ", mainimage: "image/27.png", ontap: (){}),
                    SizedBox(height: 40,),
                    Customcontainerbutton(heding: "Quiz", mainimage: "image/28.png", ontap: (){})

                  ],
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}
