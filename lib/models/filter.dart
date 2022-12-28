import '../dummy_data.dart';
import 'meal.dart';

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
