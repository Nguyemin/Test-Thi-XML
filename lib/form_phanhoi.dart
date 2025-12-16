import 'package:flutter/material.dart';

class FormPhanhoi extends StatefulWidget {
  FormPhanhoi({super.key});
  final _formKey = GlobalKey<FormState>();


  @override
  State<FormPhanhoi> createState() => _FormPhanhoiState();
}

class _FormPhanhoiState extends State<FormPhanhoi> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: MyAppBar(),
      body: myBody(),
    );
  }

  MyAppBar(){
    return AppBar(
      title: Text("Gửi Phản Hồi"),
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      centerTitle: true,
    );
  }

  myBody(){
    return Form(
      key: widget._formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Họ Tên',
                border: OutlineInputBorder(),
                prefixIcon: Icon( Icons.person, color: Colors.teal, ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập họ tên';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Đánh Giá',
                border: OutlineInputBorder(),
                prefixIcon: Icon( Icons.star, color: Colors.teal, ),
              ),
              items: <String>['1 Sao', '2 Sao', '3 Sao', '4 Sao', '5 Sao']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng chọn loại phản hồi';
                }
                return null;
              },
            ),
           
            
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.feedback, color: Colors.teal,),
                labelText: 'Nội dung Phản Hồi',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập phản hồi';
                }
                return null;
              },            
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (widget._formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Đã gửi phản hồi')),
                  );
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.send),
                  SizedBox(width: 8),
                  Text('Gửi Phản Hồi'),
                ],
              ),
            ),  
          ],
        ),
      ),
    );
  }

}