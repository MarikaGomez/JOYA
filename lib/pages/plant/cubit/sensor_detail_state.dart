part of 'sensor_detail_cubit.dart';

@immutable
abstract class SensorState extends Equatable {}

class SensorInitial extends SensorState {
  @override
  List<Object?> get props => [];
}

class SensorSearchState extends SensorState {
  SensorSearchState();

  @override
  List<Object?> get props => [];
}

class SensorLoaded extends SensorState {
  final Sensor sensor;
  final String description;
  SensorLoaded({required this.sensor, required this.description});

  @override
  List<Sensor> get props => [sensor];
}

class SensorSuccess extends SensorState {
  SensorSuccess();

  @override
  List<Object?> get props => [];
}

class SensorError extends SensorState {
  final String message;
  SensorError({required this.message});
  @override
  List<String> get props => [message];
}
