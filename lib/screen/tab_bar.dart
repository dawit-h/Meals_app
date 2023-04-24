import 'package:flutter/material.dart';

import '../widgets/custom_appBar.dart';
import './category_page.dart';
import './favorite_page.dart';
import '../widgets/cusom_drawer.dart';
import '../model/meal.dart';

class TabControllerPage extends StatefulWidget {
  const TabControllerPage({super.key, required this.favorites});
  final List<Meal> favorites;

  @override
  State<TabControllerPage> createState() => _TabControllerPageState();
}

class _TabControllerPageState extends State<TabControllerPage> {
  late List<Map<String, dynamic>> tabs;
  int _selectedIndex = 0;
  void _tabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    tabs = [
      {'page': const CategoryPage(), 'title': "Category"},
      {
        'page': FavoritePage(
          favorites: widget.favorites,
        ),
        'title': "Favorite"
      },
    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: custom_app_bar(title: tabs[_selectedIndex]['title']),
      drawer: CustomDrawer(),
      body: tabs[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        onTap: _tabChange,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorite",
          )
        ],
      ),
    );
  }
}
