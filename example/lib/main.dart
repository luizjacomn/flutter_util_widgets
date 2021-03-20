import 'package:flutter/material.dart';
import 'package:flutter_util_widgets/widgets/input/switcher/switcher.dart';
import 'package:flutter_util_widgets/widgets/input/type_selector/type_selector.dart';

import './models/person.dart';
import './util/auxiliar_stuff.dart';

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
          ElevatedButton(
            child: const Text('Switcher'),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SwitcherExample()));
            },
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            child: const Text('Type Selector'),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TypeSelectorExample()));
            },
          ),
        ],
      ),
    );
  }
}

class SwitcherExample extends StatefulWidget {
  @override
  _SwitcherExampleState createState() => _SwitcherExampleState();
}

class _SwitcherExampleState extends State<SwitcherExample>
    with TickerProviderStateMixin {
  bool squared = false;
  bool rounded = false;
  bool withLabel = false;
  bool withLabelRounded = false;
  bool customActiveColor = false;
  bool customDisabledColorAndAlignment = false;

  void setNewValue(Function(bool, bool) apply, bool value, bool newValue) {
    setState(() {
      apply(value, newValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switcher Example'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Squared',
                      ),
                    ),
                    Switcher(
                      value: squared,
                      onChange: (value) {
                        setNewValue(
                            (let, val) => squared = value, squared, value);
                      },
                    ),
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
                      value: rounded,
                      onChange: (value) {
                        setNewValue(
                            (let, val) => rounded = value, rounded, value);
                      },
                    ),
                  ],
                ),
                Switcher.label(
                  label: 'With label',
                  value: withLabel,
                  onChange: (value) {
                    setNewValue(
                        (let, val) => withLabel = value, withLabel, value);
                  },
                ),
                Switcher.labelAndRounded(
                  label: 'With label and rounded',
                  value: withLabelRounded,
                  onChange: (value) {
                    setNewValue((let, val) => withLabelRounded = value,
                        withLabelRounded, value);
                  },
                ),
                Switcher.label(
                  value: customActiveColor,
                  label: 'Customizing active color and label style',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  activeColor: Colors.amber,
                  onChange: (value) {
                    setNewValue((let, val) => customActiveColor = value,
                        customActiveColor, value);
                  },
                ),
                Switcher.labelAndRounded(
                  mainAxisAlignment: MainAxisAlignment.end,
                  label: 'Customizing disabled color and alignment',
                  disableColor: Colors.blueGrey[300],
                  value: customDisabledColorAndAlignment,
                  onChange: (value) {
                    setNewValue(
                        (let, val) => customDisabledColorAndAlignment = value,
                        customDisabledColorAndAlignment,
                        value);
                  },
                ),
                const Divider(),
                Text(
                  'Current values:',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                viewBoolValues('Squared: ', squared),
                viewBoolValues('Rounded: ', rounded),
                viewBoolValues('With label: ', withLabel),
                viewBoolValues('With label and rounded: ', withLabelRounded),
                viewBoolValues('Customizing active color and label style: ',
                    customActiveColor),
                viewBoolValues('Customizing disabled color and alignment: ',
                    customDisabledColorAndAlignment),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TypeSelectorExample extends StatefulWidget {
  @override
  _TypeSelectorExampleState createState() => _TypeSelectorExampleState();
}

class _TypeSelectorExampleState extends State<TypeSelectorExample> {
  Person otaku = Person('Otaku Sr.');
  Person p1 = Person('Person 1');
  Person p2 = Person('Person 2');
  Person? selected;

  List<String> characters = [
    'Eren Yeager',
    'Kurozaki Ichigo',
    'Uzumaki Naruto',
    'Son Goku',
    'Kamado Tanjiro',
  ];

  List<String> animes = [
    'Attack on Titan',
    'Bleach',
    'Naruto',
    'Dragon Ball Z',
    'Demon Slayer',
  ];

  List<DateTime> months = [
    month(DateTime.january),
    month(DateTime.february),
    month(DateTime.march),
    month(DateTime.april),
    month(DateTime.may),
    month(DateTime.june),
    month(DateTime.july),
    month(DateTime.august),
    month(DateTime.september),
    month(DateTime.october),
    month(DateTime.november),
    month(DateTime.december),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Type Selector Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Favorite character?', style: bolded),
                const SizedBox(height: 4.0),
                TypeSelector<String>(
                  value: otaku.favoriteCharacter,
                  options: characters,
                  onValueChanged: (String? value) {
                    setState(() {
                      this.otaku.favoriteCharacter = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Top 3 Favorite animes? (multiple values)',
                    style: bolded),
                const SizedBox(height: 4.0),
                TypeSelector<String>(
                  multiple: true,
                  maxQuantityValues: 3,
                  onMaxQuantityValues: (max) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Max quantity reached: $max'),
                      backgroundColor: Colors.red,
                    ));
                  },
                  values: otaku.favoriteAnimes,
                  options: animes,
                  optionWidth: 150.0,
                  toggleOptionOnTap: true,
                  separatorWidth: 0.0,
                  contentPadding: const EdgeInsets.all(4.0),
                  onValuesChanged: (List<String> values) {
                    setState(() {
                      this.otaku.favoriteAnimes = values;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Birth month?', style: bolded),
                const SizedBox(height: 4.0),
                TypeSelector<DateTime>.rect(
                  value: otaku.birthMonth,
                  options: months,
                  activeColor: Colors.amber,
                  onValueChanged: (DateTime? value) {
                    setState(() {
                      this.otaku.birthMonth = value;
                    });
                  },
                  setValueLabel: (DateTime value) {
                    return value.month.toString().padLeft(2, '0');
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Is single?', style: bolded),
                const SizedBox(height: 4.0),
                TypeSelector<bool>(
                  value: otaku.isSingle,
                  options: [true, false],
                  onValueChanged: (bool? value) {
                    setState(() {
                      this.otaku.isSingle = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Select a person?', style: bolded),
                const SizedBox(height: 4.0),
                TypeSelector<Person>(
                  value: selected,
                  options: [p1, p2],
                  setValueLabel: (person) => person.name,
                  comparingBy: (person) => person.name,
                  onValueChanged: (Person? value) {
                    setState(() {
                      this.selected = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Who am I?',
                  style: bolded.copyWith(color: Theme.of(context).accentColor),
                ),
                viewValues('Name: ', otaku.name),
                viewValues('Favorite character: ', otaku.favoriteCharacter),
                viewValues(
                    'Top 3 Favorite animes: ', otaku.favoriteAnimes.join(', ')),
                viewValues('Birth month: ', otaku.birthMonth?.month),
                viewValues('Is single: ', otaku.isSingle),
                viewValues('Selected person: ', selected?.name),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
