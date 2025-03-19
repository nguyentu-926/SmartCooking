import 'package:flutter/material.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({Key? key}) : super(key: key);

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  String _imagePath = '';

  void _chooseFile() {
    setState(() {
      _imagePath = 'assets/images/nuong.png';
    });
    debugPrint('Chọn ảnh...');
  }

  void _onAdd() {
    if (_titleController.text.isEmpty || _priceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập tên và giá món')),
      );
      return;
    }
    final newRecipe = {
      'title': _titleController.text,
      'price': _priceController.text,
      'note': _noteController.text,
      'image': _imagePath.isEmpty ? 'assets/images/nuong.png' : _imagePath,
    };
    Navigator.pop(context, newRecipe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thêm món ăn"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Logo + SmartCooking
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
            // Box 1: Chọn ảnh
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Text("Ảnh:", style: TextStyle(fontSize: 16)),
                  InkWell(
                    onTap: _chooseFile,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text("choose file"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  if (_imagePath.isNotEmpty)
                    Image.asset(
                      _imagePath,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Box 2: Form nhập
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
                  const Text("Tên món:", style: TextStyle(fontSize: 16)),
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(isDense: true),
                  ),
                  const SizedBox(height: 12),
                  const Text("Giá:", style: TextStyle(fontSize: 16)),
                  TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(isDense: true),
                  ),
                  const SizedBox(height: 12),
                  const Text("Ghi chú:", style: TextStyle(fontSize: 16)),
                  TextField(
                    controller: _noteController,
                    maxLines: 3,
                    decoration: const InputDecoration(isDense: true),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onAdd,
                      child: const Text("Thêm"),
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
