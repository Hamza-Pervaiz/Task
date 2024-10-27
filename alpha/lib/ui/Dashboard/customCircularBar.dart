import 'package:alpha/resources/reponsive_size.dart';
import 'package:flutter/material.dart';

class GenderCircularBar extends StatelessWidget {
  final int femalePercent; // Percentage of female followers
  final int malePercent; // Percentage of male followers

  const GenderCircularBar({
    Key? key,
    required this.femalePercent,
    required this.malePercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // Center the children within the stack
      children: [
        Container(
          width: 150, // Size of the circular bar
          height: 150,
          child: CustomPaint(
            painter: CircularBarPainter(
              femalePercent: femalePercent,
              malePercent: malePercent,
            ),
          ),
        ),
        // Container for Female Percentage
        Positioned(
          bottom: 140,
          left: 100, // Adjust the position as needed
          child: Container(
            width: MySize.size40,
            height: MySize.size40,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(MySize.size26),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: MySize.size4),
              child: Text(
                '${femalePercent}%',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        // Container for Male Percentage
        Positioned(
          bottom: 140,
          left: 0, // Adjust the position as needed
          child: Container(
            width: MySize.size40,
            height: MySize.size40,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(MySize.size26),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: MySize.size4),
              child: Text(
                '${malePercent}%',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: MySize.size120, // Adjust the position as needed
          child: Container(
              width: MySize.size60,
              height: MySize.size60,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                // color: Colors.blue.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset('assets/images/circular_bar_avatar.jpg')),
        ),
      ],
    );
  }
}

class CircularBarPainter extends CustomPainter {
  final int femalePercent;
  final int malePercent;

  CircularBarPainter({
    required this.femalePercent,
    required this.malePercent,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke // Draw only the stroke
      ..strokeWidth = 10; // Set thickness of the circular bar

    double startAngle =
        -90 * (3.141592653589793238 / 180); // Start from the top

    // Calculate the sweep angles
    double sweepAngleFemale =
        (femalePercent / 100) * 360 * (3.141592653589793238 / 180);
    double sweepAngleMale =
        (malePercent / 100) * 360 * (3.141592653589793238 / 180);

    // Draw female segment (Yellow)
    paint.color = Colors.yellow;
    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      startAngle,
      sweepAngleFemale,
      false, // Changed to false to not fill the arc
      paint,
    );

    // Draw male segment (Blue)
    startAngle += sweepAngleFemale; // Move to the next angle without a gap
    paint.color = Colors.blue;
    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      startAngle,
      sweepAngleMale,
      false, // Changed to false to not fill the arc
      paint,
    );

    // Optionally, draw a circular background to hide the center line
    final Paint backgroundPaint = Paint()
      ..color = Colors.white // Match the background color
      ..style = PaintingStyle.fill; // Fill the inner circle

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      (size.width / 2) -
          paint.strokeWidth, // Adjust radius based on stroke width
      backgroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint when values change
  }
}
