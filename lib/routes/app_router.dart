import 'package:flutter/material.dart';
import 'package:paw_r_app/views/pet_profile_edit/pet_edit_widget.dart';
import 'package:paw_r_app/views/view_pet_screen.dart';
import '../views/auth_screen.dart';
import '../views/contact_list_screen.dart';
import '../views/add_pet_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../views/pet_list_screen.dart';
import '../views/sign_in/sign_in_widget.dart';
import '../views/sign_up/sign_up_widget.dart';
import '../views/home/home_widget.dart';
import '../views/pet_manage/pet_manage_widget.dart';
import '../views/pet_profile/pet_profile_widget.dart';
import '../views/screen_navigator.dart';

import '../views/log_food/log_food_widget.dart';
import 'package:paw_r_app/views/log_food_add/log_food_add_widget.dart';

import '../pages/new_reminder/new_reminder_widget.dart';
import '../views/pet_transact/pet_transact_widget.dart';
import '../views/pet_home_list/pet_home_list_widget.dart';
import '../views/transactions_log/transactions_log_widget.dart';



class AppRouter extends StatelessWidget {
  const AppRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Pawr!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthChecker(),
        '/signIn': (context) => const SignInWidget(),
        '/signUp' : (context) => const SignUpWidget(),
        '/home' : (context) => const HomeWidget(),
        '/petManage' : (context) => const PetManageWidget(),
        '/homeNav' : (context) => ScreenNavigator(),
        '/petHomeList' : (context) => const PetHomeListWidget(),
        '/phonebook': (context) => const ContactListScreen(),
        '/petList': (context) => const PetListScreen(),
        '/addPet': (context) => const AddPetScreen(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(child: Text('Page not found')),
        ),
      ),
    );
  }
}

class AuthChecker extends StatelessWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;

    if (user != null) {
      return ScreenNavigator();
    } else {
      return const SignInWidget();
    }
  }
}
