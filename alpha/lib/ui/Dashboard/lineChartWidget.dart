import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class lineChartWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 40,
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 10,
              getTitlesWidget: (value, meta) {
                return Text(value.toInt().toString());
              },
              reservedSize: 40,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
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
              reservedSize: 40,
            ),
          ),
        ),
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
          drawVerticalLine: true,
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 10),
              FlSpot(1, 20),
              FlSpot(2, 30),
              FlSpot(3, 20),
              FlSpot(4, 40),
              FlSpot(5, 30),
              FlSpot(6, 20),
            ],
            isCurved: true,
            color: Color.fromARGB(3, 76, 233, 233),
            barWidth: 5,
            belowBarData: BarAreaData(
              show: true,
              //  color: ,
            ),
          ),
        ],
      ),
    );
  }
}
