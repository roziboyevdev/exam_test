import 'package:flutter/material.dart';

class PainterScreen extends StatefulWidget {
  const PainterScreen({super.key});

  @override
  State<PainterScreen> createState() => _PainterScreenState();
}

class _PainterScreenState extends State<PainterScreen> {
  final List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              points.add(details.localPosition);
            });
          },
          onPanDown: (details) {
            setState(() {
              points.add(null);
            });
          },
          child: CustomPaint(painter: SignaturePainter(points)),
        ),
      ),
    );
  }
}

class SignaturePainter extends CustomPainter {
  final List<Offset?> points;
  const SignaturePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    for (var i = 0; i < points.length - 1; i++) {
      if (points[i] != null &&
          points[i + 1] != null &&
          ((points[i]!.dy > size.height && points[i + 1]!.dy < size.height) &&
              (points[i]!.dy > 0 && points[i + 1]!.dy > 0)) &&
          ((points[i]!.dx < size.width && points[i + 1]!.dx < size.width) &&
              (points[i]!.dx > 0 && points[i + 1]!.dx > 0))) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
