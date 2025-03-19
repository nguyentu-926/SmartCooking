import 'package:flutter/material.dart';

class DeleteRecipeScreen extends StatelessWidget {
  final Map<String, dynamic> itemData;

  const DeleteRecipeScreen({
    Key? key,
    this.itemData = const {
      'title': 'Món ăn mặc định',
      'price': '0',
      'note': 'Không có ghi chú',
      'image': 'assets/images/nuong.png',
      'category': 'Nướng',
    },
  }) : super(key: key);

  void _onDelete(BuildContext context) {
    debugPrint('Xóa món: ${itemData['title']}');
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final String title = itemData['title'] ?? 'Không có tên';
    final String price = itemData['price'] ?? '0';
    final String note = itemData['note'] ?? 'Không có ghi chú';
    final String image = itemData['image'] ?? 'assets/images/nuong.png';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Xóa món"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Header: Logo + SmartCooking
            Center(
              child: Image.asset(
                'assets/images/chef.jpg',
                height: 100,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'SmartCooking',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 16),
            // Box 1: Hiển thị ảnh món ăn
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Image.asset(
                  image,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Box 2: Hiển thị thông tin món
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Tên: ",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        "Giá: ",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$priceđ',
                        style: const TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ghi chú: ",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          note,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () => _onDelete(context),
                      child: const Text(
                        "Xóa",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
