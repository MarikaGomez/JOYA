import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joya/common/utils/snackbar.dart';
import 'cubit/sensor_detail_cubit.dart';

class SensorView extends StatefulWidget {
  final String sensorId;

  const SensorView({Key? key, required this.sensorId}) : super(key: key);

  @override
  _SensorState createState() => _SensorState();
}

class _SensorState extends State<SensorView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    context.read<SensorCubit>().fetchSensor(widget.sensorId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateUI(SensorState state) {
    debugPrint(state.runtimeType.toString());
    if (state is SensorSuccess) {
    } else if (state is SensorLoaded) {
      //print("${state.Sensor.toList()} Sensor");
    } else if (state is SensorError) {
      showWarningSnackbar(context, state.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: BlocConsumer<SensorCubit, SensorState>(
        listener: (context, state) {
          updateUI(state);
        },
        builder: (context, state) {
          const Key centerKey = ValueKey<String>('Sensor');
          return state is SensorLoaded
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(35, 162, 92, 1),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1453904300235-0f2f60b15b5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1286&q=80"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(
                            state.sensor.name.capitalize(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Text(
                          "[Localisation]",
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      state.sensor.plant.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      state.description,
                      style: TextStyle(
                        fontSize: 12.0,
                        height: 1.5,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: IconButton(
                            onPressed: (() => popup(
                                "Taux de luminosité : 10000 LUX",
                                "Minimum : 500 LUX",
                                "Maximum : 30000 LUX")),
                            icon: const Icon(
                              Icons.wb_sunny_outlined,
                              color: Colors.amber,
                              size: 30.0,
                              semanticLabel: 'Luminosité',
                            ),
                            tooltip: "Luminosité",
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: IconButton(
                            onPressed: (() => popup(
                                "Taux d'humidité du sol : 22 %",
                                "Minimum : 15 %",
                                "Maximum : 60 %")),
                            icon: const Icon(
                              Icons.water_drop,
                              color: Colors.blue,
                              size: 30.0,
                              semanticLabel: 'Humidité',
                            ),
                            tooltip: "Humidité",
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: IconButton(
                            onPressed: (() => popup(
                                "Fertilité du sol : 580 µS/cm",
                                "Minimum : 200 µS/cm",
                                "Maximum : 1300 µS/cm")),
                            icon: const Icon(
                              Icons.compost,
                              color: Colors.brown,
                              size: 30.0,
                              semanticLabel: 'Fertilité',
                            ),
                            tooltip: "Fertilité",
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: IconButton(
                            onPressed: (() => popup(
                                "Température : 21.5 °C",
                                "Minimum : 10.0 °C",
                                "Maximum : 32.0°C")),
                            icon: const Icon(
                              Icons.thermostat,
                              color: Colors.teal,
                              size: 30.0,
                              semanticLabel: 'Température',
                            ),
                            tooltip: "Température",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
              : Container();
        },
      ),
    );
  }

  Future<Null> popup(rate, min, max) async {
    double height = MediaQuery.of(context).size.width * 0.75;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            contentPadding: EdgeInsets.all(20.0),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(rate),
                  SizedBox(height: 4.0),
                  Text(min),
                  SizedBox(height: 4.0),
                  Text(max),
                ],
              ),
            ],
          );
        });
  }
}

extension CapitalizeData on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
