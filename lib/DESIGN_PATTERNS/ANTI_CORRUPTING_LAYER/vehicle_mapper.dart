import 'package:skills/DESIGN_PATTERNS/ANTI_CORRUPTING_LAYER/mapper.dart';
import 'package:skills/DESIGN_PATTERNS/ANTI_CORRUPTING_LAYER/vehicle_dto.dart';

final class VehicleMapper extends ListMapper<VehicleDto> {
  @override
  Map<String, dynamic> toJson(VehicleDto vehicleDto) => {
        "modelo": vehicleDto.model,
        "cor": vehicleDto.color,
      };

  @override
  VehicleDto fromJson(Map<String, dynamic> json) => VehicleDto(
        model: json["modelo"],
        color: json["cor"],
      );
}
