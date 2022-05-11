import 'package:flutter/material.dart';
import 'package:joya/pages/plant_charts/widgets/chart_component.dart';

class PlantChart extends StatefulWidget {
  PlantChart({Key? key}) : super(key: key);

  @override
  _PlantChartState createState() => _PlantChartState();
}

class _PlantChartState extends State<PlantChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 700,
      child: ChartComponent(),
    );
  }
}
