import 'package:flutter/material.dart';

class page19 extends StatefulWidget {
  const page19({super.key});

  @override
  _VocabularyPageState createState() => _VocabularyPageState();
}

class _VocabularyPageState extends State<page19> {
  int selectedIndex = 0; // Toggle button এর জন্য

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Vocabulary", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Vocabulary Banner Image
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset("image/36.png", fit: BoxFit.cover),
          ),

          // Toggle Buttons
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildToggleButton(0, "Word"),
                _buildToggleButton(1, "Pronunciation"),
                _buildToggleButton(2, "Meaning"),
              ],
            ),
          ),

          // Vocabulary List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: 10, // Number of vocabulary words
              itemBuilder: (context, index) {
                return _buildVocabularyRow(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Toggle Button
  Widget _buildToggleButton(int index, String text) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.shade700 : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(Icons.volume_up, color: isSelected ? Colors.white : Colors.black54, size: 16),
            SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Vocabulary Row
  Widget _buildVocabularyRow(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(3, (i) => _buildWordButton()),
      ),
    );
  }

  // Individual Word Button
  Widget _buildWordButton() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.volume_up, color: Colors.black54, size: 16),
            SizedBox(width: 5),
            Text("Hallo...", style: TextStyle(color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}