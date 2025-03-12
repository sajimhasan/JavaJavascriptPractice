import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final String hindimage; 
  final String headtext;
  
   MyWidget({super.key,required this.hindimage, required this.headtext});

  @override
  Widget build(BuildContext context) {
    return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.asset(hindimage),
                    ),
                    Container(
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffF6F5F5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(headtext,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17
                            ),
                            overflow: TextOverflow.visible,
                            softWrap: true,
                            ),
                            
                            Row(
                              
                              children: [
                                Icon(Icons.star_purple500_rounded),
                                Text("মন্তব্য করতে পারেন"),
                              ],
                            ),
                            Row(
                              children: [
                                ElevatedButton(onPressed: (){

                                }, child: Icon(Icons.mic)),
                                Container(
                                  height: 20,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white54
                                  ),
                                  child: Row(
                                    children: [
                                    Icon(Icons.multitrack_audio_sharp),
                                    SizedBox(width: 4,),
                                    Text("Listen",style: TextStyle(
                                      overflow: TextOverflow.visible,
                                      
                                    ),)
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    
                  ],
                );
  }
}