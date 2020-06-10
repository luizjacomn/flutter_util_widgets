import 'package:flutter/material.dart';

import 'package:flutter_util_widgets/widgets/input/one_type_selector/one_type_selector.dart';

import './models/person.dart';
import './util/auxiliar_stuff.dart';

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
                const Text('Favorite character?', style: bolded),
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
                const Text('Favorite anime?', style: bolded),
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
                const Text('Birth month?', style: bolded),
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
                const Text('Is single?', style: bolded),
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
