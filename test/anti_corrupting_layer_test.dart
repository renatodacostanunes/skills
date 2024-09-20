import 'package:flutter_test/flutter_test.dart';
import 'package:skills/DESIGN_PATTERNS/ANTI_CORRUPTING_LAYER/phone_dto.dart';
import 'package:skills/DESIGN_PATTERNS/ANTI_CORRUPTING_LAYER/user_dto.dart';
import 'package:skills/DESIGN_PATTERNS/ANTI_CORRUPTING_LAYER/user_mapper.dart';
import 'package:skills/DESIGN_PATTERNS/ANTI_CORRUPTING_LAYER/vehicle_dto.dart';

void main() {
  group("TESTS OF USER_MAPPER | ", () {
    test("Should convert UserDto to JSON", () {
      final userDto = UserDto(
        name: "Renato",
        phones: [
          PhoneDto(ddd: "ddd", phoneNumber: "phoneNumber"),
          PhoneDto(ddd: "ddd1", phoneNumber: "phoneNumber1"),
        ],
        vehicles: [
          VehicleDto(model: "model", color: "color"),
          VehicleDto(model: "model1", color: "color1"),
        ],
      );

      final json = UserMapper().toJson(userDto);

      expect(userDto.name, json["nome"]);
      expect(userDto.phones[0], json["telefones"][0]);
      expect(userDto.phones[1], json["telefones"][1]);
      expect(userDto.vehicles[0], json["veiculos"][0]);
      expect(userDto.vehicles[1], json["veiculos"][1]);
    });

    test("Should convert JSON to UserDto", () {
      final json = <String, dynamic>{
        "nome": "Renato",
        "telefones": [
          {
            "ddd": "ddd",
            "telefone": "telefone",
          },
          {
            "ddd": "ddd1",
            "telefone": "telefone1",
          },
        ],
        "veiculos": [
          {
            "modelo": "modelo",
            "cor": "cor",
          },
          {
            "modelo": "modelo1",
            "cor": "cor1",
          },
        ],
      };

      final userDto = UserMapper().fromJson(json);

      expect(json["nome"], userDto.name);
      expect(json["telefones"][0]["ddd"], userDto.phones[0].ddd);
      expect(json["telefones"][0]["telefone"], userDto.phones[0].phoneNumber);
      expect(json["telefones"][1]["ddd"], userDto.phones[1].ddd);
      expect(json["telefones"][1]["telefone"], userDto.phones[1].phoneNumber);

      expect(json["veiculos"][0]["modelo"], userDto.vehicles[0].model);
      expect(json["veiculos"][0]["cor"], userDto.vehicles[0].color);
      expect(json["veiculos"][1]["modelo"], userDto.vehicles[1].model);
      expect(json["veiculos"][1]["cor"], userDto.vehicles[1].color);
    });
  });
}
