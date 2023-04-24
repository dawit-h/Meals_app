import 'package:flutter/material.dart';

import '../model/meal.dart';
import '../screen/meal_detail_page.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final int duration;
  final Affordability affordability;
  final Function removeMeal;
  const MealItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.removeMeal});

  String get complexityText {
    switch (complexity) {
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Simple:
        return 'Simple';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return "Expensive";
      case Affordability.Pricey:
        return "Pricey";
      default:
        return 'Unknown';
    }
  }

  void showMealItem(ctx) {
    Navigator.of(ctx)
        .pushNamed(
      MealDetailPage.routeName,
      arguments: id,
    )
        .then((id) {
      if (id != null) {
        removeMeal(id);
      }
    });
  }

  Widget _rowBuilder(BuildContext context, IconData icon, String title) {
    return Row(
      children: [
        Icon(
          icon,
          // size: 17,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: () => showMealItem(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    child: Text(
                      title,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _rowBuilder(context, Icons.schedule, "$duration min"),
                  _rowBuilder(context, Icons.work, complexityText),
                  _rowBuilder(context, Icons.monetization_on_outlined,
                      affordabilityText),
                  // Row(
                  //   children: [
                  //     const Icon(Icons.monetization_on_outlined),
                  //     Text(
                  //       affordabilityText,
                  //       style: Theme.of(context).textTheme.bodyMedium,
                  //     ),
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     IconButton(
                  //         onPressed: () {}, icon: const Icon(Icons.favorite)),
                  //     Text(
                  //       "Favorite",
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
