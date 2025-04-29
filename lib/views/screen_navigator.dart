import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';
import '../pages/notifs/notifs_widget.dart';
import '../view_models/contact_view_model.dart';
import '../view_models/pet_view_model.dart';
import '../routes/app_router.dart'; // Assume you have a simple routing setup
import '../views/home/home_widget.dart';
import '../views/pet_manage/pet_manage_widget.dart';
import '../views/transactions_tab.dart';
import '../view_models/navigation_view_model.dart';

class ScreenNavigator extends StatelessWidget {
  final List<Widget> _pages = [
    const HomeWidget(),
    const NotifsWidget(),
    const PetManageWidget(),
    TransactionsNavigator(),
  ];

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: _pages[navProvider.selectedIndex], // Show page based on index
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // Optional: Set a background color
        selectedItemColor:
            const Color(0xFF009C8B), // Set selected item color to #009C8B
        unselectedItemColor: const Color(
            0xFF5F5F5F), // Keep unselected item color as greyected item color to green
        currentIndex: navProvider.selectedIndex,
        onTap: (index) {
          navProvider.updateIndex(index); // Update index in provider
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Reminders'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Pets'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat), label: 'Care Requests'),
        ],
      ),
    );
  }
}
