import 'package:flutter/material.dart';
import 'package:flutterunitconverter/category.dart';
import 'package:flutterunitconverter/unit.dart';

final _backgroundColor = Colors.green[100];

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatefulWidget {

  const CategoryRoute();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CategoryRoute();
  }
}

class _CategoryRoute extends State<CategoryRoute> {

  final _categories = <Category>[];   // Creating an empty list

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];
  
  @override
  void initState() {
    super.initState();
    // Adding items to the list
    for (var i=0;i<_categoryNames.length;i++) {
      _categories.add(
          Category(
            name: _categoryNames[i],
            color: _baseColors[i],
            iconLocation: Icons.cake,
            units: _retrieveUnitList(_categoryNames[i]),
          )
      );
    }
  }

  /// Makes the correct number of rows for the list view.
  ///
  /// For portrait, we construct a [ListView] from the list of category widgets.
  Widget _buildCategoryWidget(List<Widget> categories) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index],
      itemCount: categories.length,
    );
  }

  /// Returns a list of mock [Unit]s.
  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i++;
      return Unit(
          name: '$categoryName Unit $i',
          conversion: i.toDouble()
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    // Adding list to the list view
    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidget(_categories),
    );

    // Creating the app bar
    final appBar = AppBar(
      title: Text(
        'Unit Converter',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
