import 'package:skills/DESIGN_PATTERNS/ANTI_CORRUPTING_LAYER/phone_dto.dart';
import 'package:skills/DESIGN_PATTERNS/ANTI_CORRUPTING_LAYER/vehicle_dto.dart';

class UserDto {
  final String name;
  final List<PhoneDto> phones;
  final List<VehicleDto> vehicles;

  UserDto({
    required this.name,
    required this.phones,
    required this.vehicles,
  });
}
