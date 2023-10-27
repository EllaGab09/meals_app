import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.onSelected,
  });

  final void Function(String identifier) onSelected;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(.55),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 50,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 16),
                Text('Let him cook!',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        )),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 24,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              onSelected('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 24,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              onSelected('filters');
            },
          ),
        ],
      ),
    );
  }
}
