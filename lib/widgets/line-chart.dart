import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primeiroprojeto/objects/glicose.dart';

import '../styles/color.dart';

class LineChartWidget extends StatelessWidget {
  final List<Glicose> glicoseNoSangue;

  const LineChartWidget(this.glicoseNoSangue, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 8,
          minY: 70,
          maxY: 125,
          lineBarsData: [
            LineChartBarData(
                spots: glicoseNoSangue
                    .map((point) => FlSpot(point.day, point.sugarConcentration))
                    .toList(),
                isCurved: false,
                barWidth: 3,
                color: red,
                dotData: FlDotData(show: true)
            )
          ]
        )
      ),
    );
  }
}
