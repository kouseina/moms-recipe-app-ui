import 'package:flutter/material.dart';
import 'package:mom_recipe/pages/home.dart';

void main() => runApp(MomRecipe());

class MomRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mom Recipe',
      home: Home(),
    );
  }
}
