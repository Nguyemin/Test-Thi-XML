import 'package:flutter/material.dart';
import 'package:flutter_nhom2/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài kiểm tra di động',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Homepage(), 
    );
  }
}