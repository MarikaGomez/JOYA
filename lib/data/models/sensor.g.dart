// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sensor _$SensorFromJson(Map<String, dynamic> json) => Sensor(
      id: json['id'] as String,
      name: json['name'] as String?,
      plant: json['plant'] == null
          ? null
          : Plant.fromJson(json['plant'] as Map<String, dynamic>),
      location: json['location'] as String?,
      serial_number: json['serial_number'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      sensorData: json['sensorData'] == null
          ? null
          : SensorData.fromJson(json['sensorData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SensorToJson(Sensor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'plant': instance.plant,
      'location': instance.location,
      'serial_number': instance.serial_number,
      'user': instance.user,
      'sensorData': instance.sensorData,
    };
