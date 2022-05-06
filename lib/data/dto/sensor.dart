class CreateSensorDTO {
  final String? location;
  final String name;
  final String serial_number;
  final String plant_id;

  CreateSensorDTO(
      {this.location,
      required this.name,
      required this.serial_number,
      required this.plant_id});
}
