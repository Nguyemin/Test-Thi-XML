import 'package:flutter/material.dart';
import 'homepage.dart'; // import để quay về menu chính

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bài 1"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Quay về menu chính
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const Homepage()),
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: Text(
              'Xin Chào Mọi Người',
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
          ),
          Icon(Icons.heart_broken, size: 100, color: Colors.red),
          Text(
            "Lập trình di động - nhóm 2",
            style: TextStyle(color: Colors.blueAccent, fontSize: 40),
          ),
        ],
      ),
    );
  }
}