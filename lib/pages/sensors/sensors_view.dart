import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joya/common/utils/snackbar.dart';
import '../../component/TextFieldComponent.dart';
import '../../styles/MainColorPalettes.dart';
import '../../styles/MainTextPalettes.dart';
import 'cubit/sensors_cubit.dart';

class SensorsView extends StatefulWidget {
  const SensorsView({
    Key? key,
  }) : super(key: key);

  @override
  _SensorsState createState() => _SensorsState();
}

class _SensorsState extends State<SensorsView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    context.read<SensorsCubit>().fetchSensors();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateUI(SensorsState state) {
    debugPrint(state.runtimeType.toString());
    if (state is SensorsSuccess) {
    } else if (state is SensorsLoaded) {
      print("${state.sensors.toList()} sensors");
      context.read<SensorsCubit>().setSensors(state.sensors);
    } else if (state is SensorsError) {
      showWarningSnackbar(context, state.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: BlocConsumer<SensorsCubit, SensorsState>(
        listener: (context, state) {
          updateUI(state);
        },
        builder: (context, state) {
          const Key centerKey = ValueKey<String>('sensors');

          return state is SensorsInitial
              ? const CircularProgressIndicator(
                  strokeWidth: 1.5,
                )
              : Column(
                  children: <Widget>[
                    SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: MediaQuery.of(context).size.height / 25),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${MainTextPalettes.textFr["MY_PLANT"]}',
                              style: TextStyle(
                                  color: MainColorPalettes.colorsThemeMultiple[10],
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'DMSans-Bold.ttf'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            child: TextFieldComponent(
                              methode: (data) async {
                                context
                                    .read<SensorsCubit>()
                                    .setSearchField(data);
                              },
                              text: "${MainTextPalettes.textFr["SEARCH"]}",
                              isNotValidRenderText: "",
                              hiddenText: false,
                              isValid: true,
                            ),
                          ),
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount:
                                context.read<SensorsCubit>().sensors.length,
                            itemBuilder: (context, index) {
                              var sensor =
                                  context.read<SensorsCubit>().sensors[index];
                              return Row(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      onTap: () {
                                        context
                                            .read<SensorsCubit>()
                                            .navigateToDetailPage(
                                                context, sensor.id);
                                      },
                                      title: Text(
                                          "${sensor.serial_number.toString()} - ${sensor.name.toString()} "),
                                    ),
                                  ),
                                  Expanded(
                                      child: CircleAvatar(
                                    backgroundColor: context
                                            .read<SensorsCubit>()
                                            .isInDanger(sensor)
                                        ? Colors.red
                                        : context
                                                .read<SensorsCubit>()
                                                .isInWarnning(sensor)
                                            ? Colors.orange
                                            : Colors.green,
                                  ))
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
