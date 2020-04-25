import 'package:flutter/material.dart';

import 'package:flutter_util_widgets/widgets/input/switcher.dart';

const title = 'Flutter Util Widgets Demo';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Squared',
                    ),
                  ),
                  Switcher(onChange: print),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Rounded',
                    ),
                  ),
                  Switcher.rounded(
                    initialValue: true,
                    onChange: print,
                  ),
                ],
              ),
              Switcher.label(
                label: 'With label',
                onChange: print,
              ),
              Switcher.labelAndRounded(
                label: 'With label and rounded',
                onChange: print,
              ),
              Switcher.label(
                initialValue: true,
                label: 'Customizing active color and label style',
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                activeColor: Colors.amber,
                onChange: print,
              ),
              Switcher.labelAndRounded(
                mainAxisAlignment: MainAxisAlignment.end,
                label: 'Customizing disabled color and alignment',
                disableColor: Colors.blueGrey[300],
                onChange: print,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
