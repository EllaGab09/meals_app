import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  // Method to navigate to the meal details screen
  void selectMeal(Meal meal, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    // Check if there are no meals to display and show a backup screen
    if (meals.isEmpty) {
      content = Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "No meals found!",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(height: 16),
          const Icon(Icons.sentiment_dissatisfied),
        ],
      ));
    } else {
      // Display a list of meals using the MealItem widget
      content = ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: meals[index],
            onSelectMeal: (meal) {
              selectMeal(meal, context);
            },
          );
        },
        itemCount: meals.length,
      );
    }

    if (title == null) {
      return content; // show just the content if there is no title
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content, // Display the content within a Scaffold with an app bar
    );
  }
}
