import 'dart:convert'; // Để dùng jsonEncode, jsonDecode
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Để gọi API
import 'profile_screen.dart'; // Import màn hình Profile để chuyển trang

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Controller để lấy dữ liệu người dùng nhập
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false; // Trạng thái đang tải

  // --- Hàm xử lý API ---
  Future<void> handleLogin() async {
    const String apiUrl = 'https://dummyjson.com/auth/login';

    setState(() => _isLoading = true); // Bật vòng xoay loading

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': _usernameController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        // 1. Giải mã JSON
        final data = jsonDecode(response.body);
        String token = data['accessToken'] ?? data['token'];

        // 2. Chuyển sang màn hình Profile và gửi kèm Token
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Đăng nhập thành công!')),
          );
          
          Navigator.pushReplacement( // Dùng pushReplacement để không cho back lại màn hình login
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(accessToken: token),
            ),
          );
        }
      } else {
        // Lỗi từ server (sai pass, user không tồn tại...)
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Đăng nhập thất bại. Vui lòng kiểm tra lại!')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi kết nối: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false); // Tắt loading
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đăng Nhập"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ô nhập User
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Tên đăng nhập',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  hintText: 'kminchelle', // Gợi ý test
                ),
                validator: (value) => (value!.isEmpty) ? 'Vui lòng nhập tên' : null,
              ),
              const SizedBox(height: 20),
              
              // Ô nhập Password
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Mật khẩu',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  hintText: '0lelplR', // Gợi ý test
                ),
                validator: (value) => (value!.isEmpty) ? 'Vui lòng nhập mật khẩu' : null,
              ),
              const SizedBox(height: 30),

              // Nút bấm hoặc Loading
              _isLoading
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            handleLogin();
                          }
                        },
                        child: const Text('ĐĂNG NHẬP', style: TextStyle(fontSize: 16)),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}