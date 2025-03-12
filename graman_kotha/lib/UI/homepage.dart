import 'package:flutter/material.dart';
import 'package:graman_kotha/UI/control.dart';
import 'package:graman_kotha/UI/grammer.dart';
import 'package:graman_kotha/UI/profile.dart';
import 'package:graman_kotha/UI/rotine.dart';
import 'package:graman_kotha/UI/vocabolari.dart';


import 'package:graman_kotha/UI/widget.dart';
import 'package:graman_kotha/unilt/levelfrom.dart';

class LevelSelectionPage extends StatefulWidget {
  const LevelSelectionPage({super.key});

  @override
  _LevelSelectionPageState createState() => _LevelSelectionPageState();
}

class _LevelSelectionPageState extends State<LevelSelectionPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const WidgetsPage(),LearnPage(),

   Profile(),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     
      
      body: _pages[_selectedIndex], // ✅ Switches page content

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // ✅ Updates selected tab
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: const Color(0xff2E826E),
        unselectedItemColor: Colors.grey[400],
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.widgets), label: "Widgets"),
          BottomNavigationBarItem(icon: Icon(Icons.settings_input_composite), label: "Learn"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// Placeholder pages
class HomePage extends StatelessWidget {
  const HomePage({super.key});
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
      body: Column(
        children: [
          SizedBox(height: 10,),
       Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite, color:Colors.red, size: 28),
                const SizedBox(width: 8),
                ...List.generate(4, (index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(Icons.favorite, color:Colors.grey, size: 28), 
                )), 
              ],
            ),
          SizedBox(height: 15,),
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
           SizedBox(height: 17,),
           Levelfrom(containercolor: Color(0xff2E826E), textcolor: Colors.white, laveltext: "leval 1", ontap: (){}),
           SizedBox(height: 10,),
           Levelfrom(containercolor: Colors.grey, textcolor: Colors.white60, laveltext: "Level 2", ontap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> Rotine()));
           }),
           SizedBox(height: 10,),
           Levelfrom(containercolor: Colors.grey, textcolor: Colors.white60, laveltext: "Level 3", ontap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> Vocabolari()));
           }),
           SizedBox(height: 10,),Levelfrom(containercolor: Colors.grey, textcolor: Colors.white60, laveltext: "Level 4", ontap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> Grammer()));
           }),
           SizedBox(height: 10,)
            ],
          )
       
      );
  
  }
}





