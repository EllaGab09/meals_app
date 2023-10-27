import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';

class MealsNotifier extends StateNotifier<List<Meal>> {
  MealsNotifier()
      : super(dummyMeals); // Initialize with the list of dummy meals

  // Method that takes a meal id and a rating enum option. It updates the rating of specified meal
  void rateMeal(String mealId, Rating newRating) {
    final meals = [...state]; // Copy current meals
    meals.firstWhere((Meal meal) => meal.id == mealId).rating =
        newRating; // Find and update the meal's rating with the new rating

    state = meals; // Update the state with the modified list of meals
  }

  Meal getMeal(String id) {
    return state.firstWhere(
        (meal) => meal.id == id); // Find and return the meal with the given ID
  }
}

final mealsProvider = StateNotifierProvider<MealsNotifier, List<Meal>>((ref) {
  return MealsNotifier(); // Create and return an instance of MealsNotifier
});
