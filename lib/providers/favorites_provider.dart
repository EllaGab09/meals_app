import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoritesNotifier extends StateNotifier<List<Meal>> {
  FavoritesNotifier() : super([]);

  bool toggleFavorite(Meal meal) {
    final bool mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
    return !mealIsFavorite;
  }
}

final StateNotifierProvider<FavoritesNotifier, List<Meal>> favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<Meal>>((ref) {
  return FavoritesNotifier();
});
