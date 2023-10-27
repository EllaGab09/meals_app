import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/providers/filters_providers.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedTabIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = ref.watch(filteredMealsProvider);
    Widget activeTab = CategoriesScreen(
      availableMeals: filteredMeals,
    );

    String title = "Categories";

    if (_selectedTabIndex == 1) {
      final favoriteMeals = ref.watch(favoritesProvider);
      activeTab = MealsScreen(meals: favoriteMeals);
      title = "Favorites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: MainDrawer(onSelected: _setScreen),
      body: activeTab,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        currentIndex: _selectedTabIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
