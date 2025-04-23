import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'notifs_widget.dart' show NotifsWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart'; // Import for debugPrint
import 'dart:developer'; // Import for log

// Assuming NotifsModel is a simple class for data and logic
class NotifsModel {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> reminders = [];
  bool isLoading = true; // Initial state should be true while fetching

  Future<void> fetchReminders() async {
    // Only set loading to true if the list is currently empty.
    // This prevents the loading spinner from flashing on refreshes.
    if (reminders.isEmpty) {
      isLoading = true;
      // No need to notify here, setState in widget handles initial load
    }
    // No need to notify here, setState in widget handles initial load

    try {
      final user = supabase.auth.currentUser;
      if (user == null) {
        debugPrint('NotifsModel: User not logged in. Clearing reminders.');
        reminders = []; // Clear reminders if user logs out
        // Ensure isLoading is false even if not logged in
        isLoading = false;
        return; // Exit early if no user
      }

      debugPrint('NotifsModel: Fetching reminders for user: ${user.id}');

      // *** Use simple select assuming 'pname' and 'user_id' are DIRECTLY in 'reminders' table ***
      // This avoids the join error you encountered.
      final response = await supabase
          .from('reminders')
          .select('*') // Select all columns including pname and user_id
          .eq('user_id', user.id) // Filter by the current user's ID
          .order('status', ascending: true) // Completed items last
          .order('time', ascending: true); // Chronological order

      debugPrint('NotifsModel: Raw response type: ${response.runtimeType}');
      debugPrint('NotifsModel: Raw response count: ${response.length}');
      // Print a sample of the raw response data
      if (response.isNotEmpty) {
        // Use log for potentially large outputs that debugPrint might truncate
        log('NotifsModel: Sample raw response[0]: ${response.first}',
            name: 'NotifsModel');
      } else {
        debugPrint('NotifsModel: Raw response is empty.');
      }

      // Ensure the response is treated as a List<Map<String, dynamic>>
      // Cast is needed if the response type isn't exactly that
      reminders = List<Map<String, dynamic>>.from(response);

      debugPrint('NotifsModel: Processed reminders count: ${reminders.length}');
      // Print a sample of the processed reminder data
      if (reminders.isNotEmpty) {
        // Use log for potentially large outputs
        log('NotifsModel: Sample processed reminders[0]: ${reminders.first}',
            name: 'NotifsModel');
      } else {
        debugPrint('NotifsModel: Processed reminders list is empty.');
      }
    } catch (e, stackTrace) {
      // Catch error and stack trace
      debugPrint('Error fetching reminders: $e');
      // Optionally log the stack trace for detailed debugging
      // debugPrint('Stack trace: $stackTrace');
      reminders = []; // Clear on error to prevent stale data
      // Ensure isLoading is false on error
      isLoading = false;
      // TODO: Optionally, set an error message state to show in the UI
    } finally {
      // *** FIX: Ensure isLoading is set to false here ***
      isLoading = false;
      debugPrint('NotifsModel: fetchReminders finished. isLoading: $isLoading');
    }
  }

  Future<void> updateReminderStatus(String id, bool isCompleted) async {
    try {
      debugPrint(
          'NotifsModel: Updating reminder $id status to ${isCompleted ? 1 : 0}');
      await supabase
          .from('reminders')
          .update({'status': isCompleted ? 1 : 0}).eq('id', id);
      debugPrint('NotifsModel: Status updated successfully.');
    } catch (e) {
      debugPrint('Error updating reminder status: $e');
      rethrow; // Rethrow the error so the widget can catch it if needed
    }
  }

  Future<void> deleteReminder(String id) async {
    try {
      debugPrint('NotifsModel: Deleting reminder $id');
      await supabase.from('reminders').delete().eq('id', id);
      debugPrint('NotifsModel: Reminder deleted successfully.');
    } catch (e) {
      debugPrint('Error deleting reminder: $e');
      rethrow; // Rethrow the error
    }
  }

  void dispose() {
    debugPrint('NotifsModel: Disposed');
  }
}
