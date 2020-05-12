import 'package:flutter/material.dart';
import 'package:flutterunitconverter/category.dart';
import 'package:flutterunitconverter/category_route.dart'; // Importing Category widget

const _categoryName = 'Cake';
const _categoryIcon = Icons.cake;
const _categoryColor = Colors.green;

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: CategoryRoute(),
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Unit Converter'),
//        ),
//        backgroundColor: Colors.white,
//        body: Center(
////          child: Category(_categoryName, _categoryIcon, _categoryColor),
//          child: Category(
//              name: _categoryName,
//              color: _categoryColor,
//              iconLocation: _categoryIcon
//          ),
//        ),
//      ),
    );
  }
}
