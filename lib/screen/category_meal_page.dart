import 'package:flutter/material.dart';

import '../model/meal.dart';
import '../widgets/meal_item.dart';
import '../widgets/custom_appBar.dart';

class CategoryMealPage extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> data;
  CategoryMealPage(this.data);
  @override
  State<CategoryMealPage> createState() => _CategoryMealPageState();
}

class _CategoryMealPageState extends State<CategoryMealPage> {
  late List<Meal> categoryItem;
  late Map<String, String> args;
  bool _isInitalized = false;

  @override
  void didChangeDependencies() {
    if (!_isInitalized) {
      args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryItem = widget.data.where((meal) {
        return meal.categories.contains(args['id']);
      }).toList();
      _isInitalized = true;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _removeMeal(String id) {
    print(id);
    setState(() {
      categoryItem.removeWhere((mealId) => id == mealId.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: custom_app_bar(title: "${args['title']}"),
      body: ListView.builder(
          itemCount: categoryItem.length,
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryItem[index].id,
              title: categoryItem[index].title,
              imageUrl: categoryItem[index].imageUrl,
              duration: categoryItem[index].duration,
              complexity: categoryItem[index].complexity,
              affordability: categoryItem[index].affordability,
              removeMeal: _removeMeal,
            );
          }),
    );
  }
}
