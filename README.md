<!-- Language: [English](README.md) | [Português](translation/pt-BR/README.md) -->

# flutter_util_widgets.dart
<a href="https://pub.dev/packages/flutter_util_widgets" rel="nofollow" target="_blank"><img src="https://img.shields.io/badge/pub-v1.0.5+3-blue" alt="pub package" data-canonical-src="https://img.shields.io/badge/pub-v1.0.5+3-blue" style="max-width:100%;"></a>
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://travis-ci.com/luizjacomn/flutter_util_widgets.svg?branch=master)](https://travis-ci.com/luizjacomn/flutter_util_widgets)


A flutter package that provides a variety of useful widgets. It&#x27;s constantly updated.

## Install the package

### 1. Add this to your package's pubspec.yaml file:
```dart
flutter_util_widgets: ^1.0.5+3
```
### 2. Update dependencies:
You can install packages from the command line:
```sh
$ flutter pub get
```

### 3. Import it on your app
Now in your Dart code, you can use:
```dart
import 'package:flutter_util_widgets/flutter_util_widgets.dart';
```

## Using the package

#### 1. Switcher widget:
##### Screenshot:
<img src="https://github.com/luizjacomn/flutter_util_widgets/raw/master/screenshots/switcher.gif" height="300em" />

##### Code:
```dart
import 'package:flutter/material.dart';

import 'package:flutter_util_widgets/flutter_util_widgets.dart';

class SwitcherExample extends StatefulWidget {
  @override
  _SwitcherExampleState createState() => _SwitcherExampleState();
}

class _SwitcherExampleState extends State<SwitcherExample> {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                    setNewValue((let, val) => squared = value, squared, value);
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
                    setNewValue((let, val) => rounded = value, rounded, value);
                  },
                ),
              ],
            ),
            Switcher.label(
              label: 'With label',
              value: withLabel,
              onChange: (value) {
                setNewValue((let, val) => withLabel = value, withLabel, value);
              },
            ),
            Switcher.labelAndRounded(
              label: 'With label and rounded',
              value: withLabelRounded,
              onChange: (value) {
                setNewValue((let, val) => withLabelRounded = value, withLabelRounded,
                    value);
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
                setNewValue((let, val) => customDisabledColorAndAlignment = value,
                    customDisabledColorAndAlignment, value);
              },
            ),
            const Divider(),
            const Text(
              'Current values:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Squared: $squared'),
            Text('Rounded: $rounded'),
            Text('With label: $withLabel'),
            Text('With label and rounded: $withLabelRounded'),
            Text('Customizing active color and label style: $customActiveColor'),
            Text('Customizing disabled color and alignment: $customDisabledColorAndAlignment'),
          ],
        ),
      ),
    );
  }
}
```
#### 1. OneTypeSelector widget:
##### Screenshot:
<img src="https://github.com/luizjacomn/flutter_util_widgets/raw/master/screenshots/one_type_selector.gif" height="300em" />

##### Code:
###### Class Person:

```dart
class Person {
  final String name;
  DateTime birthMonth;
  bool isSingle;
  String favoriteAnime;
  String favoriteCharacter;

  Person(this.name);

  @override
  String toString() {
    return 'Name: $name - Birth month: ${birthMonth?.month} - Is single: $isSingle - Favorite anime: $favoriteAnime - Favorite character: $favoriteCharacter';
  }
}
```

```dart
import 'package:flutter/material.dart';

import 'package:flutter_util_widgets/flutter_util_widgets.dart';

const TextStyle _bold = TextStyle(fontWeight: FontWeight.bold);

class OneTypeSelectorExample extends StatefulWidget {
  @override
  _OneTypeSelectorExampleState createState() => _OneTypeSelectorExampleState();
}

class _OneTypeSelectorExampleState extends State<OneTypeSelectorExample> {
  Person otaku = Person('Otaku Sr.');
  Person p1 = Person('Person 1');
  Person p2 = Person('Person 2');
  Person selected;

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

  /// Aux method to get <current-year> - MONTH - <first-day-of-month>
  static DateTime month(int month) => DateTime(DateTime.now().year, month, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One Type Selector Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Favorite character?', style: _bold),
                const SizedBox(height: 4.0),
                OneTypeSelector<String>(
                  value: otaku.favoriteCharacter,
                  options: characters,
                  onValueChanged: (String value) {
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
                const Text('Favorite anime?', style: _bold),
                const SizedBox(height: 4.0),
                OneTypeSelector<String>(
                  value: otaku.favoriteAnime,
                  options: animes,
                  optionWidth: 150.0,
                  toggleOptionOnTap: true,
                  separatorWidth: 0.0,
                  contentPadding: const EdgeInsets.all(4.0),
                  onValueChanged: (String value) {
                    setState(() {
                      this.otaku.favoriteAnime = value;
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
                const Text('Birth month?', style: _bold),
                const SizedBox(height: 4.0),
                OneTypeSelector<DateTime>.rect(
                  value: otaku.birthMonth,
                  options: months,
                  activeColor: Colors.amber,
                  onValueChanged: (DateTime value) {
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
                const Text('Is single?', style: _bold),
                const SizedBox(height: 4.0),
                OneTypeSelector<bool>(
                  value: otaku.isSingle,
                  options: [true, false],
                  onValueChanged: (bool value) {
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
                OneTypeSelector<Person>(
                  value: selected,
                  options: [p1, p2],
                  setValueLabel: (person) => person.name,
                  comparingBy: (person) => person.name,
                  onValueChanged: (Person value) {
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
                viewValues('Favorite anime: ', otaku.favoriteAnime),
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

```
