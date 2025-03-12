import 'package:flutter/material.dart';
// Placeholder pages
class Homepage3 extends StatelessWidget {
  const Homepage3({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(children: [
                SizedBox(
          height: 10,
                ),
                Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, color: Colors.red, size: 28),
            const SizedBox(width: 8),
            ...List.generate(
                4,
                (index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(Icons.favorite, color: Colors.grey, size: 28),
                    )),
          ],
                ),
                SizedBox(
          height: 15,
                ),
                Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("image/8.png"),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Hello, Danilo!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    "At which level would you like to learn?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
                ),
                SizedBox(height: 20,),
                Image.asset("image/23.png"),
                SizedBox(height: 10,),
                Text("Level 1",style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20
                ),),
                SizedBox(height: 20,),
                Image.asset("image/24.png"),
                SizedBox(height: 10,),
                Text("Level 2",style: TextStyle(
          fontSize: 20,fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 20,),
                Image.asset("image/24.png"),
                SizedBox(height: 10,),
                Text("Level 3 ",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),)
              ]),
        ));
  }
}