import 'package:flutter/material.dart';
import 'package:paw_r_app/views/pet_manage_b/pet_manage_b_widget.dart';
import 'package:paw_r_app/views/user_earnings/user_earnings_widget.dart';
import 'package:paw_r_app/views/user_group_manage/user_group_manage_widget.dart';
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
    // const UserEarningsWidget(userId: 'fe09a1b3-8d65-4a0d-bd67-b695eb4ee165'),
    const HomeWidget(),
    const NotifsWidget(),
    const PetManageBWidget(isFromProfile: false),
    const UserGroupManageWidget(),
    TransactionsNavigator(),
  ];

  ScreenNavigator({super.key});

@override
Widget build(BuildContext context) {
  final navProvider = Provider.of<NavigationProvider>(context);

  return Scaffold(
    body: IndexedStack(
      index: navProvider.selectedIndex,
      children: _pages,
    ),
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF009C8B),
      unselectedItemColor: const Color(0xFF5F5F5F),
      currentIndex: navProvider.selectedIndex,
      onTap: (index) => navProvider.updateIndex(index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Reminders'),
        BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Pets'),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Group'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Care Requests'),
      ],
    ),
  );
}
}
