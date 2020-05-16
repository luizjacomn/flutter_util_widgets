import 'package:flutter/material.dart';

import 'package:example/one_type_selector_example.dart';
import 'package:example/switcher_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Router());
  }
}

class Router extends StatefulWidget {
  @override
  _RouterState createState() => _RouterState();
}

class _RouterState extends State<Router> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      color: Colors.blueGrey.shade900,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            child: const Text('Switcher'),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SwitcherExample()));
            },
          ),
          RaisedButton(
            child: const Text('One Type Selector'),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OneTypeSelectorExample()));
            },
          ),
        ],
      ),
    );
  }
}
