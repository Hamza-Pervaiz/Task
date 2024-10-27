import 'package:alpha/resources/reponsive_size.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LineChart(
          LineChartData(
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  interval: 10,
                  getTitlesWidget: (value, meta) {
                    return Text(value.toInt().toString());
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTitlesWidget: (value, meta) {
                    switch (value.toInt()) {
                      case 0:
                        return const Text('M');
                      case 1:
                        return const Text('T');
                      case 2:
                        return const Text('W');
                      case 3:
                        return const Text('T');
                      case 4:
                        return const Text('F');
                      case 5:
                        return const Text('S');
                      case 6:
                        return const Text('S');
                      default:
                        return const Text('');
                    }
                  },
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            gridData: FlGridData(show: true),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff37434d), width: 1),
            ),
            minX: 0,
            maxX: 6,
            minY: 0,
            maxY: 40,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 10),
                  FlSpot(1, 20),
                  FlSpot(2, 30),
                  FlSpot(3, 20),
                  FlSpot(4, 40), // Add label for this point
                  FlSpot(5, 30),
                  FlSpot(6, 20),
                ],
                isCurved: true,
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                dotData: FlDotData(
                  show: true,
                  checkToShowDot: (spot, barData) => spot.x == 3,
                ),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: gradientColors
                        .map((color) => color.withOpacity(0.3))
                        .toList(),
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
            showingTooltipIndicators: [
              ShowingTooltipIndicators([
                LineBarSpot(
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 10),
                      FlSpot(1, 20),
                      FlSpot(2, 30),
                      FlSpot(3, 20),
                      FlSpot(4, 40), // Show dot here
                      FlSpot(5, 30),
                      FlSpot(6, 20),
                    ],
                  ),
                  0,
                  FlSpot(4, 40),
                ),
              ]),
            ],
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                getTooltipItems: (List<LineBarSpot> touchedSpots) {
                  return touchedSpots.map((spot) {
                    return LineTooltipItem(
                      'Point (${spot.x.toInt()}, ${spot.y.toInt()})',
                      TextStyle(color: Colors.white),
                    );
                  }).toList();
                },
              ),
            ),
          ),
        ),
        Positioned(
          left: MySize.size140, // Adjust this based on your chart's layout
          top: MySize.size40, // Adjust this based on your chart's layout
          child: Container(
            width: MySize.size100,
            height: MySize.size60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(MySize.size12)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(MySize.size4),
                  child: Text(
                    "\$1.000",
                    style: TextStyle(
                      //color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(MySize.size6),
                  child: Text(
                    '23 August, 2023',
                    style: TextStyle(fontSize: MySize.size10),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
