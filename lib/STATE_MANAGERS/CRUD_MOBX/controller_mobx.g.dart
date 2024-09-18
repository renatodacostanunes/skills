// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerMobx on _ControllerMobxBase, Store {
  late final _$listPersonAtom =
      Atom(name: '_ControllerMobxBase.listPerson', context: context);

  @override
  ObservableList<PersonModel> get listPerson {
    _$listPersonAtom.reportRead();
    return super.listPerson;
  }

  @override
  set listPerson(ObservableList<PersonModel> value) {
    _$listPersonAtom.reportWrite(value, super.listPerson, () {
      super.listPerson = value;
    });
  }

  late final _$_ControllerMobxBaseActionController =
      ActionController(name: '_ControllerMobxBase', context: context);

  @override
  void addPerson(String name) {
    final _$actionInfo = _$_ControllerMobxBaseActionController.startAction(
        name: '_ControllerMobxBase.addPerson');
    try {
      return super.addPerson(name);
    } finally {
      _$_ControllerMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectedPerson(int person, bool selected) {
    final _$actionInfo = _$_ControllerMobxBaseActionController.startAction(
        name: '_ControllerMobxBase.selectedPerson');
    try {
      return super.selectedPerson(person, selected);
    } finally {
      _$_ControllerMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deletePerson(int person) {
    final _$actionInfo = _$_ControllerMobxBaseActionController.startAction(
        name: '_ControllerMobxBase.deletePerson');
    try {
      return super.deletePerson(person);
    } finally {
      _$_ControllerMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteSelected() {
    final _$actionInfo = _$_ControllerMobxBaseActionController.startAction(
        name: '_ControllerMobxBase.deleteSelected');
    try {
      return super.deleteSelected();
    } finally {
      _$_ControllerMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editPerson(int person, String nameEdited) {
    final _$actionInfo = _$_ControllerMobxBaseActionController.startAction(
        name: '_ControllerMobxBase.editPerson');
    try {
      return super.editPerson(person, nameEdited);
    } finally {
      _$_ControllerMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listPerson: ${listPerson}
    ''';
  }
}
