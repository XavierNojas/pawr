import 'package:flutter/material.dart';
import 'package:paw_r_app/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/pet.dart';
import '../models/food.dart';

import '../models/foodLog.dart';
import '../models/request.dart';
import '../models/user.dart';

import 'package:intl/intl.dart';

class RemindersViewModel extends ChangeNotifier {
   Future<void> _fetchReminders(BuildContext context) async {

    try {
      final user = Supabase.instance.client.auth.currentUser;
      if (user == null) {
        throw Exception('User not logged in');
      }

      final response = await Supabase.instance.client
          .from('reminders')
          .select('*')
          .eq('user_id', user.id)
          .order('time', ascending: true);

    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching reminders: $error')),
      );
    } 
  }
}
