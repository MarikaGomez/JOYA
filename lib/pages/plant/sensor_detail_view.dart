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
                  children: <Widget>[
                    SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(20)),
                          Center(child: Text(state.sensor.plant.name)),
                          Center(
                              child: Text(
                                  "${state.sensor.serial_number} ${state.sensor.name}"))
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
}
