import 'dart:convert'; // Để xử lý JSON
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Gọi API

class ProfileScreen extends StatefulWidget {
  final String accessToken;

  const ProfileScreen({super.key, required this.accessToken});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Biến chứa thông tin user lấy từ API
  Map<String, dynamic>? userData;
  bool _isLoading = true; // Trạng thái đang tải dữ liệu

  @override
  void initState() {
    super.initState();
    // Gọi hàm lấy dữ liệu ngay khi màn hình vừa mở
    getUserData();
  }

  // Hàm gọi API lấy thông tin chi tiết (auth/me)
  Future<void> getUserData() async {
    final url = Uri.parse('https://dummyjson.com/auth/me');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization':
              'Bearer ${widget.accessToken}', // Gửi token lên server xác thực
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Thành công: Cập nhật dữ liệu vào biến userData
        setState(() {
          userData = jsonDecode(response.body);
          _isLoading = false;
        });
      } else {
        // Thất bại (Token hết hạn hoặc lỗi server)
        setState(() => _isLoading = false);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Lỗi tải dữ liệu: ${response.statusCode}')),
          );
        }
      }
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Lỗi kết nối: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hồ sơ của tôi"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            ) // Hiện vòng xoay khi đang tải
          : userData == null
          ? const Center(child: Text("Không tải được thông tin user"))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  // 1. Ảnh đại diện (Avatar)
                  Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.teal.shade100,
                      backgroundImage: NetworkImage(
                        userData!['image'],
                      ), // Lấy link ảnh từ API
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 2. Tên đầy đủ
                  Text(
                    "${userData!['firstName']} ${userData!['lastName']}",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // 3. Email
                  Text(
                    userData!['email'],
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 30),

                  // 4. Thẻ thông tin chi tiết (Card)
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.person_outline,
                            color: Colors.teal,
                          ),
                          title: const Text("Tên đăng nhập"),
                          subtitle: Text(userData!['username']),
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.phone, color: Colors.teal),
                          title: const Text("Số điện thoại"),
                          subtitle: Text(userData!['phone'] ?? 'Chưa cập nhật'),
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(
                            Icons.transgender,
                            color: Colors.teal,
                          ),
                          title: const Text("Giới tính"),
                          subtitle: Text(userData!['gender']),
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(
                            Icons.data_array,
                            color: Colors.teal,
                          ),
                          title: const Text("Ngày sinh: "),
                          subtitle: Text(userData!['birthDate']),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // 5. Nút Đăng Xuất
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        //Navigator.pop(context); // Quay về màn hình login
                      },
                      icon: const Icon(Icons.logout),
                      label: const Text("Đăng Xuất"),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
