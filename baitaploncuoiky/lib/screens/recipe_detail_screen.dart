import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final recipe = ModalRoute.of(context)!.settings.arguments as Recipe;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi Tiết Món Ăn'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.pushNamed(context, '/edit_recipe', arguments: recipe);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recipe.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Thành phần:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(recipe.ingredients),
              const SizedBox(height: 10),
              const Text(
                'Cách chế biến:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(recipe.instructions),
            ],
          ),
        ),
      ),
    );
  }
}
