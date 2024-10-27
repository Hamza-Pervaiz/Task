import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class VerticalBarGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 20, // Maximum Y-axis value
            barTouchData: BarTouchData(enabled: true),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    return Text('${value.toInt()}');
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    return Text(
                      'Day ${value.toInt() + 1}', // Label for each bar
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ),
            ),
            gridData: FlGridData(show: false),
            barGroups: [
              BarChartGroupData(x: 0, barRods: [
                BarChartRodData(toY: 8, color: Colors.blue, width: 16),
              ]),
              BarChartGroupData(x: 1, barRods: [
                BarChartRodData(toY: 10, color: Colors.green, width: 16),
              ]),
              BarChartGroupData(x: 2, barRods: [
                BarChartRodData(toY: 14, color: Colors.red, width: 16),
              ]),
              BarChartGroupData(x: 3, barRods: [
                BarChartRodData(toY: 15, color: Colors.orange, width: 16),
              ]),
              BarChartGroupData(x: 4, barRods: [
                BarChartRodData(toY: 13, color: Colors.purple, width: 16),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
