
import 'package:flutter/material.dart';

enum TabIndicatiorAlignVertical {
  center,
  up,
  down,
}
class TabIndicatior extends Decoration {
  final double height;
  final double width;
  final double radius;
  final Color color;
  final TabIndicatiorAlignVertical align;
  @override
  final EdgeInsetsGeometry padding;
  const TabIndicatior({
    this.height = 2,
    this.color = Colors.redAccent,
    this.width = 0,
    this.radius = 1,
    this.padding = EdgeInsets.zero,
    this.align = TabIndicatiorAlignVertical.down,
  });

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is TabIndicatior) {
      return TabIndicatior(
        padding: EdgeInsetsGeometry.lerp(a.padding, padding, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is TabIndicatior) {
      return TabIndicatior(
        padding: EdgeInsetsGeometry.lerp(padding, b.padding, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TabIndicatiorPainter(this, onChanged);
  }

}

class _TabIndicatiorPainter extends BoxPainter {
  _TabIndicatiorPainter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  final TabIndicatior decoration;
  double get indicatorHeight => decoration.height;
  double get indicatorWidth => decoration.width;
  Color get indicatorColor => decoration.color;
  double get indicatorRadius => decoration.radius;
  EdgeInsetsGeometry get padding => decoration.padding;
  TabIndicatiorAlignVertical get align => decoration.align;


  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    Rect indicator = padding.resolve(textDirection).deflateRect(rect);

    double width = indicatorWidth > 0 ? indicatorWidth : indicator.width;
    double height = indicatorHeight > 0 ? indicatorHeight : indicator.height;
    double left = (indicator.left+indicator.right - width)*0.5;
    double top;

    switch(align) {
      case TabIndicatiorAlignVertical.up:
        top = indicator.top;
        break;
      case TabIndicatiorAlignVertical.down:
        top = indicator.bottom - height;
        break;
      default:
        top = (indicator.height - height)*0.5;
        break;
    }
    print(rect.toString() + indicator.toString() + height.toString() + top.toString());

    return Rect.fromLTWH(
      left,
      top ,
      width,
      height,
    );
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final TextDirection textDirection = configuration.textDirection!;
    final Rect indicator = _indicatorRectFor(rect, textDirection);
    final Paint paint = Paint();
    paint.color = indicatorColor;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndRadius(indicator, Radius.circular(indicatorRadius)),
        paint);
  }
}