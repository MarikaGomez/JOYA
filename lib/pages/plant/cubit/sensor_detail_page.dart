import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joya/data/repositories/joya/sensor.dart';
import 'package:joya/data/repositories/wiki/wiki-plant.dart';
import 'package:joya/pages/plant/cubit/sensor_detail_cubit.dart';
import '../../../data/services/api/joya/sensor.dart';
import '../../../data/services/api/wikipedia/wiki-plant.dart';
import '../sensor_detail_view.dart';

class SensorPage extends StatelessWidget {
  static String pageName = "Sensor";
  final String sensorId;
  const SensorPage({Key? key, required this.sensorId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SensorRepository>(
          create: (context) => SensorRepository(sensorService: SensorService()),
        ),
        RepositoryProvider<WikiPlantRepository>(
            create: (context) => WikiPlantRepository(
                serviceWikipediaPlant: ServiceWikipediaPlant()))
      ],
      child: BlocProvider(
        create: (context) => SensorCubit(
          sensorRepository: context.read<SensorRepository>(),
          wikiPlantRepository: context.read<WikiPlantRepository>(),
        ),
        child: SensorView(
          sensorId: sensorId,
        ),
      ),
    );
  }
}
