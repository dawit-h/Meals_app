import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';

import './screen/tab_bar.dart';
// import './screen/category_page.dart';
import './screen/category_meal_page.dart';
import './dummy_data.dart';
import './screen/meal_detail_page.dart';
import './screen/filters_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<Meal> mealData;
  Map<String, bool> _filters = {
    'gluten': false,
    'lactos': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _favorite = [];

  bool _isFavorite(String id) {
    return _favorite.any((element) => element.id == id);
  }

  void _toggleFavorite(String id) {
    final element = _favorite.indexWhere((meal) => meal.id == id);

    if (element >= 0) {
      setState(() {
        _favorite.removeAt(element);
      });
    } else {
      setState(() {
        _favorite.add(dummy_meals.firstWhere((element) => element.id == id));
      });
    }
  }

  void _activateFilter(Map<String, bool> filters) {
    setState(() {
      _filters = filters;
      mealData = dummy_meals.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) return false;
        if (_filters['lactos'] == true && !meal.isLactoseFree) return false;
        if (_filters['vegan'] == true && !meal.isVegan) return false;
        if (_filters['vegetarian'] == true && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  @override
  void initState() {
    mealData = dummy_meals;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals APP",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: ThemeData.light().appBarTheme.copyWith(
              titleTextStyle:
                  const TextStyle(fontFamily: 'Raleway', fontSize: 18)),
          primaryColor: Colors.purpleAccent,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
            accentColor: Colors.amber,
          ),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyMedium: const TextStyle(
                  color: Color.fromARGB(255, 32, 32, 32), fontSize: 16),
              titleMedium: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      // home: const TabControllerPage(),
      routes: {
        '/': (ctx) => TabControllerPage(
              favorites: _favorite,
            ),
        CategoryMealPage.routeName: (ctx) => CategoryMealPage(mealData),
        MealDetailPage.routeName: (ctx) => MealDetailPage(
              isFavorite: _isFavorite,
              toggleFavorite: _toggleFavorite,
            ),
        FiltersPage.routeName: (ctx) => FiltersPage(
              filters: _filters,
              activateFilter: _activateFilter,
            ),
      },
    );
  }
}
