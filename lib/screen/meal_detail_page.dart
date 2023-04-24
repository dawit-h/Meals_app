import 'package:flutter/material.dart';

import '../widgets/custom_appBar.dart';
import '../dummy_data.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = '/meal-detail';

  final toggleFavorite;
  final isFavorite;
  const MealDetailPage({super.key, this.isFavorite, this.toggleFavorite});
  Widget buildTitleBox(String title, BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainerList({BuildContext? ctx, Widget? child}) {
    return Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final meal = dummy_meals.firstWhere((meal) {
      return meal.id == id;
    });
    return Scaffold(
      appBar: custom_app_bar(title: meal.title),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              buildTitleBox("Ingredients", context),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: IconButton(
                    onPressed: () => toggleFavorite(id),
                    icon: Icon(
                      isFavorite(id) ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite(id)
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      size: 30,
                    ),
                    splashColor: Theme.of(context).primaryColor,
                  ))
            ]),
            buildContainerList(
                child: ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: SizedBox(
                    height: 25,
                    child: Text(meal.ingredients[index]),
                  ),
                );
              },
            )),
            buildTitleBox("Steps", context),
            buildContainerList(
                child: ListView.builder(
              itemCount: meal.steps.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text("${index + 1}")),
                  title: Text(
                    meal.steps[index],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              },
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(id);
        },
      ),
    );
  }
}
