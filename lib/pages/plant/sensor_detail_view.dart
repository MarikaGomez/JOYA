import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joya/common/utils/snackbar.dart';
import 'package:joya/pages/plant/widgets/chart_component.dart';
import 'package:joya/pages/plant/widgets/data_detail.dart';
import 'package:joya/pages/plant/widgets/image_detail.dart';
import 'cubit/sensor_detail_cubit.dart';

class SensorView extends StatefulWidget {
  final String sensorId;
  final String serialNumber;

  const SensorView(
      {Key? key, required this.sensorId, required this.serialNumber})
      : super(key: key);

  @override
  _SensorState createState() => _SensorState();
}

class _SensorState extends State<SensorView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    context
        .read<SensorCubit>()
        .loadPageData(widget.serialNumber, widget.sensorId);
    context.read<SensorCubit>().connectAndListen(widget.serialNumber);
    super.initState();
  }

  void updateUI(SensorState state) {
    //debugPrint("${state.runtimeType.toString()} sensor socket");
    if (state is SensorSuccess) {
    } else if (state is SensorLoaded) {
      context.read<SensorCubit>().setSensor(state.sensor);
      context.read<SensorCubit>().setSensorsData(state.sensorData);
      context.read<SensorCubit>().setDescription(state.description);
    } else if (state is SensorError) {
      showWarningSnackbar(context, state.message);
      Navigator.pop(context);
    } else if (state is SensorLoaded) {
      context.read<SensorCubit>().setSensorsData(state.sensorData);
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
          var sensor = context.read<SensorCubit>().sensor;

          return (state is SensorLoaded || state is SensorSocketLoading) &&
                  sensor != null
              ? new WillPopScope(
                  onWillPop: () async {
                    context.read<SensorCubit>().disposeSocket();
                    context.read<SensorCubit>().setIsDisposed(true);
                    return true;
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ImageDetailView(),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        DataDetailDisplay(),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Container(
                            height: 600,
                            width: 700,
                            child: ChartComponent(
                              sensorsData:
                                  context.read<SensorCubit>().sensorsData,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  child: Scaffold(
                    backgroundColor: Color.fromRGBO(245, 234, 216, 1),
                    body: Center(
                      child: Image.asset(
                        'assets/images/loading.gif',
                        scale: 0.8,
                        colorBlendMode: BlendMode.darken,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
