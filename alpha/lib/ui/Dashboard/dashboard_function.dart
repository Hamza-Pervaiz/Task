import 'package:alpha/resources/reponsive_size.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardFunction {
  Widget getPlatformIcon(String platform) {
    switch (platform) {
      case "Facebook":
        return const Icon(
          Icons.facebook,
          color: Colors.blue,
        );
      case "Instagram":
        return const FaIcon(
          FontAwesomeIcons
              .instagram, // Use the Instagram icon from Font Awesome
          color: Colors.pink,
        );
      case "TikTok":
        return const FaIcon(
          FontAwesomeIcons.tiktok, // Use the TikTok icon from Font Awesome
          color: Colors.black,
        );
      default:
        return const Icon(
            Icons.error); // Fallback icon for unrecognized platforms
    }
  }

  Widget bargrahp() {
    return Padding(
      padding: EdgeInsets.only(top: MySize.size0),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 25, // Set maximum Y-axis value for uniform height
          barTouchData: BarTouchData(enabled: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false)), // Hide left titles
            rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false)), // Hide right titles
            topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false)), // Hide top titles
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  final dayLabels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                  return Text(
                    dayLabels[value.toInt()],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  );
                },
              ),
            ),
          ),
          gridData: FlGridData(show: false), // Hide grid lines
          borderData: FlBorderData(show: false), // Hide border/axis lines
          barGroups: [
            BarChartGroupData(x: 0, barRods: [
              BarChartRodData(
                toY: 8,
                color: Color.fromARGB(255, 148, 56, 224), // Filled color
                width: 16,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true, // Show background color
                  toY: 20, // Maximum Y for the background (unfilled)
                  color: Colors.grey[800]!, // Dark grey for empty portion
                ),
              ),
            ]),
            BarChartGroupData(x: 1, barRods: [
              BarChartRodData(
                toY: 10,
                color: Color.fromARGB(255, 148, 56, 224), // Filled color
                width: 16,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 20, // Maximum Y for the background (unfilled)
                  color: Colors.grey[800]!,
                ),
              ),
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(
                toY: 12,
                color: const Color.fromARGB(255, 148, 56, 224), // Filled color
                width: 16,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 20, // Maximum Y for the background (unfilled)
                  color: Colors.grey[800]!,
                ),
              ),
            ]),
            BarChartGroupData(x: 3, barRods: [
              BarChartRodData(
                toY: 16,
                color: Colors.orange, // Highest bar color
                width: 16,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 20, // Maximum Y for the background (unfilled)
                  color: Colors.grey[800]!,
                ),
              ),
            ]),
            BarChartGroupData(x: 4, barRods: [
              BarChartRodData(
                toY: 7,
                color: Color.fromARGB(255, 148, 56, 224), // Filled color
                width: 16,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 20, // Maximum Y for the background (unfilled)
                  color: Colors.grey[800]!,
                ),
              ),
            ]),
            BarChartGroupData(x: 5, barRods: [
              BarChartRodData(
                toY: 3,
                color: Color.fromARGB(255, 148, 56, 224), // Filled color
                width: 16,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 20, // Maximum Y for the background (unfilled)
                  color: Colors.grey[800]!,
                ),
              ),
            ]),
            BarChartGroupData(x: 6, barRods: [
              BarChartRodData(
                toY: 12,
                color: Color.fromARGB(255, 148, 56, 224), // Filled color
                width: 16,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 20, // Maximum Y for the background (unfilled)
                  color: Colors.grey[800]!,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget bargrahp_Statistic() {
    return Padding(
      padding: EdgeInsets.only(top: MySize.size30),
      child: Stack(
        children: [
          BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 40, // Set maximum Y-axis value for uniform height
              barTouchData: BarTouchData(enabled: true),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      // Define left Y-axis titles
                      switch (value.toInt()) {
                        case 0:
                          return const Text('0');
                        case 10:
                          return const Text('10');
                        case 20:
                          return const Text('20');
                        case 30:
                          return const Text('30');
                        case 40:
                          return const Text('40');
                        default:
                          return const Text('');
                      }
                    },
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles:
                      SideTitles(showTitles: false), // Hide right titles
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false), // Hide top titles
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      // Define bottom X-axis titles
                      final dayLabels = ['Mon', 'Tue'];
                      return Text(
                        dayLabels[value.toInt()],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      );
                    },
                  ),
                ),
              ),
              gridData: FlGridData(show: false), // Hide grid lines
              borderData: FlBorderData(show: false), // Hide border/axis lines
              barGroups: [
                // Three bars for Monday
                BarChartGroupData(x: 0, barRods: [
                  BarChartRodData(
                    toY: 15,
                    color: Colors.blue, // First bar color
                    width: 16,
                    backDrawRodData: BackgroundBarChartRodData(
                      show: false,
                      toY: 40, // Maximum Y for the background (unfilled)
                      color: Colors.grey[800]!,
                    ),
                  ),
                  BarChartRodData(
                    toY: 20,
                    color: Colors.yellow, // Second bar color
                    width: 16,
                    backDrawRodData: BackgroundBarChartRodData(
                      show: false,
                      toY: 40,
                      color: Colors.grey[800]!,
                    ),
                  ),
                  BarChartRodData(
                    toY: 25,
                    color: Colors.orange, // Third bar color
                    width: 16,
                    backDrawRodData: BackgroundBarChartRodData(
                      show: false,
                      toY: 40,
                      color: Colors.grey[800]!,
                    ),
                  ),
                ]),
                // Three bars for Tuesday
                BarChartGroupData(x: 1, barRods: [
                  BarChartRodData(
                    toY: 30,
                    color: Colors.blue, // First bar color
                    width: 16,
                    backDrawRodData: BackgroundBarChartRodData(
                      show: false,
                      toY: 40,
                      color: Colors.grey[800]!,
                    ),
                  ),
                  BarChartRodData(
                    toY: 25,
                    color: Colors.yellow, // Second bar color
                    width: 16,
                    backDrawRodData: BackgroundBarChartRodData(
                      show: false,
                      toY: 40,
                      color: Colors.grey[800]!,
                    ),
                  ),
                  BarChartRodData(
                    toY: 20,
                    color: Colors.orange, // Third bar color
                    width: 16,
                    backDrawRodData: BackgroundBarChartRodData(
                      show: false,
                      toY: 40,
                      color: Colors.grey[800]!,
                    ),
                  ),
                ]),
              ],
            ),
          ),
          // Positioning the container for info
          Positioned(
            left: MySize.size140, // Adjust this based on your needs for Monday
            bottom: MySize.size140, // Position from the bottom of the bar chart
            child: Container(
              width: MySize.size120,
              height: MySize.size100,
              color: const Color.fromARGB(255, 224, 224, 224),
              child: Center(
                  child: Column(
                children: [
                  Text('23 August, 2021'),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.blue,
                      ),
                      SizedBox(
                        width: MySize.size4,
                      ),
                      Text('15.650'),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.yellow,
                      ),
                      SizedBox(
                        width: MySize.size4,
                      ),
                      Text('2.650'),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.orange,
                      ),
                      SizedBox(
                        width: MySize.size4,
                      ),
                      Text('1.650'),
                    ],
                  ),
                ],
              )), // Container with info for Monday
            ),
          ),
          // Positioned(
          //   left: 200, // Adjust this based on your needs for Tuesday
          //   bottom: 15, // Position from the bottom of the bar chart
          //   child: Container(
          //     width: 100,
          //     height: 30,
          //     color: Colors.white.withOpacity(0.7),
          //     child: Center(
          //         child: Text("Info Tue")), // Container with info for Tuesday
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget buildGenderCircularBar(int femalePercent, int malePercent) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Female circular bar (Yellow) with a gap
        SizedBox(
          width: 150, // Size of the circular bar
          height: 150,
          child: CircularProgressIndicator(
            value: femalePercent / 100, // Female percentage
            valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
            strokeWidth: 15,
            // Optionally, set the background color
            backgroundColor: Colors.grey[300],
          ),
        ),
        // Male circular bar (Blue) with a gap
        Transform.rotate(
          angle: 0.1, // Rotate slightly to create a gap
          child: SizedBox(
            width: 150, // Size of the circular bar
            height: 150,
            child: CircularProgressIndicator(
              value: malePercent / 100, // Male percentage
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              strokeWidth: 15,
              // Optionally, set the background color
              backgroundColor: Colors.grey[300],
            ),
          ),
        ),
        // Center Text with percentages
        Positioned(
          child: Text(
            '$femalePercent% \n$malePercent%',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
