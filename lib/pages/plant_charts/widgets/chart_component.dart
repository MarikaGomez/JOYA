import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'sensor_data.dart';

class ChartComponent extends StatefulWidget {
  const ChartComponent({Key? key}) : super(key: key);

  @override
  State<ChartComponent> createState() => _ChartComponentState();
}

class _ChartComponentState extends State<ChartComponent> {
  late List<SensorData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(
          text: 'Les statistiques de ma plante',
          textStyle:
          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      legend: Legend(isVisible: true),
      tooltipBehavior: _tooltipBehavior,
      series: <ChartSeries>[
        SplineAreaSeries<SensorData, String>(
            dataSource: _chartData,
            xValueMapper: (SensorData exp, _) => exp.sensorType,
            yValueMapper: (SensorData exp, _) => exp.luminosity,
            name: 'Luminosité',
            color: Colors.amber,
            opacity: .5),
        SplineAreaSeries<SensorData, String>(
            dataSource: _chartData,
            xValueMapper: (SensorData exp, _) => exp.sensorType,
            yValueMapper: (SensorData exp, _) => exp.humidity,
            name: 'Humidité',
            color: Colors.blue,
            opacity: .5),
        SplineAreaSeries<SensorData, String>(
            dataSource: _chartData,
            xValueMapper: (SensorData exp, _) => exp.sensorType,
            yValueMapper: (SensorData exp, _) => exp.temperature,
            name: 'Température',
            color: Colors.teal,
            opacity: .5),
      ],
      primaryXAxis: CategoryAxis(),
    );
  }

  List<SensorData> getChartData() {
    final List<SensorData> chartData = [
      SensorData('Lun', 955, 400, 45),
      SensorData('Mar', 330, 450, 54),
      SensorData('Mer', 643, 230, 20),
      SensorData('Jeu', 320, 540, 23),
      SensorData('Ven', 560, 180, 43),
      SensorData('Sam', 230, 540, 33),
      SensorData('Dim', 130, 440, 63),
    ];
    return chartData;
  }
}
