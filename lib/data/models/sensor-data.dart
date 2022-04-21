import 'package:json_annotation/json_annotation.dart';
part 'sensor-data.g.dart';

@JsonSerializable()
class SensorData {
  String id;
  String name;
  String serial_number;
  int luminosity;
  int temperature;
  int humidity;
  int fertility;

  SensorData(
      {required this.id,
      required this.name,
      required this.serial_number,
      required this.luminosity,
      required this.temperature,
      required this.humidity,
      required this.fertility});

  factory SensorData.fromJson(Map<String, dynamic> json) =>
      _$SensorDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$SensorDataModelToJson(this);
}
