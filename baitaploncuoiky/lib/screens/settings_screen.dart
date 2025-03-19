import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài Đặt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: const Text('Chọn màu chủ đạo'),
              onTap: () {
                // Logic chọn màu có thể được thêm vào đây
              },
            ),
            // Bạn có thể thêm các tùy chỉnh khác tại đây
          ],
        ),
      ),
    );
  }
}
