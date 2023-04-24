import 'package:flutter/material.dart';

import '../widgets/cusom_drawer.dart';
import '../widgets/custom_appBar.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool> filters;

  final activateFilter;
  FiltersPage({super.key, required this.activateFilter, required this.filters});

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool _isglutenFree = false;

  bool _isvegan = false;

  bool _isvegetarian = false;

  bool _islactosFree = false;

  @override
  void initState() {
    _isglutenFree = widget.filters['gluten'] ?? false;
    _islactosFree = widget.filters['lactos'] ?? false;
    _isvegetarian = widget.filters['vegetarian'] ?? false;
    _isvegan = widget.filters['vegan'] ?? false;
    // TODO: implement initState
    super.initState();
  }

  Widget _showSwitchListTile(
      String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: custom_app_bar(title: "Filters", actions: [
        IconButton(
          onPressed: () {
            widget.activateFilter({
              'gluten': _isglutenFree,
              'lactos': _islactosFree,
              'vegan': _isvegan,
              'vegetarian': _isvegetarian,
            });
          },
          icon: const Icon(Icons.save),
        )
      ]),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            child: Text(
              'Adjust Your Meals Here.',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _showSwitchListTile("Gluten Free", _isglutenFree, (newval) {
                setState(() {
                  _isglutenFree = newval;
                });
              }),
              _showSwitchListTile("Vegan", _isvegan, (newVal) {
                setState(() {
                  _isvegan = newVal;
                });
              }),
              _showSwitchListTile("Vegetarina", _isvegetarian, (newVal) {
                setState(() {
                  _isvegetarian = newVal;
                });
              }),
              _showSwitchListTile("Lactos free", _islactosFree, (newVal) {
                setState(() {
                  _islactosFree = newVal;
                });
              })
            ],
          )),
        ],
      ),
      drawer: const CustomDrawer(),
    );
  }
}
