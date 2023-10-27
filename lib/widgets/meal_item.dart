import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    required this.meal,
    required this.onSelectMeal, // Callback function to handle meal selection
    super.key,
  });

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  // Get the text representation of meal complexity (e.g., Easy, Medium)
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  // Get the text representation of meal affordability (e.g., Affordable, Pricey)
  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () =>
            onSelectMeal(meal), // Trigger the meal selection callback on tap
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(
                  kTransparentImage), // Placeholder for the image (transparent)
              image:
                  NetworkImage(meal.imageUrl), // Load the meal image from a URL
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            label: '${meal.duration} min',
                            icon: Icons.schedule),
                        const SizedBox(width: 12),
                        MealItemTrait(label: complexityText, icon: Icons.work),
                        const SizedBox(width: 12),
                        MealItemTrait(
                            label: affordabilityText, icon: Icons.attach_money),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
