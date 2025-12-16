import 'package:flutter/material.dart';

class CountChangeApp extends StatefulWidget {
  const CountChangeApp({super.key});

  @override
  State<CountChangeApp> createState() => _CountChangeAppState();
}

class _CountChangeAppState extends State<CountChangeApp> {
  int count = 0;
  void Giam(){
    if(count > 0){
      setState(() {
      count --;
    });
    }
  }
  void Tang(){
    setState(() {
      count ++;
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
      title: Text("Ứng dụng đếm số"),
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      centerTitle: true,
    );
  }

  myBody(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Số hiện tại"),
        Text("$count", style: TextStyle(fontSize: 50, color: Colors.red),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            ElevatedButton.icon(
              onPressed: Giam,
               label: Text("Giảm",),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, 
                foregroundColor: Colors.white, 
                
              ),
            ),
            ElevatedButton.icon(
              onPressed: (){
                setState(() {
                  count = 0;
                });
              },
              label: Text("Đặt lại",),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey, 
                foregroundColor: Colors.white, 
                
              ),
            ),
            ElevatedButton.icon(
              onPressed: Tang,
              label: Text("Tăng",),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, 
                foregroundColor: Colors.white, 
                
              ),
            )
          ],
        )
      ],
    );
  }
}