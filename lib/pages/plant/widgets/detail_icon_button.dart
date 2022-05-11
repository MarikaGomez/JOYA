import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/sensor_detail_cubit.dart';
import 'expanded_item.dart';

class DetailIconButton extends StatefulWidget {
  const DetailIconButton({Key? key}) : super(key: key);

  @override
  State<DetailIconButton> createState() => _DetailIconButtonState();
}

class _DetailIconButtonState extends State<DetailIconButton> {
  @override
  Widget build(BuildContext context) {
    var sensor = context.read<SensorCubit>().sensor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ExpandedItem(
          popupTitle: "Luminosité :",
          rate: sensor?.sensorData?.luminosity,
          unit: "LUX",
          min: sensor?.plant?.luminosity_needs.min,
          max: sensor?.plant?.luminosity_needs.max,
          label: "Luminosité",
          icon: Icons.wb_sunny_outlined,
          color: Colors.amber,
        ),
        ExpandedItem(
            popupTitle: "Humidité :",
            rate: sensor?.sensorData?.humidity,
            unit: "%",
            min: sensor?.plant?.humidity_needs.min,
            max: sensor?.plant?.humidity_needs.max,
            label: "Humidité",
            icon: Icons.water_drop,
            color: Colors.blue),
        /*ExpandedItem(
          popupTitle: "Fertilité du sol",
          rate: sensor?.sensorData?.soil_fertillity,
          unit: "µS/cm",
          min: sensor?.plant?.fertility_needs,
          max: sensor?.plant?.fertility_needs,
          label: "Fertilité",
          icon: Icons.compost,
          color: Colors.brown,
        ),*/
        ExpandedItem(
            popupTitle: "Température :",
            rate: sensor?.sensorData?.temperature,
            unit: "°C",
            min: sensor?.plant?.temperature_needs.min,
            max: sensor?.plant?.temperature_needs.max,
            label: "Température",
            icon: Icons.thermostat,
            color: Colors.teal),
      ],
    );
  }
}
