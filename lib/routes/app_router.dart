import 'package:flutter/material.dart';
import '../views/auth_screen.dart';
import '../views/contact_list_screen.dart';
import '../views/add_pet_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../views/pet_list_screen.dart';
import '../views/sign_in/sign_in_widget.dart';
import '../views/sign_up/sign_up_widget.dart';
import '../views/home/home_widget.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phonebook App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthChecker(),
        '/signIn': (context) => const SignInWidget(),
        '/signUp' : (context) => const SignUpWidget(),
        '/home' : (context) => const HomeWidget(),
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
      return const HomeWidget();
    } else {
      return const SignInWidget();
    }
  }
}
