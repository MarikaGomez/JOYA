import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joya/common/utils/snackbar.dart';
import 'package:joya/pages/plant_alerts/cubit/plant_alerts_cubit.dart';

class SensorAlertsView extends StatefulWidget {
  final String sensorId;
  final String serialNumber;

  const SensorAlertsView(
      {Key? key, required this.sensorId, required this.serialNumber})
      : super(key: key);

  @override
  _SensorAlertsState createState() => _SensorAlertsState();
}

class _SensorAlertsState extends State<SensorAlertsView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    context
        .read<SensorAlertsCubit>()
        .loadPageData(widget.serialNumber, widget.sensorId);
    super.initState();
  }

  void updateUI(SensorAlertsState state) {
    debugPrint("${state.runtimeType.toString()} sensor state");
    if(state is SensorAlertsLoaded){
      context.read<SensorAlertsCubit>().setSensor(state.sensor);
      context.read<SensorAlertsCubit>().setHumidityAlert(state.sensor.humidity_alert);
      context.read<SensorAlertsCubit>().setHumidityBoolAlert(state.sensor.humidity_alert_enabled);

      context.read<SensorAlertsCubit>().setTemperatureAlert(state.sensor.temperature_alert);
      context.read<SensorAlertsCubit>().setTemperatureBoolAlert(state.sensor.temperature_alert_enabled);

      context.read<SensorAlertsCubit>().setLuminosityAlert(state.sensor.luminosity_alert);
      context.read<SensorAlertsCubit>().setLuminosityBoolAlert(state.sensor.luminosity_alert_enabled);
    }else if (state is SensorAlertsError) {
      showWarningSnackbar(context, state.message);
      Navigator.pop(context);
    }
    else if (state is SensorAlertsSuccess) {
      showSuccessSnackbar(context, "Capteur ${state.sensor.serial_number} mis à jour");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: BlocConsumer<SensorAlertsCubit, SensorAlertsState>(
        listener: (context, state) {
          updateUI(state);
        },
        builder: (context, state) {
          const Key centerKey = ValueKey<String>('Sensor');

          return  (state is SensorAlertsLoaded || state is SensorAlertsSuccess)
              ?  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height / 25),
                Center(child: Text("Humidité Alerte")),
                CupertinoSwitch(
                  value: context.read<SensorAlertsCubit>().humidity_alert_enabled,
                  onChanged: (value) {
                    setState(() {
                      context.read<SensorAlertsCubit>().setHumidityBoolAlert(value);
                    });
                  },
                ),
                Container(
                  width: double.maxFinite,
                  child: Slider(
                    min: 0.0,
                    max: context.read<SensorAlertsCubit>().humidity_alert_enabled ? 100.0 : 0.0,
                    label : "${context.read<SensorAlertsCubit>().humidity_alert.toInt()}",
                    value:context.read<SensorAlertsCubit>().humidity_alert_enabled ? context.read<SensorAlertsCubit>().humidity_alert + .0 :0.0,
                    onChanged: (value) {
                      setState(() {
                        context.read<SensorAlertsCubit>().setHumidityAlert(value.toInt());
                      });
                    },
                  ),
                ),
                Center(child: Text("${context.read<SensorAlertsCubit>().humidity_alert.toInt()}"),),


                SizedBox(
                    height: MediaQuery.of(context).size.height / 25),
                Center(child: Text("Temperature Alerte")),
                CupertinoSwitch(
                  value: context.read<SensorAlertsCubit>().temperature_alert_enabled,
                  onChanged: (value) {
                    setState(() {
                      context.read<SensorAlertsCubit>().setTemperatureBoolAlert(value);
                    });
                  },
                ),
                Container(
                  width: double.maxFinite,
                  child: Slider(
                    min: 0.0,
                    max: context.read<SensorAlertsCubit>().temperature_alert_enabled ? 100.0 : 0.0 ,
                    label : "${context.read<SensorAlertsCubit>().temperature_alert.toInt()}",
                    value: context.read<SensorAlertsCubit>().temperature_alert_enabled  ? context.read<SensorAlertsCubit>().temperature_alert + .0 : 0.0,
                    onChanged: (value) {
                      setState(() {
                        context.read<SensorAlertsCubit>().setTemperatureAlert(value.toInt());
                      });
                    },
                  ),
                ),
             Center(child: Text("${context.read<SensorAlertsCubit>().temperature_alert.toInt()}"),),


                SizedBox(
                    height: MediaQuery.of(context).size.height / 25),
                Center(child: Text("Temperature Alerte")),
                CupertinoSwitch(
                  value: context.read<SensorAlertsCubit>().luminosity_alert_enabled,
                  onChanged: (value) {
                    setState(() {
                      context.read<SensorAlertsCubit>().setLuminosityBoolAlert(value);
                    });
                  },
                ),
                Container(
                  width: double.maxFinite,
                  child: Slider(
                    min: 0.0,
                    max: context.read<SensorAlertsCubit>().luminosity_alert_enabled ? 100.0 : 0.0 ,
                    label : "${context.read<SensorAlertsCubit>().luminosity_alert.toInt()}",
                    value: context.read<SensorAlertsCubit>().luminosity_alert_enabled  ? context.read<SensorAlertsCubit>().luminosity_alert + .0 : 0.0,
                    onChanged: (value) {
                      setState(() {
                        context.read<SensorAlertsCubit>().setLuminosityAlert(value.toInt());
                      });
                    },
                  ),
                ),
                Center(child: Text("${context.read<SensorAlertsCubit>().luminosity_alert.toInt()}"),),


                SizedBox(
                    height: MediaQuery.of(context).size.height / 25),
                FloatingActionButton(
                  onPressed: () {
                  context.read<SensorAlertsCubit>().submit();
                  },
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.add_task),
                ),

              ],
            )
          ): Container();
        },
      ),
    );
  }
}


