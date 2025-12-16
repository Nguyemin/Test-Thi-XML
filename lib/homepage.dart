import 'package:flutter/material.dart';
import 'package:flutter_nhom2/change_color_app.dart';
import 'package:flutter_nhom2/count_change_app.dart';
import 'package:flutter_nhom2/form_dangky.dart';
import 'package:flutter_nhom2/form_dangnhap.dart';
import 'package:flutter_nhom2/form_phanhoi.dart';
import 'package:flutter_nhom2/login_screen.dart';
import 'package:flutter_nhom2/my_classroom.dart';
import 'package:flutter_nhom2/my_hom_page.dart';
import 'package:flutter_nhom2/my_place.dart';
import 'package:flutter_nhom2/my_product.dart';
import 'package:flutter_nhom2/newspage.dart';
import 'package:flutter_nhom2/setting_page.dart';
import 'package:flutter_nhom2/tinh_BMI.dart';
import 'package:flutter_nhom2/welcom_charlie.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            // ✅ HEADER CÓ ẢNH BO TRÒN
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/a6.jpg"),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Nguyễn Minh Nhật",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // ✅ MENU ITEM
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  buildMenuItem(Icons.home, "Trang chủ", const Homepage()),
                  buildMenuItem(Icons.settings, "Cài đặt", const SettingsPage()),
                  buildMenuItem(Icons.book, "Bài 1", const MyHomePage()),
                  buildMenuItem(Icons.color_lens, "Bài 2", MyPlace()),
                  buildMenuItem(Icons.dashboard_customize, "Bài 3", GuideToLayout()),
                  buildMenuItem(Icons.color_lens, "Bài 4", const ChangeColorApp()),
                  buildMenuItem(Icons.calculate, "Bài 5", const CountChangeApp()),
                  buildMenuItem(Icons.person_add, "Bài 6", FormDangky()),
                  buildMenuItem(Icons.person_add, "Bài 7", MyClassroom()),
                  buildMenuItem(Icons.login, "Bài 8", FormDangnhap()),
                  buildMenuItem(Icons.feedback, "Bài 9", FormPhanhoi()),
                  buildMenuItem(Icons.lock, "Bài 10", LoginScreen()),
                  buildMenuItem(Icons.monitor_weight, "Bài 11", TinhBmi()),
                  buildMenuItem(Icons.shopping_bag, "Bài 12", MyProduct()),
                  buildMenuItem(Icons.newspaper, "Bài 13", MyNewsPage()),
                ],
              ),
            ),
          ],
        ),
      ),

      // ✅ TRANG CHỦ
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Thông tin cá nhân",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 16),

              // ✅ THẺ THÔNG TIN
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade300, Colors.blue.shade100],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/images/a6.jpg"),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Nguyễn Minh Nhật",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 20, 16, 16),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Lớp: Kỹ Thuật Phần Mềm K46",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 20, 16, 16),
                          ),
                        ),
                        Text(
                          "MSV: 22T1080024",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 20, 16, 16),
                          ),
                        ),
                        Text(
                          "Học phần: LTUD cho các thiết bị di động",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 20, 16, 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ HÀM TẠO MENU ITEM
  Widget buildMenuItem(IconData icon, String title, Widget destination) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => destination));
      },
      splashColor: Colors.blue.withOpacity(0.2),
      highlightColor: Colors.blue.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Icon(icon, color: Colors.blueAccent),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}