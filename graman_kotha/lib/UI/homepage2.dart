import 'package:flutter/material.dart';
import 'package:graman_kotha/UI/homepage3.dart';
import 'package:graman_kotha/UI/learnpage1.dart';
import 'package:graman_kotha/UI/profile2.dart';
import 'package:graman_kotha/UI/widget.dart';

class Homepage2 extends StatefulWidget {
  const Homepage2({super.key});

  @override
  LevelSelectionPageState createState() => LevelSelectionPageState();
}

class LevelSelectionPageState extends State<Homepage2> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Homepage3(), // Fixed infinite loop issue
    const WidgetsPage(),
    Learnpage1(),
    Profile2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
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