import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/contact.dart';
import '../models/pet.dart';

class NavigationProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners(); // 🟢 Notifies widgets listening to this provider
  }
}
