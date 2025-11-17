import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _HobbiesList = prefs.getStringList('ff_HobbiesList') ?? _HobbiesList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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

  List<MainModelStruct> _MatchesList = [];
  List<MainModelStruct> get MatchesList => _MatchesList;
  set MatchesList(List<MainModelStruct> value) {
    _MatchesList = value;
  }

  void addToMatchesList(MainModelStruct value) {
    MatchesList.add(value);
  }

  void removeFromMatchesList(MainModelStruct value) {
    MatchesList.remove(value);
  }

  void removeAtIndexFromMatchesList(int index) {
    MatchesList.removeAt(index);
  }

  void updateMatchesListAtIndex(
    int index,
    MainModelStruct Function(MainModelStruct) updateFn,
  ) {
    MatchesList[index] = updateFn(_MatchesList[index]);
  }

  void insertAtIndexInMatchesList(int index, MainModelStruct value) {
    MatchesList.insert(index, value);
  }

  List<String> _HobbiesList = [];
  List<String> get HobbiesList => _HobbiesList;
  set HobbiesList(List<String> value) {
    _HobbiesList = value;
    prefs.setStringList('ff_HobbiesList', value);
  }

  void addToHobbiesList(String value) {
    HobbiesList.add(value);
    prefs.setStringList('ff_HobbiesList', _HobbiesList);
  }

  void removeFromHobbiesList(String value) {
    HobbiesList.remove(value);
    prefs.setStringList('ff_HobbiesList', _HobbiesList);
  }

  void removeAtIndexFromHobbiesList(int index) {
    HobbiesList.removeAt(index);
    prefs.setStringList('ff_HobbiesList', _HobbiesList);
  }

  void updateHobbiesListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    HobbiesList[index] = updateFn(_HobbiesList[index]);
    prefs.setStringList('ff_HobbiesList', _HobbiesList);
  }

  void insertAtIndexInHobbiesList(int index, String value) {
    HobbiesList.insert(index, value);
    prefs.setStringList('ff_HobbiesList', _HobbiesList);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
