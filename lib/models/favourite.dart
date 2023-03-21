import 'package:meals_app/models/meal.dart';
import 'package:flutter/material.dart';

class Favourite with ChangeNotifier {
  static List<Meal> favouritedMeals = [];

  bool isFavourite = false;
  Favourite({this.isFavourite = false});

  List<Meal> getFavouritedMealsList() {
    return favouritedMeals;
  }
}
