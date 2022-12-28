// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../main.dart';
import '../models/filter.dart';

class MealsScreen extends StatelessWidget {
  static const routeName = '/meals';
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArguments['id'];
    final categoryTitle = routeArguments['title'];

    final categoryMeals = Filter.availableMeals.where((element) {
      return element.categories.contains(categoryId);
    }).toList();
    final cat = DUMMY_CATEGORIES.firstWhere((element) {
      return element.id == categoryId;
    });

    return Scaffold(
      backgroundColor: cat.color.withAlpha(250),
      appBar: AppBar(
        title: Text("${cat.title} Recipe"),
        backgroundColor: cat.color.withAlpha(250),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            mealId: categoryMeals[index].id,
            catColor: cat.color,
          );
        },
      ),
    );
  }
}
