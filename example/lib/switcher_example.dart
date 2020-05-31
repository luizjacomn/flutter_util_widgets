import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_util_widgets/widgets/input/switcher/switcher.dart';

import './util/auxiliar_stuff.dart';

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
