// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../models/filter.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filter";

  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = Filter.glutenFree;
  bool _vegan = Filter.vegan;
  bool _vegetarian = Filter.vegetarian;
  bool _lactoseFree = Filter.lactoseFree;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text("Filters"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  //print(Filter.availableMeals);
                  Filter.glutenFree = _glutenFree;
                  Filter.lactoseFree = _lactoseFree;
                  Filter.vegan = _vegan;
                  Filter.vegetarian = _vegetarian;
                  Filter.setFilter();
                  //print(Filter.availableMeals);
                });
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              child: Text(
                "Adjust your meal selection:",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    value: _glutenFree,
                    onChanged: (value) {
                      setState(() {
                        _glutenFree = value;
                      });
                    },
                    title: const Text("Gluten Free"),
                    subtitle: const Text("Only include Gluten Free meals"),
                  ),
                  //
                  SwitchListTile(
                    value: _vegetarian,
                    onChanged: (value) {
                      setState(() {
                        _vegetarian = value;
                      });
                    },
                    title: const Text("Vegetarian"),
                    subtitle: const Text("Only include Vegetarial meals"),
                  ),
                  //
                  SwitchListTile(
                    value: _vegan,
                    onChanged: (value) {
                      setState(() {
                        _vegan = value;
                      });
                    },
                    title: const Text("Vegan"),
                    subtitle: const Text("Only include Vegan meals"),
                  ),
                  //
                  SwitchListTile(
                    value: _lactoseFree,
                    onChanged: (value) {
                      setState(() {
                        _lactoseFree = value;
                      });
                    },
                    title: const Text("Lactose Free"),
                    subtitle: const Text("Only include Lactose Free meals"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
