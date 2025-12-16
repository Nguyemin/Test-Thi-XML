import 'package:flutter/material.dart';

class FormDangnhap extends StatefulWidget {
  FormDangnhap({super.key});
  final _formKey = GlobalKey<FormState>();


  @override
  State<FormDangnhap> createState() => _FormDangnhapState();
}

class _FormDangnhapState extends State<FormDangnhap> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: MyAppBar(),
      body: myBody(),
    );
  }

  MyAppBar(){
    return AppBar(
      title: Text("Form Đăng Nhập"),
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
                icon: Icon(Icons.person),
                labelText: 'Tên đăng nhập',
                border: OutlineInputBorder()
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập tên đăng nhập';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Mật khẩu',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập mật khẩu';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (widget._formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Đăng nhập thành công')),
                  );
                }
              },
              child: Text(
                'Đăng Nhập',
                
              ),
            ),
          ],
        ),
      ),
    );
  }

}