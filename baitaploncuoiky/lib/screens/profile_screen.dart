import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông tin cá nhân"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            // Phần thông tin tài khoản: ảnh đại diện, tên, email
            Row(
              children: [
                // Ảnh đại diện
                ClipOval(
                  child: Image.asset(
                    'assets/images/avatar.jpg', // Đảm bảo bạn có avatar.png trong assets
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                // Tên, email
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Tôi là chủ cửa hàng',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'toilachuquan@gmail.com',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),

            // Danh sách các mục
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Thông tin tài khoản"),
              onTap: () {
                // TODO: Mở trang thông tin tài khoản
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text("Thay mật khẩu"),
              onTap: () {
                // TODO: Mở trang thay đổi mật khẩu
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Cài đặt"),
              onTap: () {
                // TODO: Mở trang cài đặt
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                "Đăng xuất",
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                // TODO: Thực hiện logic đăng xuất
                // Ví dụ: Navigator.pushReplacementNamed(context, '/login');
              },
            ),

            const SizedBox(height: 20),
            // Nút Đăng xuất lớn ở cuối trang
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // TODO: Thực hiện logic đăng xuất
                // Ví dụ: Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text(
                "Đăng xuất",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
