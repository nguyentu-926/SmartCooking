import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final DateTime _startDate = DateTime(2025, 2, 1);
  final DateTime _endDate = DateTime(2025, 2, 28);

  final List<Map<String, dynamic>> _orders = [
    {
      'orderId': '#201995',
      'date': DateTime(2025, 2, 19),
      'itemName': 'Set nướng 1 người',
      'price': '118.000',
      'quantity': 2,
      'status': 'Đã thanh toán',
      'paymentMethod': 'Tiền mặt'
    },
    {
      'orderId': '#201968',
      'date': DateTime(2025, 2, 19),
      'itemName': 'Set nướng 1 người',
      'price': '118.000',
      'quantity': 2,
      'status': 'Đã thanh toán',
      'paymentMethod': 'Tiền mặt'
    },
    {
      'orderId': '#202001',
      'date': DateTime(2025, 2, 20),
      'itemName': 'Set lẩu 2-3 người',
      'price': '259.000',
      'quantity': 1,
      'status': 'Chưa thanh toán',
      'paymentMethod': 'Tiền mặt'
    },
  ];

  List<Map<String, dynamic>> get filteredOrders {
    return _orders.where((order) {
      final DateTime date = order['date'] as DateTime;
      return (date.isAtSameMomentAs(_startDate) || date.isAfter(_startDate)) &&
          (date.isAtSameMomentAs(_endDate)   || date.isBefore(_endDate));
    }).toList();
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    return '$day/$month/$year';
  }

  Widget _buildDateRangeBox() {
    final String dateRangeText =
        '${_formatDate(_startDate)} - ${_formatDate(_endDate)}';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.calendar_today, color: Colors.orange),
          const SizedBox(width: 8),
          Text(
            dateRangeText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children:
        filteredOrders.map((order) => _buildOrderCard(order)).toList(),
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    final String orderId = order['orderId'];
    final DateTime date = order['date'];
    final String itemName = order['itemName'];
    final String price = order['price'];
    final int quantity = order['quantity'];
    final String status = order['status'];
    final String paymentMethod = order['paymentMethod'];

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/nuong.png',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderId,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$price (${quantity} phần) - $paymentMethod',
                    style: const TextStyle(color: Colors.brown),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _formatDate(date),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    status,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đơn hàng"),
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
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 16),
            // Box 1: Khoảng ngày
            _buildDateRangeBox(),
            const SizedBox(height: 16),
            // Box 2: Danh sách đơn hàng
            _buildOrdersBox(),
          ],
        ),
      ),
    );
  }
}
