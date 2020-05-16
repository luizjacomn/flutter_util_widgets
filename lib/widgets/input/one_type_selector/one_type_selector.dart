import 'package:flutter/material.dart';

///
/// A `OneTypeSelector` widget to usage for select one in yours available [options].
///
/// The type parameter `T` serves the same purpose as that of the
/// [OneTypeSelector] class' type parameter.
/// The [OneTypeSelector] requests a `callback Function(T)` named as
/// [onValueChanged] which will be triggered after the [value] changed.
///
/// If the [options] list is absent, an assertion error will be throw.
/// ```dart
/// assert(options != null);
/// ```
/// If the [onValueChanged] function is absent, an assertion error will be throw.
/// ```dart
/// assert(onValueChanged != null);
/// ```
///
class OneTypeSelector<T> extends StatelessWidget {
  /// The [value] for this `OneTypeSelector`.
  ///
  /// Example of usage:
  /// ```dart
  /// String myValue;
  /// OneTypeSelector(
  ///   value: myValue, // Your custom value
  ///   // other properties
  /// );
  /// ```
  final T value;

  /// The callback function reference that is called after
  /// the `OneTypeSelector` value changes.
  /// Triggered when the [value] is changed.
  ///
  /// The [onValueChanged] function ` must not be null`.
  ///
  /// Example of usage:
  /// ```dart
  /// void myOnChangeMethod(T value) {
  ///     print(value); // Do something
  /// }
  ///
  /// OneTypeSelector(onvalueChanged: myOnChangeMethod);
  /// ```
  final ValueChanged<T> onValueChanged;

  /// The available [options] for `OneTypeSelector`.
  ///
  /// The [options] list ` must not be null`.
  /// The [options] list ` must contain at least 2 elements`.
  ///
  /// Example of usage:
  /// ```dart
  /// OneTypeSelector<bool>(
  ///   options: [true, false],
  ///   // other properties
  /// );
  /// ```
  final List<T> options;

  /// The [transitionDuration] of the `OneTypeSelector` animation on value changed.
  /// The default value is:
  /// ```dart
  /// Duration(milliseconds: 250);
  /// ```
  /// Example of usage:
  /// ```dart
  /// OneTypeSelector(
  ///   transitionDuration: Duration(milliseconds: 250),
  ///   // other properties
  /// );
  /// ```
  final Duration transitionDuration;

  /// The padding for the `OneTypeSelector`.
  /// The default value is:
  /// ```dart
  /// EdgeInsets.all(8.0);
  /// ```
  /// /// Example of usage:
  /// ```dart
  /// OneTypeSelector(
  ///   contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
  ///   // other properties
  /// );
  /// ```
  final EdgeInsets contentPadding;

  /// The overflow mode when the label is overflowing the [optionWidth].
  /// The default value is:
  /// ```dart
  /// TextOverflow.clip
  /// ```
  /// Example of usage:
  /// ```dart
  /// OneTypeSelector(
  ///   valueLabelOverflow: TextOverflow.ellipsis,
  ///   // other properties
  /// );
  /// ```
  final TextOverflow valueLabelOverflow;

  /// If this value is set to [true], on tap in the current selected option the
  /// [value] is set to [null].
  ///
  /// The default value is `false`.
  ///
  /// ![Toggle option:](https://github.com/luizjacomn/flutter_util_widgets/raw/master/sample/select_one_button/toggle_option_on_tap.png)
  final bool toggleOptionOnTap;

  /// The separator width for [options].
  ///
  /// The default value is `2.0`.
  ///
  /// Example of usage:
  /// ```dart
  /// OneTypeSelector(
  ///   separatorWidth: 5.0,
  ///   // other properties
  /// );
  /// ```
  final double separatorWidth;

  /// The height for `OneTypeSelector`.
  ///
  /// The default value is `50.0`.
  ///
  /// Example of usage:
  /// ```dart
  /// OneTypeSelector(
  ///   height: 35.0,
  ///   // other properties
  /// );
  /// ```
  final double height;

  /// The width for the each option (from [options]).
  ///
  /// The default value is:
  /// ```dart
  /// constraints.maxWidth / 3.5; // constraints is a instance of BoxConstraints
  /// ```
  /// Example of usage:
  /// ```dart
  /// OneTypeSelector(
  ///   separatorWidth: 5.0,
  ///   // other properties
  /// );
  /// ```
  final double optionWidth;

  /// This function defines a label for every option (from [options]).
  /// The default value is [value].
  /// Example of usage:
  /// ```dart
  /// OneTypeSelector<String>(
  ///   setValueLabel: (String value) {
  ///       value.substring(0, 1); // for each option, the value label will be the first letter
  ///   },
  ///   // other properties
  /// );
  /// ```
  final String Function(T value) setValueLabel;

  /// The `style` for the `value label`.
  /// The default value is:
  /// ```dart
  /// TextStyle(color: Colors.white)
  /// ```
  final TextStyle valueLabelStyle;

  /// The active [Color] of the `OneTypeSelector`.
  /// Is displayed when an option is `selected`.
  /// The default value is:
  /// ```dart
  /// Theme.of(context).accentColor;
  /// ```
  /// Example of usage:
  /// ```dart
  /// OneTypeSelector(
  ///   activeColor: Colors.amber,
  ///   // other properties
  /// );
  /// ```
  final Color activeColor;

  /// The disabled [Color] of the `OneTypeSelector`.
  /// Is displayed when an option is `not selected`.
  /// The default value is:
  /// ```dart
  /// Theme.of(context).disabledColor;
  /// ```
  /// Example of usage:
  /// ```dart
  /// OneTypeSelector(
  ///   disabledColor: Colors.grey,
  ///   // other properties
  /// );
  /// ```
  final Color disabledColor;

  /// This is a inner variable to control the shape of `OneTypeSelector`.
  /// The default value is `8.0` and provides a rounded corner shape.
  /// A constructor called [rect] provides a rect corner shape.
  final double _borderRadius;

  /// The default [OneTypeSelector] constructor that render a [rounded corner] `OneTypeSelector`.
  /// * value: `It's required`;
  /// * onValueChanged: `It's required`;
  /// * options: `It's required`;
  /// * transitionDuration: Default is `Duration(milliseconds: 250)`;
  /// * contentPadding: Default is `EdgeInsets.all(8.0)`;
  /// * valueLabelOverflow: Default is `TextOverflow.clip`;
  /// * toggleOptionOnTap: Default is `false`;
  /// * separatorWidth: Default is `2.0`;
  /// * height: Default is `50.0`;
  /// * optionWidth: Default is `constraints.maxWidth / 3.5`;
  /// * setValueLabel: Default is [value];
  /// * valueLabelStyle: Default is `TextStyle(color: Colors.white)`;
  /// * activeColor: Default is `Theme.of(context).accentColor`;
  OneTypeSelector({
    @required this.value,
    @required this.onValueChanged,
    @required this.options,
    this.transitionDuration = const Duration(milliseconds: 250),
    this.contentPadding = const EdgeInsets.all(8.0),
    this.valueLabelOverflow = TextOverflow.clip,
    this.toggleOptionOnTap = false,
    this.separatorWidth = 2.0,
    this.height = 50.0,
    this.optionWidth,
    this.setValueLabel,
    this.valueLabelStyle,
    this.activeColor,
    this.disabledColor,
  })  :

        /// Set shape to a [rounded corner].
        this._borderRadius = 8.0,
        /// Assert [transitionDuration] is not null.
        assert(transitionDuration != null,
            "The 'transitionDuration' must not be null"),

        /// Assert [onValueChanged] is not null.
        assert(onValueChanged != null,
            "The function 'onValueChanged' is required"),

        /// Assert [options] is not null.
        assert(options != null, "The 'options' list is required"),

        /// Assert [options] list contains at least 2 elements.
        assert(options.length >= 2,
            "The 'options' list must contain at least 2 elements");

  /// The default [OneTypeSelector] constructor that render a [rect corner] `OneTypeSelector`.
  /// * value: `It's required`;
  /// * onValueChanged: `It's required`;
  /// * options: `It's required`;
  /// * transitionDuration: Default is `Duration(milliseconds: 250)`;
  /// * contentPadding: Default is `EdgeInsets.all(8.0)`;
  /// * valueLabelOverflow: Default is `TextOverflow.clip`;
  /// * toggleOptionOnTap: Default is `false`;
  /// * separatorWidth: Default is `2.0`;
  /// * height: Default is `50.0`;
  /// * optionWidth: Default is `constraints.maxWidth / 3.5`;
  /// * setValueLabel: Default is [value];
  /// * valueLabelStyle: Default is `TextStyle(color: Colors.white)`;
  /// * activeColor: Default is `Theme.of(context).accentColor`;
  OneTypeSelector.rect({
    @required this.value,
    @required this.onValueChanged,
    @required this.options,
    this.transitionDuration = const Duration(milliseconds: 250),
    this.contentPadding = const EdgeInsets.all(8.0),
    this.valueLabelOverflow = TextOverflow.clip,
    this.toggleOptionOnTap = false,
    this.separatorWidth = 2.0,
    this.height = 50.0,
    this.optionWidth,
    this.setValueLabel,
    this.valueLabelStyle,
    this.activeColor,
    this.disabledColor,
  })  :

        /// Set shape to a [rect corner].
        this._borderRadius = 0.0,
        /// Assert [transitionDuration] is not null.
        assert(transitionDuration != null,
            "The 'transitionDuration' must not be null"),

        /// Assert [onValueChanged] is not null.
        assert(onValueChanged != null,
            "The function 'onValueChanged' is required"),

        /// Assert [options] is not null.
        assert(options != null, "The 'options' list is required"),

        /// Assert [options] list contains at least 2 elements.
        assert(options.length >= 2,
            "The 'options' list must contain at least 2 elements");

  Color _getActiveColor(ctx) => this.activeColor ?? Theme.of(ctx).accentColor;

  Color _getDisabledColor(ctx) => this.disabledColor ?? Theme.of(ctx).disabledColor;

  BorderRadius _getBorderRadius(index) {
    if (index == 0) {
      return BorderRadius.only(
        topLeft: Radius.circular(_borderRadius),
        bottomLeft: Radius.circular(_borderRadius),
      );
    } else if (index == options.length - 1) {
      return BorderRadius.only(
        topRight: Radius.circular(_borderRadius),
        bottomRight: Radius.circular(_borderRadius),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: options.length,
            separatorBuilder: (_, __) => separatorWidth == 0.0
                ? Container()
                : Container(
                    height: constraints.maxHeight,
                    width: separatorWidth,
                  ),
            itemBuilder: (context, index) =>
                _buildOption(context, constraints, index),
          );
        },
      ),
    );
  }

  Widget _buildOption(
      BuildContext context, BoxConstraints constraints, int index) {
    final itemValue = options[index] as dynamic;
    return InkWell(
      onTap: () {
        if (toggleOptionOnTap && value == itemValue) {
          onValueChanged(null);
        } else {
          onValueChanged(itemValue);
        }
      },
      child: AnimatedContainer(
        duration: this.transitionDuration,
        width: this.optionWidth ?? constraints.maxWidth / 3.5,
        height: constraints.maxHeight,
        padding: this.contentPadding,
        decoration: BoxDecoration(
          color: itemValue == value
              ? _getActiveColor(context)
              : _getDisabledColor(context),
          borderRadius: _getBorderRadius(index),
        ),
        child: Center(
          child: Text(
            setValueLabel == null ? itemValue.toString() : setValueLabel(itemValue),
            textAlign: TextAlign.center,
            overflow: valueLabelOverflow,
            style: this.valueLabelStyle ?? TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
