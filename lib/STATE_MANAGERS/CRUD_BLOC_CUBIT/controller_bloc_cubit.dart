import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills/STATE_MANAGERS/CRUD_BLOC_CUBIT/person_states.dart';
import 'package:skills/STATE_MANAGERS/model/person_model.dart';

class ControllerBlocCubit extends Cubit<PersonStates> {
  ControllerBlocCubit() : super(PersonInitialState());

  var listPerson = [];

  void addPerson(String name) {
    listPerson.add(PersonModel(name: name));
    emit(PersonLoaded());
  }

  void selectedPerson(int person, bool selected) {
    listPerson[person].selected = selected;
    emit(PersonLoaded());
  }

  void deletePerson(int person) {
    listPerson.removeAt(person);
    listPerson.isEmpty ? emit(PersonInitialState()) : emit(PersonLoaded());
  }

  void deleteSelected() {
    listPerson.removeWhere((person) => person.selected);
    listPerson.isEmpty ? emit(PersonInitialState()) : emit(PersonLoaded());
  }

  void editPerson(int person, String nameEdited) {
    listPerson[person].name = nameEdited;
    emit(PersonLoaded());
  }
}
