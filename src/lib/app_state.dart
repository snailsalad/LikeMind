import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _MajorList = [];
  List<String> get MajorList => _MajorList;
  set MajorList(List<String> value) {
    _MajorList = value;
  }

  void addToMajorList(String value) {
    MajorList.add(value);
  }

  void removeFromMajorList(String value) {
    MajorList.remove(value);
  }

  void removeAtIndexFromMajorList(int index) {
    MajorList.removeAt(index);
  }

  void updateMajorListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    MajorList[index] = updateFn(_MajorList[index]);
  }

  void insertAtIndexInMajorList(int index, String value) {
    MajorList.insert(index, value);
  }

  List<String> _HobbiesList = [];
  List<String> get HobbiesList => _HobbiesList;
  set HobbiesList(List<String> value) {
    _HobbiesList = value;
  }

  void addToHobbiesList(String value) {
    HobbiesList.add(value);
  }

  void removeFromHobbiesList(String value) {
    HobbiesList.remove(value);
  }

  void removeAtIndexFromHobbiesList(int index) {
    HobbiesList.removeAt(index);
  }

  void updateHobbiesListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    HobbiesList[index] = updateFn(_HobbiesList[index]);
  }

  void insertAtIndexInHobbiesList(int index, String value) {
    HobbiesList.insert(index, value);
  }

  List<DocumentReference> _matchesListRefs = [];
  List<DocumentReference> get matchesListRefs => _matchesListRefs;
  set matchesListRefs(List<DocumentReference> value) {
    _matchesListRefs = value;
  }

  void addToMatchesListRefs(DocumentReference value) {
    matchesListRefs.add(value);
  }

  void removeFromMatchesListRefs(DocumentReference value) {
    matchesListRefs.remove(value);
  }

  void removeAtIndexFromMatchesListRefs(int index) {
    matchesListRefs.removeAt(index);
  }

  void updateMatchesListRefsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    matchesListRefs[index] = updateFn(_matchesListRefs[index]);
  }

  void insertAtIndexInMatchesListRefs(int index, DocumentReference value) {
    matchesListRefs.insert(index, value);
  }

  List<DocumentReference> _emptyList = [];
  List<DocumentReference> get emptyList => _emptyList;
  set emptyList(List<DocumentReference> value) {
    _emptyList = value;
  }

  void addToEmptyList(DocumentReference value) {
    emptyList.add(value);
  }

  void removeFromEmptyList(DocumentReference value) {
    emptyList.remove(value);
  }

  void removeAtIndexFromEmptyList(int index) {
    emptyList.removeAt(index);
  }

  void updateEmptyListAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    emptyList[index] = updateFn(_emptyList[index]);
  }

  void insertAtIndexInEmptyList(int index, DocumentReference value) {
    emptyList.insert(index, value);
  }

  List<DocumentReference> _temp = [];
  List<DocumentReference> get temp => _temp;
  set temp(List<DocumentReference> value) {
    _temp = value;
  }

  void addToTemp(DocumentReference value) {
    temp.add(value);
  }

  void removeFromTemp(DocumentReference value) {
    temp.remove(value);
  }

  void removeAtIndexFromTemp(int index) {
    temp.removeAt(index);
  }

  void updateTempAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    temp[index] = updateFn(_temp[index]);
  }

  void insertAtIndexInTemp(int index, DocumentReference value) {
    temp.insert(index, value);
  }
}
