import 'package:flutter/material.dart';

//
/// The switcher widget isolated.
///
class SwitcherWidget extends StatelessWidget {
  final double _backgroundSize;
  final double size;
  final double borderRadius;
  final bool selected;
  final Duration duration;
  final Color disableColor;
  final Color activeColor;

  /// The default [SwitcherWidget] constructor.
  /// * size;
  /// * borderRadius;
  /// * selected;
  /// * duration;
  const SwitcherWidget({
    @required this.size,
    @required this.borderRadius,
    @required this.selected,
    @required this.duration,
    this.activeColor,
    this.disableColor,
  }) :
  /// This is a inner variable to control the size background of `SwitcherWidget`.
  /// The value of this variable is equal to `size * (times) 1.8`.
  this._backgroundSize = size * 1.8;

  /// Method to return the [activeColor].
  ///
  /// * `context`: The [BuildContext] to access the [ThemeData.accentColor];
  /// * `isBackground`: This specifies if the [Colors.withAlpha] method must be
  /// called or not. The default value is `false`.
  Color _activeColor(BuildContext context, [bool isBackground = false]) {
    Color ac =
        activeColor != null ? activeColor : Theme.of(context).accentColor;

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
  Color _disableColor(BuildContext context, [bool isBackground = false]) {
    Color dc =
        disableColor != null ? disableColor : Theme.of(context).disabledColor;

    if (isBackground) {
      dc = dc.withAlpha(100);
    }

    return dc;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: AnimatedContainer(
        duration: duration,
        width: _backgroundSize,
        height: size,
        alignment: selected ? Alignment.centerRight : Alignment.centerLeft,
        decoration: BoxDecoration(
          color: selected
              ? _activeColor(context, true)
              : _disableColor(context, true),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: AnimatedContainer(
          duration: duration,
          height: size,
          width: size,
          decoration: BoxDecoration(
            color: selected ? _activeColor(context) : _disableColor(context),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
