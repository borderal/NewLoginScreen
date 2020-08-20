import 'package:flutter/material.dart';
import 'percentage.dart';
import 'bar_graph.dart';
import 'bar_graph_handler.dart';
import 'line_graph.dart';
import 'line_graph_handler.dart';

class Dashboard extends StatefulWidget {
  Dashboard({this.data});
  final List<Map<dynamic, dynamic>> data;
  final double initialScore = .2;
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double itemScore = .5;
  double lineGraphAverage;
  List barGraphData;
  List lineGraphValue;

  @override
  void initState() {
    barGraphData = barGraphHandler(widget.data);
    double itemScoreAverage = 0.0;
    widget.data.forEach((item) {
      itemScoreAverage += ((item['Item Score'] / widget.data.length) / 100);
    });
    itemScore = double.parse('$itemScoreAverage');
    lineGraphAverage = lineGraphAverageHandler(widget.data).toDouble();
    lineGraphValue = lineGraphInit(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Percentage(
                      percentage: itemScore,
                    ),
                  ),
                  Expanded(
                    child: BarChartSample3(barGraphData),
                  ),
                  Expanded(
                    child: LineChartSample2(
                      averageData: lineGraphAverage,
                      value: lineGraphValue,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Card(
                margin: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text(
                          'Title',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Item Score',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Image Count',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                          label: Text(
                        'Weekly Sales',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                    ],
                    rows: widget.data
                        .map(
                          ((element) => DataRow(
                                cells: <DataCell>[
                                  DataCell(
                                    Text(element['Title']),
                                    onTap: () {
                                      setState(() {
                                        itemScore = element['Item Score'] / 100;
                                        barGraphData = barGraphDistribution(
                                            [element['Item Score']]);
                                        lineGraphValue = [element['Sales']];
                                      });
                                    },
                                  ),
                                  DataCell(
                                    Text(
                                      element['Item Score'].toString(),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        itemScore = element['Item Score'] / 100;
                                        barGraphData = barGraphDistribution(
                                            [element['Item Score']]);
                                        lineGraphValue = [element['Sales']];
                                      });
                                    },
                                  ),
                                  DataCell(
                                    Text(
                                      element['Image Count'].toString(),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        itemScore = element['Item Score'] / 100;
                                        barGraphData = barGraphDistribution(
                                            [element['Item Score']]);
                                        lineGraphValue = [element['Sales']];
                                      });
                                    },
                                  ),
                                  DataCell(
                                    Text(
                                      element['Sales'].toString(),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        itemScore = element['Item Score'] / 100;
                                        barGraphData = barGraphDistribution(
                                            [element['Item Score']]);
                                        lineGraphValue = [element['Sales']];
                                      });
                                    },
                                  ),
                                ],
                              )),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
