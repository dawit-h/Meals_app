import 'package:flutter/material.dart';

import '../screen/filters_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  Widget listTileBuild(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Theme.of(context).colorScheme.secondary,
          height: 150,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: Text(
            "MEALS APP",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 30,
            ),
          ),
        ),
        listTileBuild(Icons.restaurant, "Categories", () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        listTileBuild(Icons.settings, "Filters", () {
          Navigator.of(context).pushReplacementNamed(FiltersPage.routeName);
        })
      ]),
    );
  }
}
