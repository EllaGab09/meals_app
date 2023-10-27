import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/widgets/rating.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    required this.meal,
    super.key,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(favoritesProvider).contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final bool wasAdded =
                    ref.read(favoritesProvider.notifier).toggleFavorite(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(wasAdded
                        ? 'Added to favorites'
                        : 'Removed from favorites'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).colorScheme.secondary,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            RatingDropdown(mealId: meal.id),
            const SizedBox(height: 16),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            const SizedBox(height: 24),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
