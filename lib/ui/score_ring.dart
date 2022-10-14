import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var taskNotCompletedColor = Color.fromARGB(255, 175, 175, 175);

class ScoreRing extends CustomPainter {
  ScoreRing({required this.score});

  final int score;

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = size.width / 15.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    var taskCompletedColor = const Color.fromARGB(255, 52, 221, 57);
    if (score > 70) {
      taskCompletedColor = const Color.fromARGB(255, 52, 221, 57);
    } else if (score > 49) {
      taskCompletedColor = const Color.fromARGB(255, 253, 159, 18);
    } else {
      taskCompletedColor = const Color.fromARGB(255, 236, 66, 66);
    }

    // 3. create and configure the background paint
    final backgroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = taskNotCompletedColor
      ..style = PaintingStyle.stroke;
    // 4. draw a circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // 5. create and configure the foreground paint
    final foregroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = taskCompletedColor
      ..style = PaintingStyle.stroke;
    // 6. draw an arc that starts from the top (-pi / 2)
    // and sweeps and angle of (2 * pi * progress)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14 / 2,
      2 * 3.14 * (score / 100),
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant ScoreRing oldDelegate) =>
      oldDelegate.score != score;
}
