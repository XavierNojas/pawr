import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';
import '../view_models/contact_view_model.dart';
import '../view_models/pet_view_model.dart';
import '../routes/app_router.dart'; // Assume you have a simple routing setup

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase with your project credentials
  await Supabase.initialize(
    url: 'https://dpzxjidnvkgircqyziyh.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRwenhqaWRudmtnaXJjcXl6aXloIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA2MTYzNDIsImV4cCI6MjA1NjE5MjM0Mn0.qhESFoAhR_63BLV-3wd323euntzzjrY0o79kK8gV1Es',
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContactViewModel()),
        ChangeNotifierProvider(create: (_) => PetViewModel()),
        // You can add additional providers (e.g., for auth) here
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pawr',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      // A simple router can decide whether to show an authentication screen or the phonebook
      home: const AppRouter(),
      debugShowCheckedModeBanner: false,
    );
  }
}
