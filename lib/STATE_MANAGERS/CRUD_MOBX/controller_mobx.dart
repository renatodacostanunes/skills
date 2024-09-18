import 'package:mobx/mobx.dart';
import 'package:skills/STATE_MANAGERS/model/person_model.dart';

part 'controller_mobx.g.dart';

// ignore: library_private_types_in_public_api
class ControllerMobx = _ControllerMobxBase with _$ControllerMobx;

abstract class _ControllerMobxBase with Store {
  @observable
  var listPerson = ObservableList<PersonModel>.of([]);

  @action
  void addPerson(String name) => listPerson.add(PersonModel(name: name));

  @action
  void selectedPerson(int person, bool selected) {
    listPerson = ObservableList<PersonModel>.of(listPerson);
    listPerson[person].selected = selected;
  }

  @action
  void deletePerson(int person) => listPerson.removeAt(person);

  @action
  void deleteSelected() => listPerson.removeWhere((person) => person.selected);

  @action
  void editPerson(int person, String nameEdited) {
    listPerson = ObservableList<PersonModel>.of(listPerson);
    listPerson[person].name = nameEdited;
  }
}
