import 'package:flutter/material.dart';

class WindowsXPButton extends StatelessWidget {
  final String type; // Puede ser "minimize", "maximize" o "close"

  const WindowsXPButton({required this.type, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: CustomPaint(
        painter: _WindowsXPButtonPainter(type),
      ),
    );
  }
}

class _WindowsXPButtonPainter extends CustomPainter {
  final String type;

  _WindowsXPButtonPainter(this.type);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = type == 'close' ? Colors.red : Colors.blue
      ..style = PaintingStyle.fill;

    // Fondo del botón
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );

    // Ícono del botón
    final textPainter = TextPainter(
      text: TextSpan(
        text: type == 'minimize'
            ? '_'
            : type == 'maximize'
                ? '□'
                : 'X',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    textPainter.paint(
      canvas,
      Offset((size.width - textPainter.width) / 2,
          (size.height - textPainter.height) / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
