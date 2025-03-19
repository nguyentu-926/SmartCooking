import '../models/recipe.dart';

class RecipeService {
  static final RecipeService instance = RecipeService._internal();

  factory RecipeService() {
    return instance;
  }

  RecipeService._internal();

  final List<Recipe> _recipes = [];

  List<Recipe> getRecipes() {
    return _recipes;
  }

  int getNextId() {
    if (_recipes.isEmpty) {
      return 1;
    } else {
      return _recipes.last.id + 1;
    }
  }

  void addRecipe(Recipe recipe) {
    _recipes.add(recipe);
  }

  void updateRecipe(Recipe updatedRecipe) {
    int index = _recipes.indexWhere((recipe) => recipe.id == updatedRecipe.id);
    if (index != -1) {
      _recipes[index] = updatedRecipe;
    }
  }

  void deleteRecipe(int id) {
    _recipes.removeWhere((recipe) => recipe.id == id);
  }
}
