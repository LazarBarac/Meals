import 'package:flutter/material.dart';
import 'package:meals/data/meals_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToogleFavouriteMeal,
  });

  final void Function(Meal meal) onToogleFavouriteMeal;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeal =
        meals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeal,
          onToogleFavouriteMeal: onToogleFavouriteMeal,
        ),
      ),
    ); //Navigator.of(context).push(route);
  }

  @override
  Widget build(context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            onSelectMeal: () {
              _selectCategory(context, category);
            },
            category: category,
          ),
      ],
    );
  }
}
