import 'package:skills/STATE_MANAGERS/model/person_model.dart';

class ControllerSetState {
  var listPerson = [];

  void addPerson(String name) => listPerson.add(PersonModel(name: name));

  void selectedPerson(int person, bool selected) => listPerson[person].selected = selected;

  void deletePerson(int person) => listPerson.removeAt(person);

  void deleteSelected() => listPerson.removeWhere((person) => person.selected);

  void editPerson(int person, String nameEdited) => listPerson[person].name = nameEdited;
}
