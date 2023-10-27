import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
//import 'package:meals_app/utilities/persistance.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

class RatingDropdown extends ConsumerStatefulWidget {
  final String mealId;
  RatingDropdown({super.key, required this.mealId});

  @override
  ConsumerState<RatingDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends ConsumerState<RatingDropdown> {
  Rating _selectedRating = Rating.none;
  void changeRating() {
    ref.read(mealsProvider.notifier).renameMeal(widget.mealId, _selectedRating);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(mealsProvider);
    final meal = ref.read(mealsProvider.notifier).getMeal(widget.mealId);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.star),
          const Text(
            'Rating:  ',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          DropdownButton<Rating>(
            value: meal.rating, // none by default
            style: const TextStyle(fontSize: 18, color: Colors.white),
            items: Rating.values
                .map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(
                      category.name,
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              _selectedRating = value!;
              changeRating();

              setState(() {
                _selectedRating = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
