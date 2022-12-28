import 'package:meals_app/models/meal.dart';

class Favourite {
  static List<Meal> favouritedMeals = [];
  static toggleFavourite(Meal meal) {
    if (favouritedMeals.contains(meal)) {
      favouritedMeals.remove(meal);
    } else {
      favouritedMeals.add(meal);
    }
  }
}
