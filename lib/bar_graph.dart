import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'bar_graph_handler.dart';
import 'dart:math';

class BarChartSample3 extends StatefulWidget {
  BarChartSample3(this.data);
  List<int> data;
  int maxY = 30;
  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {
  @override
  void initState() {
    super.initState();
  }

  @override
  final Duration animDuration = const Duration(milliseconds: 200);
  Widget build(BuildContext context) {
    widget.maxY = widget.data.reduce(max) + 2;
    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: const Color(0xff2c4260),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Score Distribution',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            Expanded(
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: widget.maxY.toDouble(),
                  barTouchData: BarTouchData(
                    enabled: false,
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.transparent,
                      tooltipPadding: const EdgeInsets.all(0),
                      tooltipBottomMargin: 8,
                      getTooltipItem: (
                        BarChartGroupData group,
                        int groupIndex,
                        BarChartRodData rod,
                        int rodIndex,
                      ) {
                        return BarTooltipItem(
                          rod.y.round().toString(),
                          TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      showTitles: true,
                      textStyle: TextStyle(
                          color: const Color(0xff7589a2),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                      margin: 30,
                      getTitles: (double value) {
                        switch (value.toInt()) {
                          case 0:
                            return '0-10';
                          case 1:
                            return '10-20';
                          case 2:
                            return '20-30';
                          case 3:
                            return '30-40';
                          case 4:
                            return '40-50';
                          case 5:
                            return '50-60';
                          case 6:
                            return '60-70';
                          case 7:
                            return '70-80';
                          case 8:
                            return '80-90';
                          case 9:
                            return '90-100';
                          default:
                            return '';
                        }
                      },
                    ),
                    leftTitles: SideTitles(showTitles: false),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(
                          y: widget.data[0].toDouble(),
                          color: Colors.lightBlueAccent)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(
                          y: widget.data[1].toDouble(),
                          color: Colors.lightBlueAccent)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(
                          y: widget.data[2].toDouble(),
                          color: Colors.lightBlueAccent)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(
                          y: widget.data[3].toDouble(),
                          color: Colors.lightBlueAccent)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 4, barRods: [
                      BarChartRodData(
                          y: widget.data[4].toDouble(),
                          color: Colors.lightBlueAccent)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 5, barRods: [
                      BarChartRodData(
                          y: widget.data[5].toDouble(),
                          color: Colors.lightBlueAccent)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 6, barRods: [
                      BarChartRodData(
                          y: widget.data[6].toDouble(),
                          color: Colors.lightBlueAccent)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 7, barRods: [
                      BarChartRodData(
                          y: widget.data[7].toDouble(),
                          color: Colors.lightBlueAccent)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 8, barRods: [
                      BarChartRodData(
                          y: widget.data[8].toDouble(),
                          color: Colors.lightBlueAccent)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 9, barRods: [
                      BarChartRodData(
                          y: widget.data[9].toDouble(),
                          color: Colors.lightBlueAccent)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
