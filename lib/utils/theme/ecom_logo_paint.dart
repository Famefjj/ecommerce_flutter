import 'package:flutter/material.dart';

class EcomLogoPainter extends CustomPainter {
  final Color strokeColor;

  EcomLogoPainter({required this.strokeColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = strokeColor
      ..strokeWidth = size.width * 0.08 // Scales stroke relative to widget size
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    
    // Outer Bag Structure (Coordinates mapped to a normalized 100x100 bounding box)
    path.moveTo(size.width * 0.25, size.width * 0.40); // Start at the handle loop point
    
    // Top handle arch
    path.cubicTo(
      size.width * 0.20, size.width * 0.15, // Control point 1
      size.width * 0.50, size.width * 0.15, // Control point 2
      size.width * 0.55, size.width * 0.40, // End handle
    );
    
    // Right side of the bag
    path.lineTo(size.width * 0.75, size.width * 0.40);
    path.lineTo(size.width * 0.85, size.width * 0.75);
    
    // Bottom edge and Arrow base
    path.lineTo(size.width * 0.20, size.width * 0.80);
    
    // Arrow head return trip
    path.lineTo(size.width * 0.40, size.width * 0.80);
    path.lineTo(size.width * 0.30, size.width * 0.90);
    path.moveTo(size.width * 0.40, size.width * 0.80);
    path.lineTo(size.width * 0.30, size.width * 0.70);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant EcomLogoPainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor;
  }
}