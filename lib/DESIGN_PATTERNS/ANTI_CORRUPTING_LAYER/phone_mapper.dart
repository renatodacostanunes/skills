import 'package:skills/DESIGN_PATTERNS/ANTI_CORRUPTING_LAYER/mapper.dart';
import 'package:skills/DESIGN_PATTERNS/ANTI_CORRUPTING_LAYER/phone_dto.dart';

final class PhoneMapper extends ListMapper<PhoneDto> {
  @override
  Map<String, dynamic> toJson(PhoneDto phoneDto) => {
        "ddd": phoneDto.ddd,
        "telefone": phoneDto.phoneNumber,
      };

  @override
  PhoneDto fromJson(Map<String, dynamic> json) => PhoneDto(
        ddd: json["ddd"],
        phoneNumber: json["telefone"],
      );
}
