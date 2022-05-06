// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor-data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SensorData _$SensorDataFromJson(Map<String, dynamic> json) => SensorData(
      id: json['id'] as String,
      serial_number: json['serial_number'] as String,
      luminosity: json['luminosity'] as int,
      temperature: json['temperature'] as int,
      humidity: json['humidity'] as int,
      soil_fertillity: json['soil_fertillity'] as int,
    );

Map<String, dynamic> _$SensorDataToJson(SensorData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serial_number': instance.serial_number,
      'luminosity': instance.luminosity,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'soil_fertillity': instance.soil_fertillity,
    };
