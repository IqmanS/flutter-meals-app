import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/tabs_bottom_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(BuildContext context, String title, IconData icon,
      Function onTapHandler) {
    return ListTile(
      onTap: () {},
      leading: Icon(
        icon,
        size: 26,
        color: Colors.black54,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            elevation: 4,
            child: Container(
              color: Theme.of(context).primaryColor,
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Cooking Up",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          buildListTile(context, "Meals", Icons.restaurant, () {
            Navigator.of(context).pushNamed(TabsScreen.routeName);
          }),
          buildListTile(context, "Filters", Icons.settings, () {
            Navigator.of(context).pushNamed(FilterScreen.routeName);
          })
        ],
      ),
    );
  }
}
