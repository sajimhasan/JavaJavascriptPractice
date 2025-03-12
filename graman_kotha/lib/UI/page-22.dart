import 'package:flutter/material.dart';

class page22 extends StatelessWidget {
  const page22({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              
             
              Row(
                children: [
                  CircleAvatar(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      "Earn hearts",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // For center alignment
                ],
              ),

              const SizedBox(height: 32),
              
              // App Logo
              Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF7DCEA0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  "image/2.png",
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 40),
              
              // Jumping Students Image
              Image.asset(
                "image/38.png",
                height: 280,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 40),
              Image.asset("image/39.png"),
              SizedBox(height: 40,),
              
              // Hearts Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(2, (index) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(Icons.favorite, color: Colors.red, size: 28),
                  )),
                  ...List.generate(3, (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(Icons.favorite, color: Colors.grey[300], size: 28),
                  )),
                ],
              ),

              const Spacer(),
              
             
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2E826E),
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  
                },
                child: const Text(
                  "Play Advertise",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 40),
              
            
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}