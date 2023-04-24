import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../widgets/meal_item.dart';

class FavoritePage extends StatelessWidget {
  final List<Meal> favorites;
  const FavoritePage({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return favorites.isEmpty
        ? const Center(
            child: Text("There are not any favorites for you"),
          )
        : ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (ctx, i) {
              return MealItem(
                  id: favorites[i].id,
                  title: favorites[i].title,
                  imageUrl: favorites[i].imageUrl,
                  duration: favorites[i].duration,
                  complexity: favorites[i].complexity,
                  affordability: favorites[i].affordability,
                  removeMeal: () {});
            },
          );
  }
}
