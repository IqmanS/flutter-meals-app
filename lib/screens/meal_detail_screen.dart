import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/favourite.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/tabs_bottom_screen.dart';

import 'meals_screen.dart';

class MealDetailScreen extends StatefulWidget {
  static const String routeName = "/meal_details";

  const MealDetailScreen({super.key});

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Text(text, style: Theme.of(context).textTheme.headline1),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black45),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final mealId = routeArgument['id'];
    final Color catColor = routeArgument['color'];
    final Meal selectedMeal = DUMMY_MEALS.firstWhere(
      (element) {
        return element.id == mealId;
      },
    );
    Widget ingredients = Column(
      children: [
        buildSectionTitle(context, "Ingredients"),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: 150,
          child: ListView.builder(
            itemCount: selectedMeal.ingredients.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(4),
                child: Text(
                  selectedMeal.ingredients[index],
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              );
            },
          ),
        )
      ],
    );
    Widget steps = Column(
      children: [
        buildSectionTitle(context, "Steps"),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: 300,
          child: ListView.builder(
            itemCount: selectedMeal.steps.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  title: Text(
                    selectedMeal.steps[index],
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  leading: CircleAvatar(
                    child: Text((index + 1).toString()),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );

    return Scaffold(
      backgroundColor: catColor,
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
        //   },
        //   icon: Icon(Icons.keyboard_arrow_left_outlined),
        // ),
        backgroundColor: catColor,
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 4),
            buildContainer(context, ingredients),
            buildContainer(context, steps)
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: catColor.withOpacity(0.8),
      //   onPressed: () {
      //     Navigator.of(context).pop(mealId);
      //   },
      //   child: const Icon(Icons.thumb_down),
      // ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: catColor.withOpacity(0.8),
        onPressed: () {
          setState(() {
            selectedMeal.toggleFavourite();
            print(Favourite.favouritedMeals);
          });
        },
        child: Favourite.favouritedMeals.contains(selectedMeal)
            ? const Icon(Icons.heart_broken)
            : const Icon(Icons.thumb_up),
      ),
    );
  }
}
