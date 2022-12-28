import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/favourite.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Favourite.favouritedMeals.isEmpty
        ? const Center(
            child: Text("No Favourites added!", style: TextStyle(fontSize: 30)),
          )
        : ListView.builder(
            itemCount: Favourite.favouritedMeals.length,
            itemBuilder: (context, index) {
              return MealItem(
                mealId: Favourite.favouritedMeals[index].id,
                catColor: Theme.of(context).primaryColor,
              );
            },
          );
  }
}
