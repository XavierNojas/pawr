import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';
import '../pages/notifs/notifs_widget.dart';
import '../view_models/contact_view_model.dart';
import '../view_models/pet_view_model.dart';
import '../routes/app_router.dart'; // Assume you have a simple routing setup
import '../views/home/home_widget.dart';
import '../views/pet_manage/pet_manage_widget.dart';

import '../view_models/navigation_view_model.dart';

class ScreenNavigator extends StatelessWidget {
  final List<Widget> _pages = [
    const HomeWidget(),
    const NotifsWidget(),
    const PetManageWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: _pages[navProvider.selectedIndex], // 🟢 show page based on index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navProvider.selectedIndex,
        onTap: (index) {
          navProvider.updateIndex(index); // 🟢 update index in provider
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Reminders'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Pets'),
        ],
      ),
    );
  }
}
