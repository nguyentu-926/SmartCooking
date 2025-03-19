import 'package:flutter/material.dart';
import 'category_detail_screen.dart';
import 'add_recipe_screen.dart';
import 'edit_recipe_screen.dart';
import 'delete_recipe_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Chỉ mục danh mục (Tất cả = 0, Nướng = 1, Lẩu = 2, Cơm = 3)
  int _selectedCategoryIndex = 0;

  // Danh sách tên danh mục
  final List<String> _categoryNames = ['Tất cả', 'Nướng', 'Lẩu', 'Cơm'];

  // Danh sách món ăn (ví dụ)
  List<Map<String, dynamic>> _allRecipes = [
    {
      'title': 'Set nướng 1-2 người',
      'price': '159.000',
      'note': '',
      'image': 'assets/images/nuong.png',
    },
    {
      'title': 'Set nướng 3-4 người',
      'price': '359.000',
      'note': '',
      'image': 'assets/images/nuong.png',
    },
    {
      'title': 'Set lẩu 1-2 người',
      'price': '159.000',
      'note': '',
      'image': 'assets/images/lau.png',
    },
    {
      'title': 'Set lẩu 3-4 người',
      'price': '359.000',
      'note': '',
      'image': 'assets/images/lau.png',
    },
    {
      'title': 'Set cơm 3-4 người',
      'price': '359.000',
      'note': '',
      'image': 'assets/images/com.png',
    },
  ];

  // Lọc món ăn theo danh mục (ví dụ)
  List<Map<String, dynamic>> get displayedRecipes {
    if (_selectedCategoryIndex == 0) {
      return _allRecipes;
    } else {
      final selectedName = _categoryNames[_selectedCategoryIndex].toLowerCase();
      return _allRecipes.where((r) =>
          r['title'].toString().toLowerCase().contains(selectedName)
      ).toList();
    }
  }

  // Widget thanh tìm kiếm
  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Tìm kiếm đồ ăn...',
        prefixIcon: const Icon(Icons.search),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }

  // Widget ChoiceChip danh mục
  Widget _buildCategoryChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(_categoryNames.length, (index) {
          final isSelected = index == _selectedCategoryIndex;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text(_categoryNames[index]),
              selected: isSelected,
              selectedColor: Colors.orange,
              onSelected: (bool selected) {
                setState(() {
                  _selectedCategoryIndex = index;
                });
              },
            ),
          );
        }),
      ),
    );
  }

  // Widget hiển thị mỗi món ăn dưới dạng Card
  Widget _buildItemCard(Map<String, dynamic> item, int index) {
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
          // Nút "Chỉnh sửa" & "Xóa"
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () async {
                  final updatedRecipe = await Navigator.push<Map<String, dynamic>>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditRecipeScreen(itemData: item),
                    ),
                  );
                  if (updatedRecipe != null) {
                    setState(() {
                      _allRecipes[index] = updatedRecipe;
                    });
                  }
                },
                child: const Text('Chỉnh sửa', style: TextStyle(color: Colors.blue)),
              ),
              TextButton(
                onPressed: () async {
                  final shouldDelete = await Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeleteRecipeScreen(itemData: item),
                    ),
                  );
                  if (shouldDelete == true) {
                    setState(() {
                      _allRecipes.removeAt(index);
                    });
                  }
                },
                child: const Text('Xóa', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  // Tạo danh sách widget header (logo, tên, tìm kiếm, danh mục)
  List<Widget> _buildHeaderWidgets() {
    return [
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
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange,
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 16),
      _buildSearchBar(),
      const SizedBox(height: 12),
      _buildCategoryChips(),
      const SizedBox(height: 12),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Tạo một danh sách các widget: header + danh sách món ăn
    final headerWidgets = _buildHeaderWidgets();
    final int headerCount = headerWidgets.length;
    final int recipeCount = displayedRecipes.length;
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          itemCount: headerCount + recipeCount,
          itemBuilder: (context, index) {
            if (index < headerCount) {
              return headerWidgets[index];
            } else {
              final recipeIndex = index - headerCount;
              return _buildItemCard(displayedRecipes[recipeIndex], recipeIndex);
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newRecipe = await Navigator.push<Map<String, dynamic>>(
            context,
            MaterialPageRoute(
              builder: (context) => const AddRecipeScreen(),
            ),
          );
          if (newRecipe != null) {
            setState(() {
              _allRecipes.insert(0, newRecipe);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
