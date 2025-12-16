import 'package:flutter/material.dart';

class MyPlace extends StatelessWidget{
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          block1(),
          
          block2(), 
          block3(),
          block4(),
        ],
      ),
    );
  }
}

Widget block1(){
  var src = 'https://images.unsplash.com/photo-1758967905380-f62a8c8fd373?q=80&w=1931&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  return Image.network(src);
}


Widget block2(){
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text('This category showcases digitally rendered', style: TextStyle(fontWeight: FontWeight.w600),),
            Text('creations that blend technology and art,'),
          ],
        ),
        Row(
          children: [
            Icon(Icons.star, color: Colors.red,size: 18,),
            Text('41'),
          ],
        ),
      ],
    ),
  );
}


Widget block3(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(Icons.call, color: Colors.blue,),
            Text('CALL', style: TextStyle(color: Colors.blue),),
          ],
        ),
        Column(
          children: [
            Icon(Icons.near_me, color: Colors.blue,),
            Text('ROUTE', style: TextStyle(color: Colors.blue),),
          ],
        ),
        Column(
          children: [
            Icon(Icons.share, color: Colors.blue,),
            Text('SHARE', style: TextStyle(color: Colors.blue),),
          ],
        ),
      ],
    ),
  );
}


Widget block4(){
  var data = 'This category showcases digitally rendered creations that blend technology and art, exploring the limitless potential of digital creativity.'
'This category showcases nature’s beauty, from vast landscapes to macro details, transporting viewers to the outdoors.';   
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Text(data),
  );
}