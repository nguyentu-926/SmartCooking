// screens/category_detail_screen.dart
import 'package:flutter/material.dart';

class CategoryDetailScreen extends StatelessWidget {
  final Map<String, dynamic> categoryData; // Dữ liệu 1 danh mục (name, items)

  const CategoryDetailScreen({Key? key, required this.categoryData})
      : super(key: key);

  // Widget hiển thị mỗi món ăn (tương tự HomeScreen)
  Widget _buildItemCard(Map<String, dynamic> item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          // Ảnh món ăn
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              bottomLeft: Radius.circular(4),
            ),
            child: Image.asset(
              item['image'],
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          // Thông tin món ăn
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${item['price']}đ',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Nút Xóa & Chỉnh sửa
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  // TODO: Thêm logic xóa
                  debugPrint('Xóa món: ${item['title']}');
                },
                child: const Text(
                  'Xóa',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Thêm logic chỉnh sửa
                  debugPrint('Chỉnh sửa món: ${item['title']}');
                },
                child: const Text(
                  'Chỉnh sửa',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String catName = categoryData['name'];
    final List items = categoryData['items'];

    return Scaffold(
      appBar: AppBar(
        title: Text(catName),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Danh sách đầy đủ món ăn của danh mục
          ...items.map<Widget>((item) => _buildItemCard(item)).toList(),
          const SizedBox(height: 16),
          // Nút "Thêm" ở cuối trang
          ElevatedButton(
            onPressed: () {
              // TODO: Chuyển đến trang thêm món, hoặc mở dialog thêm món
              debugPrint("Thêm món trong danh mục $catName");
            },
            child: const Text("Thêm"),
          ),
        ],
      ),
    );
  }
}
