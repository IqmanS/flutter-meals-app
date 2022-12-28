// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String mealId;
  final Color catColor;
  const MealItem({super.key, required this.mealId, required this.catColor});
  void selectMeal(ctx) {
    Navigator.of(ctx).pushReplacementNamed(MealDetailScreen.routeName,
        arguments: {'id': mealId, 'color': catColor}).then((value) {
      if (value != null) {
        print("$value disliked");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Meal meal = DUMMY_MEALS.firstWhere((element) {
      return element.id == mealId;
    });

    return InkWell(
      onTap: (() => selectMeal(context)),
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    color: Colors.black54,
                    width: 300,
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.access_alarm_rounded),
                      const SizedBox(width: 6),
                      Text("${meal.duration} mins")
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.cookie_outlined),
                      const SizedBox(width: 6),
                      Text(getComplexityText(meal.complexity))
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.monetization_on_outlined),
                      const SizedBox(width: 6),
                      Text(getAffordabiltyText(meal.affordability))
                    ],
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
