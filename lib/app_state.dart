import 'package:flutter/material.dart';

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

  List<int> _percentages = [34, 42, 24];
  List<int> get percentages => _percentages;
  set percentages(List<int> value) {
    _percentages = value;
  }

  void addToPercentages(int value) {
    percentages.add(value);
  }

  void removeFromPercentages(int value) {
    percentages.remove(value);
  }

  void removeAtIndexFromPercentages(int index) {
    percentages.removeAt(index);
  }

  void updatePercentagesAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    percentages[index] = updateFn(_percentages[index]);
  }

  void insertAtIndexInPercentages(int index, int value) {
    percentages.insert(index, value);
  }

  int _welcomeCircleDiameter = 350;
  int get welcomeCircleDiameter => _welcomeCircleDiameter;
  set welcomeCircleDiameter(int value) {
    _welcomeCircleDiameter = value;
  }

  List<String> _chipChoices = ['Type 1', 'Type 2', 'Gestational'];
  List<String> get chipChoices => _chipChoices;
  set chipChoices(List<String> value) {
    _chipChoices = value;
  }

  void addToChipChoices(String value) {
    chipChoices.add(value);
  }

  void removeFromChipChoices(String value) {
    chipChoices.remove(value);
  }

  void removeAtIndexFromChipChoices(int index) {
    chipChoices.removeAt(index);
  }

  void updateChipChoicesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    chipChoices[index] = updateFn(_chipChoices[index]);
  }

  void insertAtIndexInChipChoices(int index, String value) {
    chipChoices.insert(index, value);
  }

  String _selectedType = '';
  String get selectedType => _selectedType;
  set selectedType(String value) {
    _selectedType = value;
  }

  String _selectedTile = '';
  String get selectedTile => _selectedTile;
  set selectedTile(String value) {
    _selectedTile = value;
  }

  bool _devicePaired = false;
  bool get devicePaired => _devicePaired;
  set devicePaired(bool value) {
    _devicePaired = value;
  }

  int _daysScale = 7;
  int get daysScale => _daysScale;
  set daysScale(int value) {
    _daysScale = value;
  }

  List<int> _chartX = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<int> get chartX => _chartX;
  set chartX(List<int> value) {
    _chartX = value;
  }

  void addToChartX(int value) {
    chartX.add(value);
  }

  void removeFromChartX(int value) {
    chartX.remove(value);
  }

  void removeAtIndexFromChartX(int index) {
    chartX.removeAt(index);
  }

  void updateChartXAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    chartX[index] = updateFn(_chartX[index]);
  }

  void insertAtIndexInChartX(int index, int value) {
    chartX.insert(index, value);
  }

  List<int> _chartY = [0, 9, 22, 66, 84, 72, 60, 74, 91, 86, 67];
  List<int> get chartY => _chartY;
  set chartY(List<int> value) {
    _chartY = value;
  }

  void addToChartY(int value) {
    chartY.add(value);
  }

  void removeFromChartY(int value) {
    chartY.remove(value);
  }

  void removeAtIndexFromChartY(int index) {
    chartY.removeAt(index);
  }

  void updateChartYAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    chartY[index] = updateFn(_chartY[index]);
  }

  void insertAtIndexInChartY(int index, int value) {
    chartY.insert(index, value);
  }

  int _avgLevel = 157;
  int get avgLevel => _avgLevel;
  set avgLevel(int value) {
    _avgLevel = value;
  }
}
