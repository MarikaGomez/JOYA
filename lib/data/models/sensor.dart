import 'package:joya/data/models/sensor-data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:joya/data/models/plant.dart';
import 'package:joya/data/models/user.dart';
part 'sensor.g.dart';

@JsonSerializable()
class Sensor {
  String id;
  String name;
  Plant plant;
  String? location;
  String serial_number;
  User user;
  SensorData? sensorData;

  Sensor({
    required this.id,
    required this.name,
    required this.plant,
    this.location,
    required this.serial_number,
    required this.user,
    this.sensorData,
  });

  factory Sensor.fromJson(Map<String, dynamic> json) => _$SensorFromJson(json);

  Map<String, dynamic> toJson() => _$SensorToJson(this);
}
