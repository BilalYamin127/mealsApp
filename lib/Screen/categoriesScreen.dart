import 'package:flutter/material.dart';
import 'package:meals_app/Widget/Category-Grid-Items.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/Screen/mealsScreen.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.OnfavriotButtonPressed});
  final void Function (Meal meal) OnfavriotButtonPressed;

  @override
  Widget build(BuildContext context) {
    // print(availableCategories);

    void _selectcategory(BuildContext context,Category category) {
    final filteredMeals=  dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) =>  MealsScreen(
            title: category.title,
            meals: filteredMeals,
            OnfavriotButtonPressed: OnfavriotButtonPressed,
          ),
        ),
      ); // Navigator.push(context, route)
    }

    return  GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: [
          // availableCategories.
          // map((category) => CategoryGridItems(category: category)).toList(),
          for (final category in availableCategories)
            CategoryGridItems(
              category: category,
              OnselectedCategory: (){
                _selectcategory(context, category);
              }
            )
        ],

    );
  }
}
