
import 'dart:math';
import 'package:flutter/material.dart';

class ChangeColorApp extends StatefulWidget {
  const ChangeColorApp({super.key});

  @override
  State<ChangeColorApp> createState() => _ChangeColorAppState();
}

class _ChangeColorAppState extends State<ChangeColorApp> {
  
  late Color currentColor = Colors.purple;
  List<Color> colors  = [Colors.purple, Colors.orange, Colors.green, Colors.black];
  @override
  void initState() {
    super.initState();
    currentColor = Colors.purple;
  }
  void changeColor(){
    var random = Random();
    setState(() {
      currentColor = colors[random.nextInt(colors.length)];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: myBody(),
    );
  }
  MyAppBar(){
    return AppBar(
      title: Text("Ứng dụng đổi màu nền"),
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      centerTitle: true,
    );
  }
  myBody(){
    return Container(
      
      decoration: BoxDecoration(
        color: currentColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Màu hiện tại',),
          Text("Tím"),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: changeColor,
                label: Text('Đổi màu'),
              ) ,
              ElevatedButton.icon(
                onPressed: (){},
                label: Text('Set lại'),
              ) ,
            ],
          )
        ],
      ),
    );
  }
}