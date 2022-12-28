// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/screens/tabs_bottom_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
        MealsScreen.routeName: (context) => const MealsScreen(),
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
