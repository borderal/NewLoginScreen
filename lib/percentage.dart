import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Percentage extends StatelessWidget {
  Percentage({this.percentage});
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: const Color(0xff2c4260),
        child: new CircularPercentIndicator(
          radius: 250,
          lineWidth: 13.0,
          animation: true,
          animationDuration: 1500,
          percent: percentage,
          center: new Text(
            '${(percentage * 100).toStringAsFixed(2)}% ',
            style: new TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          footer: new Text(
            "Item Score",
            style: new TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17.0),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.purple,
        ),
      ),
    );
  }
}
