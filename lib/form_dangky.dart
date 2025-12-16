import 'package:flutter/material.dart';

class FormDangky extends StatefulWidget {
  FormDangky({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  State<FormDangky> createState() => _FormDangkyState();
}

class _FormDangkyState extends State<FormDangky> {
  final _matKhauController = TextEditingController();
  final _xacNhanMatKhauController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _matKhauController.dispose();
    _xacNhanMatKhauController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: myBody(),
    );
  }

  MyAppBar() {
    return AppBar(
      title: Text("Form Đăng Ký"),
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      centerTitle: true,
    );
  }

  myBody() {
    return Form(
      key: widget._formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tên đăng nhập
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Tên đăng nhập',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập tên đăng nhập';
                }
                return null;
              },
            ),
            SizedBox(height: 20),

            // Email
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                icon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập email';
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Email không hợp lệ';
                }
                return null;
              },
            ),
            SizedBox(height: 20),

            // Mật khẩu
            TextFormField(
              controller: _matKhauController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                icon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập mật khẩu';
                }
                return null;
              },
            ),
            SizedBox(height: 20),

            // Xác nhận mật khẩu
            TextFormField(
              controller: _xacNhanMatKhauController,
              obscureText: _obscureConfirmPassword,
              decoration: InputDecoration(
                labelText: 'Xác nhận mật khẩu',
                icon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value != _matKhauController.text) {
                  return 'Mật khẩu không khớp';
                }
                return null;
              },
            ),
            SizedBox(height: 20),

            // Nút đăng ký
            ElevatedButton(
              onPressed: () {
                if (widget._formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Đăng ký thành công')),
                  );
                }
              },
              child: Text('Đăng Ký'),
            ),
          ],
        ),
      ),
    );
  }
}