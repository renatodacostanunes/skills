import 'package:flutter/material.dart';
import 'package:skills/STATE_MANAGERS/model/person_model.dart';

class ControllerProvider with ChangeNotifier {
  var listPerson = [];

  void addPerson(String name) {
    listPerson.add(PersonModel(name: name));
    notifyListeners();
  }

  void selectedPerson(int person, bool selected) {
    listPerson[person].selected = selected;
    notifyListeners();
  }

  void deletePerson(int person) {
    listPerson.removeAt(person);
    notifyListeners();
  }

  void deleteSelected() {
    listPerson.removeWhere((person) => person.selected);
    notifyListeners();
  }

  void editPerson(int person, String nameEdited) {
    listPerson[person].name = nameEdited;
    notifyListeners();
  }
}
