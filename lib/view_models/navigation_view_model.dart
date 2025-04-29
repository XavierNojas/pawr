import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int _selectedIndex = 0;
  int _topTabIndex = 0; // 🔹 Track top tab selection

  int get selectedIndex => _selectedIndex;
  int get topTabIndex => _topTabIndex;

  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners(); // 🟢 Notifies widgets listening to this provider
  }

  void updateTopTabIndex(int newTabIndex) {
    _topTabIndex = newTabIndex;
    notifyListeners();
  }
}
