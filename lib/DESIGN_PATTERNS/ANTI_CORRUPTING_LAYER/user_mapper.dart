import 'package:skills/DESIGN_PATTERNS/ANTI_CORRUPTING_LAYER/mapper.dart';
import 'package:skills/DESIGN_PATTERNS/ANTI_CORRUPTING_LAYER/phone_mapper.dart';
import 'package:skills/DESIGN_PATTERNS/ANTI_CORRUPTING_LAYER/user_dto.dart';
import 'package:skills/DESIGN_PATTERNS/ANTI_CORRUPTING_LAYER/vehicle_mapper.dart';

class UserMapper implements Mapper<UserDto> {
  @override
  Map<String, dynamic> toJson(UserDto userDto) => {
        "nome": userDto.name,
        "telefones": userDto.phones,
        "veiculos": userDto.vehicles,
      };

  @override
  UserDto fromJson(Map<String, dynamic> json) => UserDto(
        name: json["nome"],
        phones: PhoneMapper().toList(json["telefones"]),
        vehicles: VehicleMapper().toList(json["veiculos"]),
      );
}

// Objetivo Principal:
// O padrão Anti-Corruption Layer funciona como uma camada intermediária que "traduza" ou "converte" dados e comportamentos entre o sistema principal (o domínio da aplicação) e sistemas externos. O objetivo é garantir que as mudanças ou a complexidade do sistema externo não "poluam" o domínio principal.

// Quando usar a ACL:
// Esse padrão é útil quando sua aplicação precisa interagir com:
// 
// Sistemas legados: Sistemas antigos com lógica de negócio complexa ou não documentada.
// APIs de terceiros: APIs que podem mudar frequentemente, ter nomes de campos ou estruturas não adequados ao seu domínio.
// Sistemas com diferentes modelagens: Se você está integrando com outro sistema que segue uma modelagem de dados muito diferente da sua.
// Exemplo do Fluxo com ACL:
// Sistemas Externos: APIs ou sistemas legados que têm formatos de dados complexos ou desorganizados.
// Anti-Corruption Layer: A ACL atua como uma camada de tradução. Ela transforma os dados vindos do sistema externo para que sigam o modelo de domínio da aplicação.
// Domínio Principal: O domínio da aplicação permanece consistente, limpo e sem depender diretamente dos sistemas externos, mesmo que esses sistemas mudem.
// Benefícios de Usar uma ACL:
// Isolamento: O domínio principal fica protegido da complexidade e das mudanças dos sistemas externos.
// Flexibilidade: Se o sistema externo mudar (como campos de uma API), somente a ACL precisará ser ajustada, sem afetar o restante da aplicação.
// Coerência no Domínio: Garante que o domínio da aplicação não seja corrompido por dados ou conceitos que não fazem parte do modelo de negócio.