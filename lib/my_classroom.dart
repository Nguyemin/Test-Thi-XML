import 'package:flutter/material.dart';

class MyClassroom extends StatelessWidget {
  const MyClassroom({super.key});

  final String src =
      "https://images.unsplash.com/photo-1519114056088-b877fe073a5e?q=80&w=1033&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return courseCard(index);
        },
      ),
    );
  }

  Widget courseCard(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(src),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thông tin khóa học
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "XML và ứng dụng - Nhóm ${index + 1}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "2025-2026.TIN12342423${index + 1}",
                style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Số Học Viên: ${40 + index}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // Icon menu
          Icon(Icons.more_horiz, color: Colors.white),
        ],
      ),
    );
  }
}