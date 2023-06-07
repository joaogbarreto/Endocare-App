import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:primeiroprojeto/firestore/firestore_glicose/models/glicose.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../styles/color.dart';

class LineChartWidget extends StatefulWidget {
  final List<Glicose> glicoseNoSangue;

  const LineChartWidget({
    Key? key,
    required this.glicoseNoSangue
  }) : super(key: key);

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  List<_ChartData> chartData = <_ChartData>[];

  @override
  void initState() {
    getDataFromFireStore().then((results) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {});
      });
    });
    super.initState();
  }

  Future<void> getDataFromFireStore() async {
    var snapShotsValue =
        await FirebaseFirestore.instance.collection("glicose").get();
    List<_ChartData> list = snapShotsValue.docs
        .map((e) => _ChartData(
            x: e.data()['hora'],
            // x: DateTime.fromMillisecondsSinceEpoch(
            //     e.data()['data'].millisecondsSinceEpoch),
            y: e.data()['sugar Concentration']))
        .toList();
    setState(() {
      chartData = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showChart();
  }

  Widget _showChart() {
    return SafeArea(
      child: AspectRatio(
        aspectRatio: 13 / 9,
        child: SfCartesianChart(
            title: ChartTitle(
                text: 'Nivel Glicêmico',
                textStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    color: principalColor)),
            legend: Legend(
                isVisible: false,
                alignment: ChartAlignment.center,
                orientation: LegendItemOrientation.horizontal),
            tooltipBehavior: TooltipBehavior(enable: true),
            primaryXAxis: CategoryAxis(),
            series: <LineSeries<_ChartData, String>>[
              LineSeries<_ChartData, String>(
                  name: 'Glicemia',
                  color: red,
                  dataSource: chartData,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y)
            ]),
      ),
    );
  }
}

class _ChartData {
  _ChartData({this.x, this.y});

  final String? x;
  final double? y;
}
