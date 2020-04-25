import 'package:flutter/material.dart';

///
/// A `Switcher` widget to usage for input [bool] values.
///
/// The [Switcher] requests a `callback Function(bool)` named as [onChange] which
/// will be triggered after the inner control value changed.
///
/// If the [onChange] function is absent, an assertion error will be throw.
/// ```dart
/// assert(onChange != null);
/// ```
///
class Switcher extends StatefulWidget {
  /// The callback function reference that is called after
  /// the `Switcher` value changes.
  /// Triggered when the inner control value is changed.
  ///
  /// The [onChange] function ` must not be null`.
  ///
  /// Example of usage:
  /// ```dart
  /// void myOnChangeMethod(bool value) {
  ///     print(value); // Do something
  /// }
  ///
  /// Switcher(onChange: myOnChangeMethod);
  /// ```
  final void Function(bool value) onChange;

  /// Initial [bool] value for `Switcher`.
  ///
  /// Example of usage:
  /// ```dart
  /// bool myValue = true;
  /// Switcher(
  ///   initialValue: myValue, // Your custom value
  ///   // other properties
  /// );
  /// ```
  final bool initialValue;

  /// The size of `Switcher`.
  ///
  /// The default value is `24.0`.
  /// The minimal [size] value ` must be greater than or equal to 16.0`.
  ///
  /// Example of usage:
  /// ```dart
  /// Switcher(
  ///   size: 32.0, // Must be greater than or equal to 16.0
  ///   // other properties
  /// );
  /// ```
  final double size;

  /// The [Duration] of the `Switcher` animation on value changed.
  /// The default value is:
  /// ```dart
  /// Duration(milliseconds: 100);
  /// ```
  /// Example of usage:
  /// ```dart
  /// Switcher(
  ///   duration: Duration(milliseconds: 250),
  ///   // other properties
  /// );
  /// ```
  final Duration duration;

  /// The active [Color] of the `Switcher`.
  /// Is displayed when the inner control value is equal to `true`.
  /// The default value is:
  /// ```dart
  /// Theme.of(context).accentColor;
  /// ```
  /// Example of usage:
  /// ```dart
  /// Switcher(
  ///   activeColor: Colors.amber,
  ///   // other properties
  /// );
  /// ```
  final Color activeColor;

  /// The disable [Color] of the `Switcher`.
  /// Is displayed when the inner control value is equal to `false`.
  /// The default value is:
  /// ```dart
  /// Theme.of(context).disabledColor;
  /// ```
  /// Example of usage:
  /// ```dart
  /// Switcher(
  ///   disableColor: Colors.blueGrey[300],
  ///   // other properties
  /// );
  /// ```
  final Color disableColor;

  /// This is a inner variable to control the size background of `Switcher`.
  /// The value of this variable is equal to `size * (times) 1.8`.
  final double _backgroundSize;

  /// This is a inner variable to control the shape of `Switcher`.
  /// * When you want a [Squared] shape, the value of this variable is equal to
  /// `16.6666...%` of [size] variable `(or size / 6)`.
  /// * When you want a [Rounded] shape, the value of this variable is equal to
  /// `266.6666...%` of [size] variable `(or size * 2.66)`.
  final double _borderRadius;

  /// The `text` displayed by the `label`.
  String label;

  /// The `style` for the `label`.
  TextStyle labelStyle;

  /// The `alignment` for the row that contains the `label` and the `Switcher`.
  MainAxisAlignment mainAxisAlignment;

  /// The default [Switcher] constructor that render a square shaped `Switcher`.
  /// * onChange: `It's required`;
  /// * initialValue: Default is `false`;
  /// * duration: Default is `Duration(milliseconds: 100)`;
  /// * size: Default is `24.0`;
  /// * activeColor: Default is `Theme.of(context).accentColor`;
  /// * disableColor: Default is `Theme.of(context).disabledColor`;
  Switcher({
    @required this.onChange,
    this.initialValue = false,
    this.duration = const Duration(milliseconds: 100),
    this.size = 24.0,
    this.activeColor,
    this.disableColor,
  })  :

        /// Set background `size`.
        _backgroundSize = size * 1.8,

        /// Set shape to a `square`.
        this._borderRadius = size / 6,

        /// Assert [onChange] is not null.
        assert(onChange != null, 'The onChange function must be seted'),

        /// Assert [size] is greater than or equal to `16.0`.
        assert(size >= 16.0, 'The size must be greater than or equal to 16.0');

  /// The named constructor called [rounded] that render a circle shaped `Switcher`.
  /// * onChange: `It's required`;
  /// * initialValue: Default is `false`;
  /// * duration: Default is `Duration(milliseconds: 100)`;
  /// * size: Default is `24.0`;
  /// * activeColor: Default is `Theme.of(context).accentColor`;
  /// * disableColor: Default is `Theme.of(context).disabledColor`;
  Switcher.rounded({
    @required this.onChange,
    this.initialValue = false,
    this.duration = const Duration(milliseconds: 100),
    this.size = 25.0,
    this.activeColor,
    this.disableColor,
  })  :

        /// Set background `size`.
        _backgroundSize = size * 1.8,

        /// Set shape to a `circle`.
        this._borderRadius = size * 2.66,

        /// Assert [onChange] is not null.
        assert(onChange != null, 'The onChange function must be seted'),

        /// Assert [size] is greater than or equal to `16.0`.
        assert(size >= 16.0, 'The size must be greater than or equal to 16.0');

  /// The named constructor called [label] that render a square shaped `Switcher`
  /// with a `label`.
  /// * onChange: `It's required`;
  /// * initialValue: Default is `false`;
  /// * duration: Default is `Duration(milliseconds: 100)`;
  /// * size: Default is `24.0`;
  /// * activeColor: Default is `Theme.of(context).accentColor`;
  /// * disableColor: Default is `Theme.of(context).disabledColor`;
  Switcher.label({
    @required this.onChange,
    @required this.label,
    this.labelStyle = const TextStyle(),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.initialValue = false,
    this.duration = const Duration(milliseconds: 100),
    this.size = 25.0,
    this.activeColor,
    this.disableColor,
  })  :

        /// Set background `size`.
        _backgroundSize = size * 1.8,

        /// Set shape to a `square`.
        this._borderRadius = size / 6,

        /// Assert [onChange] is not null.
        assert(onChange != null, 'The onChange function must be seted'),

        /// Assert [label] is not null.
        assert(label != null, 'The label variable must be seted'),

        /// Assert [size] is greater than or equal to `16.0`.
        assert(size >= 16.0, 'The size must be greater than or equal to 16.0');

  /// The named constructor called [label] that render a circle shaped `Switcher`
  /// with a `label`.
  /// * onChange: `It's required`;
  /// * initialValue: Default is `false`;
  /// * duration: Default is `Duration(milliseconds: 100)`;
  /// * size: Default is `24.0`;
  /// * activeColor: Default is `Theme.of(context).accentColor`;
  /// * disableColor: Default is `Theme.of(context).disabledColor`;
  Switcher.labelAndRounded({
    @required this.onChange,
    @required this.label,
    this.labelStyle = const TextStyle(),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.initialValue = false,
    this.duration = const Duration(milliseconds: 100),
    this.size = 25.0,
    this.activeColor,
    this.disableColor,
  })  :

        /// Set background `size`.
        _backgroundSize = size * 1.8,

        /// Set shape to a `circle`.
        this._borderRadius = size * 2.66,

        /// Assert [onChange] is not null.
        assert(onChange != null, 'The onChange function must be seted'),

        /// Assert [label] is not null.
        assert(label != null, 'The label variable must be seted'),

        /// Assert [size] is greater than or equal to `16.0`.
        assert(size >= 16.0, 'The size must be greater than or equal to 16.0');

  @override
  _SwitcherState createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  /// The inner control value.
  /// This will be control the state of [Switcher's] widget.
  bool selected = false;

  // Overrides the [initState] method from [StatefulWidget] to set the value
  /// of `selected` to `initialValue` if is provided.
  @override
  void initState() {
    super.initState();

    selected = widget.initialValue;
  }

  bool get hasLabel => widget.label != null;

  /// Method to return the [activeColor].
  ///
  /// * `context`: The [BuildContext] to access the [ThemeData.accentColor];
  /// * `isBackground`: This specifies if the [Colors.withAlpha] method must be
  /// called or not. The default value is `false`.
  Color activeColor(BuildContext context, [bool isBackground = false]) {
    Color ac = widget.activeColor != null
        ? widget.activeColor
        : Theme.of(context).accentColor;

    if (isBackground) {
      ac = ac.withAlpha(100);
    }

    return ac;
  }

  /// Method to return the [disableColor].
  ///
  /// * `context`: The [BuildContext] to access the [ThemeData.disabledColor];
  /// * `isBackground`: This specifies if the [Colors.withAlpha] method must be
  /// called or not. The default value is `false`.
  Color disableColor(BuildContext context, [bool isBackground = false]) {
    Color dc = widget.disableColor != null
        ? widget.disableColor
        : Theme.of(context).disabledColor;

    if (isBackground) {
      dc = dc.withAlpha(100);
    }

    return dc;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() => selected = !selected);
        widget.onChange(selected);
      },
      child:
          hasLabel ? buildSwitcherWithLabel(context) : buildSwitcher(context),
    );
  }

  /// Method that return a [Row] with the label ([Text]) and the [Switcher].
  Widget buildSwitcherWithLabel(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0, right: 8.0),
          child: Text(
            widget.label,
            style: widget.labelStyle,
          ),
        ),
        buildSwitcher(context),
      ],
    );
  }

  /// Method that return the [Switcher].
  Widget buildSwitcher(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: AnimatedContainer(
        duration: widget.duration,
        width: widget._backgroundSize,
        height: widget.size,
        alignment: selected ? Alignment.centerRight : Alignment.centerLeft,
        decoration: BoxDecoration(
          color: selected
              ? activeColor(context, true)
              : disableColor(context, true),
          borderRadius: BorderRadius.circular(widget._borderRadius),
        ),
        child: AnimatedContainer(
          duration: widget.duration,
          height: widget.size,
          width: widget.size,
          decoration: BoxDecoration(
            color: selected ? activeColor(context) : disableColor(context),
            borderRadius: BorderRadius.circular(widget._borderRadius),
          ),
        ),
      ),
    );
  }
}
