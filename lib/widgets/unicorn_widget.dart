import 'package:contty_app/widgets/painter_widget.dart';
import 'package:flutter/material.dart';

class UnicornBorderWidget extends StatelessWidget {
  final GradientPainter _painter;
  final BoxDecoration? decoration;
  final Widget? child;
  final double? width;
  final double? height;

  UnicornBorderWidget(
      {super.key, this.decoration, this.child, this.width, this.height})
      : this._painter = GradientPainter(
            strokeWidth: 1,
            radius: 15,
            gradient: LinearGradient(colors: [
              Color(0xff00A97366),
              Color(0xffE9B87566),
              Color(0xffFF00B066),
              Color(0xffE9B87566),
            ]));
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomPaint(
      painter: _painter,
      child: Container(
        decoration: decoration,
        child: child,
      ),
    );
  }
}

/** --- Unicorn Button --- **/
class UnicornOutlineBorder extends StatelessWidget {
  final GradientPainter _painter;
  final Widget _child;
  final VoidCallback _callback;
  final double _radius;
  final Color? backgroundColor;

  UnicornOutlineBorder(
      {required double strokeWidth,
      required double radius,
      required Gradient gradient,
      required Widget child,
      required VoidCallback onPressed,
      this.backgroundColor})
      : this._painter = GradientPainter(
            strokeWidth: strokeWidth, radius: radius, gradient: gradient),
        this._child = child,
        this._callback = onPressed,
        this._radius = radius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _callback,
        child: InkWell(
          borderRadius: BorderRadius.circular(_radius),
          onTap: _callback,
          splashColor: backgroundColor,
          child: Container(
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(_radius)),
            padding: EdgeInsets.all(15),
            constraints: BoxConstraints(minWidth: 184, minHeight: 34),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/** **/
class UnicornContainer extends StatelessWidget {
  final GradientPainter _painter;
  final Widget _child;
  final double _radius;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  UnicornContainer(
      {required double strokeWidth,
      required double radius,
      required Gradient gradient,
      required Widget child,
      this.width,
      this.height,
      this.padding,
      this.margin,
      this.backgroundColor})
      : this._painter = GradientPainter(
            strokeWidth: strokeWidth, radius: radius, gradient: gradient),
        this._child = child,
        this._radius = radius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: InkWell(
          borderRadius: BorderRadius.circular(_radius),
          splashColor: backgroundColor,
          child: Container(
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(_radius)),
              padding: padding,
              width: width,
              height: height,
              child: _child),
        ),
      ),
    );
  }
}
