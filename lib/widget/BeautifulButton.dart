import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  // 渐变色数组
  final List<Color> colors;

  // 按钮宽高
  final double width;
  final double height;

  final Widget child;
  final BorderRadius borderRadius;

  //点击回调
  final GestureTapCallback onPressed;

  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.onPressed,
    this.borderRadius,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

class CustomPaintRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return ListView(
//      children: <Widget>[
//        CustomPaint(
//          size: Size(300, 300),
//          painter: MyPainter(),
//        ),
    return Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(child: null,)
          ],
        )
    );
//      ]
//    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint()
      ..color = Colors.blueAccent
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke;
//    canvas.drawLine(Offset(10, 10), Offset(250, 250), p);
    canvas.drawCircle(Offset(125, 125), 20, p);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
}
