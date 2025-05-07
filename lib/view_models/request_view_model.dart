import 'package:flutter/material.dart';
import 'package:paw_r_app/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/pet.dart';
import '../models/food.dart';

import '../models/foodLog.dart';
import '../models/request.dart';
import '../models/user.dart';

import 'package:intl/intl.dart';
import 'package:intl/intl.dart';

enum TimeFilter { day, week, month, year }

class RequestViewModel extends ChangeNotifier {
  List<Request> requests = [];
  List<Request> requestsAccepted = [];
  List<Request> otherRequests = [];
  List<Request> otherAcceptedRequests = [];
  List<Request> transactionHistory = [];
  final supabase = Supabase.instance.client;
  bool isLoading = false;

  int? recentPet = -1;

  Future<void> fetchRequests(String state) async {
    final user_id = supabase.auth.currentUser?.id ?? -1;

    isLoading = true;

    // fetch requests that are pending
    try {
      final data = await supabase
          .from('requests')
          .select()
          .eq('user_id', user_id)
          .eq('status', state)
          .order('created_at', ascending: false);
          
      requests = (data as List)
          .map((requestMap) => Request.fromMap(requestMap))
          .toList();
      notifyListeners();

      isLoading = false;
    } catch (error) {
      print('Error fetching requests: $error');
    }
  }

  Future<void> fetchAcceptedRequests(String state) async {
    final user_id = supabase.auth.currentUser?.id ?? -1;

    isLoading = true;

    // fetch requests that are pending
    try {
      final data = await supabase
          .from('requests')
          .select()
          .eq('user_id', user_id)
          .eq('status', state)
          .order('created_at', ascending: false);
          

        requestsAccepted = (data as List)
          .map((requestMap) => Request.fromMap(requestMap))
          .toList();
      notifyListeners();


      isLoading = false;
    } catch (error) {
      print('Error fetching requests: $error');
    }
  }


  Future<void> addRequest(Request request) async {
    try {
      await supabase.from('requests').insert(request.toMap());
      await fetchRequests('pending');
    } catch (error) {
      print('Error adding request: $error');
    }
  }

  Future<Pet?> fetchPetDetails(int petId) async {
    try {
      final data = await supabase
          .from('pets')
          .select()
          .eq('id', petId)
          .single(); // Fetch a single pet based on ID

      print(data);

      if (data != null) {
        return Pet.fromMap(data);
      } else {
        return null; // No pet found with that ID
      }
    } catch (error) {
      print('Error fetching pet details: $error');
      return null;
    }
  }

  Future<void> deleteMultipleRequests(List<int> requestIds) async {
    if (requestIds.isEmpty) {
      print('No snackIds to delete.');
      return;
    }
    try {
      await supabase.from('requests').delete().inFilter('id', requestIds);
      print('Deleted multiple food entries: $requestIds');
    } catch (error) {
      print('Error deleting multiple foods: $error');
    }
    print(requestIds);
  }

  Future<void> fetchOtherRequests(String state) async {
    final user_id = supabase.auth.currentUser?.id ?? -1;

    isLoading = true;

    // fetch requests that are pending
    try {
      final data = await supabase
          .from('requests')
          .select()
          .neq('user_id', user_id)
          .eq('status', state)
          .order('created_at', ascending: false);
      otherRequests = (data as List)
          .map((requestMap) => Request.fromMap(requestMap))
          .toList();
      notifyListeners();
      isLoading = false;
    } catch (error) {
      print('Error fetching requests: $error');
    }
  }

  // Future<void> fetchOtherAcceptedRequests(String userId) async {
  //   final user_id = supabase.auth.currentUser?.id ?? -1;

  //   isLoading = true;

  //   // fetch requests that are pending
  //   try {
  //     final data =
  //         await supabase.from('requests')
  //         .select()
  //         .eq('caretaker_id', userId)
  //         .eq('status', 'accepted')

  //         .order('created_at', ascending: false);
  //     otherRequests = (data as List)
  //         .map((requestMap) => Request.fromMap(requestMap))
  //         .toList();
  //     notifyListeners();
  //     isLoading = false;
  //   } catch (error) {
  //     print('Error fetching requests: $error');
  //   }
  // }

  Future<void> fetchOtherAcceptedRequests() async {
    final userId = supabase.auth.currentUser?.id ?? -1;

    isLoading = true;

    // fetch requests that are pending
    try {
      final data = await supabase
          .from('requests')
          .select()
          .eq('caretaker_id', userId)
          .eq('status', 'accepted')
          .order('created_at', ascending: false);
      otherAcceptedRequests = (data as List)
          .map((requestMap) => Request.fromMap(requestMap))
          .toList();
      notifyListeners();
      isLoading = false;
    } catch (error) {
      print('Error fetching requests: $error');
    }
  }

  Future<UserDetails?> fetchOwnerDetails(String? ownerId) async {
    try {
      final data = await supabase
          .from('userDetails')
          .select()
          .eq('userId', ownerId as Object)
          .single(); // Fetch a single pet based on ID

      print(data);

      if (data != null) {
        return UserDetails.fromMap(data);
      } else {
        return null; // No pet found with that ID
      }
    } catch (error) {
      print('Error fetching pet details: $error');
      return null;
    }
  }

  // Future<void> updatePet(Pet pet) async {
  //   try {
  //     await supabase.from('pets').update(pet.toMap()).eq('id', pet.id!);
  //     await fetchPets();
  //   } catch (error) {
  //     print('Error updating contact: $error');
  //   }
  // }

  Future<void> acceptRequest(Request request, String caretakerId) async {
    final formattedDate =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now().toUtc()) +
            '+00';

    try {
      await supabase.from('requests').update({
        'status': 'accepted',
        'caretaker_id': caretakerId,
        'modified_date': formattedDate
      }) // Only update the status
          .eq('id', request.id!);
      await fetchOtherRequests('pending');
    } catch (error) {
      print('Error updating contact: $error');
    }
  }

double totalEarnings = 0.0;

Future<String?> fetchEarnings(String position, TimeFilter filter, String userId) async {
  // final userId = supabase.auth.currentUser?.id;
  if (userId == null) return '';

  final now = DateTime.now().toUtc(); // Ensure current time is in UTC
  late DateTime start;
  late DateTime end;

  switch (filter) {
    case TimeFilter.day:
      start = DateTime.utc(now.year, now.month, now.day);
      end = start.add(Duration(days: 1));
      break;
    case TimeFilter.week:
      final weekdayOffset = now.weekday - 1; // Monday as the start of the week
      start = DateTime.utc(now.year, now.month, now.day)
          .subtract(Duration(days: weekdayOffset));
      end = start.add(Duration(days: 7));
      break;
    case TimeFilter.month:
      start = DateTime.utc(now.year, now.month, 1);
      end = (now.month < 12)
          ? DateTime.utc(now.year, now.month + 1, 1)
          : DateTime.utc(now.year + 1, 1, 1);
      break;
    case TimeFilter.year:
      start = DateTime.utc(now.year, 1, 1);
      end = DateTime.utc(now.year + 1, 1, 1);
      break;
  }

  try {
    final data = await supabase
        .from('requests')
        .select('total')
        .eq(position, userId)
        .eq('status', 'accepted')
        .gte('created_at', start.toIso8601String())
        .lt('created_at', end.toIso8601String());

    final totals = (data as List)
        .map((item) => double.tryParse(item['total'].toString()) ?? 0.0)
        .toList();

    totalEarnings = totals.fold(0.0, (sum, value) => sum + value);

    return totalEarnings.toStringAsFixed(2); // rounded to 2 decimal places
  } catch (error) {
    print('Error fetching earnings: $error');
    return null;
  }
}





  Future<void> fetchAllRequests(String user_id) async {
    // final user_id = supabase.auth.currentUser?.id ?? -1;

    isLoading = true;

    // fetch requests that are pending
    try {
      final data = await supabase
          .from('requests')
          .select()
          .or('user_id.eq.$user_id,caretaker_id.eq.$user_id')
          .eq('status', 'accepted')
          .order('created_at', ascending: false);
      

      if (data != null) {
      transactionHistory = (data as List)
          .map((requestMap) => Request.fromMap(requestMap))
          .toList();
      }

      print(data);


      isLoading = false;
      
    } catch (error) {
      print('Error fetching requests: $error');
    }
  }

  Future<void> clearTransactionsHistory() async {
    final user_id = supabase.auth.currentUser?.id ?? -1;

    isLoading = true;

    // fetch requests that are pending
    try {
      final data = await supabase
          .from('requests')
          .select()
          .or('user_id.eq.$user_id,caretaker_id.eq.$user_id')
          .eq('status', 'accepted')
          .order('created_at', ascending: false);
      

      if (data != null) {
      transactionHistory = (data as List)
          .map((requestMap) => Request.fromMap(requestMap))
          .toList();
      }

      print(data);


      isLoading = false;
      
    } catch (error) {
      print('Error fetching requests: $error');
    }
  }

  
}
