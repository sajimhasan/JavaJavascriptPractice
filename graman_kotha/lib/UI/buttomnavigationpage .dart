import 'package:flutter/material.dart';
import 'package:graman_kotha/UI/homepage2.dart';
import 'package:graman_kotha/UI/learnpage1.dart';
import 'package:graman_kotha/UI/profile2.dart';
import 'package:graman_kotha/UI/widegtpage2.dart';

class Buttomnavigationpage  extends StatefulWidget {
  const Buttomnavigationpage ({super.key});

  @override
  State<Buttomnavigationpage> createState() => _ButtomnavigationpageState();
}

class _ButtomnavigationpageState extends State<Buttomnavigationpage> {
   int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Homepage2(),
    const Widegtpage2(),Learnpage1(),

   Profile2(),
   
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


