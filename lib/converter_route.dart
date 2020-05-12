import 'package:flutter/material.dart';
import 'package:flutterunitconverter/unit.dart';

/// Converter screen where users can input amounts to convert.
///
/// Currently, it just displays a list of mock units.
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class ConverterRoute extends StatefulWidget {
  
//  const ConverterRoute();

  /// Color for this [Category].
  final Color color;

  /// Units for this [Category].
  final List<Unit> units;

  /// This [ConverterRoute] requires the color and units to not be null.
  const ConverterRoute({
    @required this.color,
    @required this.units
  })  : assert(color != null),
        assert(units != null);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ConvertRoute();
  }
}

class _ConvertRoute extends State<ConverterRoute> {

  @override
  Widget build(BuildContext context) {
    // Here is just a placeholder for a list of mock units
    final unitWidgets = widget.units.map((Unit unit) {
      return Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        color: widget.color,
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subhead,
            )
          ],
        ),
      );
    }).toList();

    // Creating the app bar
    final appBar = AppBar(
      title: Text(
        'Length',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: widget.color,
    );

//    return ListView(
//      children: unitWidgets,
//    );
    return Scaffold(
      appBar: appBar,
      body: ListView(
        children: unitWidgets,
      ),
    );
  }
}