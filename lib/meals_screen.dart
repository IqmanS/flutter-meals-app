// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/models/category.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  // final String categoryId;
  // final String categoryTitle;
  // final Color categoryColor;
  // const MealsScreen(
  //     {super.key,
  //     required this.categoryId,
  //     required this.categoryTitle,
  //     required this.categoryColor});

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArguments['id'];
    final categoryTitle = routeArguments['title'];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe"),
      ),
      body: const Center(
        child: Text("BELLo"),
      ),
    );
  }
}
