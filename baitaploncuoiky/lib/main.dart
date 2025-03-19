import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/add_recipe_screen.dart';
// Không định nghĩa route cho EditRecipeScreen, DeleteRecipeScreen,
// vì chúng nhận tham số itemData qua Navigator.push.
import 'screens/recipe_detail_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartCooking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      // Ứng dụng khởi chạy với màn hình đăng nhập
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        // Sau khi đăng nhập thành công, chuyển sang MainScreen
        '/main': (context) => const MainScreen(),
        '/add_recipe': (context) => const AddRecipeScreen(),
        // '/edit_recipe': (context) => const EditRecipeScreen(), // Không dùng
        // '/delete_recipe': (context) => const DeleteRecipeScreen(), // Không dùng
        '/recipe_detail': (context) => const RecipeDetailScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}

/// MainScreen chứa BottomNavigationBar và quản lý 3 trang con:
/// HomeScreen, OrdersScreen, ProfileScreen
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const OrdersScreen(),
    const ProfileScreen(), // Đảm bảo file profile_screen.dart đã được tạo
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Đơn hàng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Cá nhân',
          ),
        ],
      ),
    );
  }
}
