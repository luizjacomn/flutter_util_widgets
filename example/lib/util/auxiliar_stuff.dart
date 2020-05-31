import 'package:flutter/material.dart';

const bolded = TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

Color getBoolColor(bool value) => value ? Colors.green : Colors.red;

RichText viewBoolValues(label, value) {
  return RichText(
    text: TextSpan(
      text: label,
      style: bolded,
      children: [
        TextSpan(
          text: '${value.toString()}',
          style: TextStyle(
            color: getBoolColor(value),
          ),
        ),
      ],
    ),
  );
}

RichText viewValues(label, value) {
  return RichText(
    text: TextSpan(
      text: label,
      style: bolded,
      children: [
        TextSpan(
          text: value == null ? '-' : '${value.toString()}',
          style: TextStyle(color: Colors.amber.shade900),
        ),
      ],
    ),
  );
}

DateTime month(int month) => DateTime(DateTime.now().year, month, 1);
