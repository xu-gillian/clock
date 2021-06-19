import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class ClockView extends StatefulWidget {
  final double size;

  const ClockView({Key? key, required this.size}) : super(key: key);
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  // 60 sec - 360, 1 sec - 6 degree
  // 12 hours

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    // var fillBrush = Paint()..color = Color(0xFF444974);
    var outline = Paint()
      ..color = Color(0xFFFFFFFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 60 ;

    // canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius * 0.75, outline);

    var centerFillBrush = Paint()
      ..color = Color(0xFFFFFFFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 60;

    // second, minute, hour hand
    var secondBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 60;

    var minuteBrush = Paint()
      ..color = Color(0xFFA9A9A9)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 50;

    var hourBrush = Paint()
      ..color = Color(0xFF696969)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 30;

    var hourHandX = centerX +
        radius * 0.4 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX +
        radius * 0.4 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourBrush);

    var minHandX = centerX + radius * 0.5 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerY + radius * 0.5 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minuteBrush);

    var secHandX = centerX + radius * 0.6 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + radius * 0.6 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secondBrush);

    canvas.drawCircle(center, radius * 0.02, centerFillBrush);

    var outerCircleRadius = radius * 0.95;
    var innerCircleRadius = radius * 0.85;

    var dashBrush = Paint()
      ..color = Color(0xFFFFFFFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
