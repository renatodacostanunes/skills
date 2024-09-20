abstract interface class Mapper<Dto> {
  Map<String, dynamic> toJson(Dto dto);
  Dto fromJson(Map<String, dynamic> json);
}

abstract base class ListMapper<Dto> implements Mapper<Dto> {
  List<Map<String, dynamic>> toJsonList(List<Dto> dtos) => dtos.map(toJson).toList();
  List<Dto> toList(List<Map<String, dynamic>> jsonList) => jsonList.map(fromJson).toList();
}

// A classe Mapper força todas classes que a implementarem a sobrescrever os métodos toJson e fromJson

// A classe ListMapper por ser "base" não pode ser implementada, somente herdada, ou seja, todas as classes que
// herdarem ListMapper, vão poder utilizar os métodos toJsonList e toList

// Resumo, minha classe UserMapper tem acesso somente aos métodos toJson e fromJson
// As classes PhoneMapper e VehicleMapper por herdarem ListMapper, tem acesso a todos os métodos