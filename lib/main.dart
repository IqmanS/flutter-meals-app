// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/screens/tabs_bottom_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class Filter {
  static bool glutenFree = false;
  static bool vegan = false;
  static bool vegetarian = false;
  static bool lactoseFree = false;
  static List<Meal> availableMeals = DUMMY_MEALS.where((element) {
    if (Filter.glutenFree && !element.isGlutenFree) {
      return false;
    }
    if (Filter.vegan && !element.isVegan) {
      return false;
    }
    if (Filter.vegetarian && !element.isVegetarian) {
      return false;
    }
    if (Filter.vegetarian && !element.isLactoseFree) {
      return false;
    } else {
      return true;
    }
  }).toList();
  static void setFilter() {
    availableMeals = DUMMY_MEALS.where((element) {
      if (Filter.glutenFree && !element.isGlutenFree) {
        return false;
      }
      if (Filter.vegan && !element.isVegan) {
        return false;
      }
      if (Filter.vegetarian && !element.isVegetarian) {
        return false;
      }
      if (Filter.vegetarian && !element.isLactoseFree) {
        return false;
      } else {
        return true;
      }
    }).toList();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        drawerTheme: DrawerThemeData(backgroundColor: Colors.orange.shade200),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
      ),
      home: const TabsScreen(),
      routes: {
        '/categories': (context) => const CategoriesScreen(),
        MealsScreen.routeName: (context) => MealsScreen(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        TabsScreen.routeName: (context) => const TabsScreen(),
        FilterScreen.routeName: (context) => const FilterScreen(),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(
      //       builder: ((context) => const CategoriesScreen()));
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: ((context) => const CategoriesScreen()));
      },
    );
  }
}
