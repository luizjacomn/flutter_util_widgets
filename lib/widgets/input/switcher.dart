import 'package:flutter/material.dart';

class Switcher extends StatefulWidget {
  final void Function(bool value) onChange;

  final bool initialValue;

  final double size;

  final Duration duration;

  final Color activeColor;

  final Color disableColor;

  final double _borderRadius;

  Switcher({
    @required this.onChange,
    this.initialValue = false,
    this.duration = const Duration(milliseconds: 100),
    this.size = 24.0,
    this.activeColor,
    this.disableColor,
  })  : this._borderRadius = size / 6,
        assert(onChange != null),
        assert(size >= 16.0);

  Switcher.rounded({
    @required this.onChange,
    this.initialValue = false,
    this.duration = const Duration(milliseconds: 100),
    this.size = 25.0,
    this.activeColor,
    this.disableColor,
  })  : this._borderRadius = size * 2.66,
        assert(onChange != null),
        assert(size >= 16.0);

  @override
  _SwitcherState createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  bool selected = false;

  @override
  void initState() {
    super.initState();

    selected = widget.initialValue;
  }

  Color activeColor(BuildContext context, [bool isBackground = false]) {
    Color ac = widget.activeColor != null
        ? widget.activeColor
        : Theme.of(context).accentColor;

    if (isBackground) {
      ac = ac.withAlpha(100);
    }

    return ac;
  }

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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: AnimatedContainer(
          duration: widget.duration,
          width: widget.size * 1.8,
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
      ),
    );
  }
}
