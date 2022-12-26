import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/models/category.dart';

class MealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  final Color categoryColor;
  const MealsScreen(
      {super.key,
      required this.categoryId,
      required this.categoryTitle,
      required this.categoryColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$categoryTitle Recipe"),
      ),
      body: const Center(
        child: Text("BELLo"),
      ),
    );
  }
}
