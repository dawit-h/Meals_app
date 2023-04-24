import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';
import '../widgets/custom_appBar.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        crossAxisSpacing: 20,
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
      ),
      children: [
        ...dummyCategory
            .map((cat) => CategoryItem(
                  id: cat.id,
                  title: cat.title,
                  color: cat.color,
                ))
            .toList(),
      ],
    );
  }
}
