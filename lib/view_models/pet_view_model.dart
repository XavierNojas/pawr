import 'package:flutter/material.dart';
import 'package:paw_r_app/models/friends.dart';
import 'package:paw_r_app/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/pet.dart';
import '../models/food.dart';

import '../models/foodLog.dart';

import '../models/moodLog.dart';

import '../models/mood.dart';

import '/components/mood_card_widget.dart';

import '../models/activity.dart';

import '../models/activityLog.dart';

import 'package:paw_r_app/components/activity_card_model.dart';

import 'dart:convert';


class PetViewModel extends ChangeNotifier {

  List<Friends> friends = [];
  List<UserDetails> myFriendsDetails = [];
  
  List<Pet> pets = [];
  List<Food> snacks = [];
  List<FoodLog> snackLogs = [];
  List<MoodLog> moodLogs = [];
  List<ActivityLog> activityLogs = [];
  List<Activity> activities = [];

  final supabase = Supabase.instance.client;

  bool isLoading = false;
  int? recentPet = -1;
  bool hasAddedUser = false;

  bool isMultipleFriendsLoading = false;

  // Fetch all pets from the "pets" table
  Future<void> fetchPets() async {
    final user_id = supabase.auth.currentUser?.id ?? -1;

    isLoading = true;

    try {
      final data = await supabase.from('pets').select().eq('user_id', user_id).order('created_at', ascending: false);
      pets = (data as List).map((petMap) => Pet.fromMap(petMap)).toList();
      notifyListeners();
      isLoading = false;
    } catch (error) {
      print('Error fetching snacks: $error');
    }
  }

  Future<void> addPet(Pet pet) async {
    try {
      await supabase.from('pets').insert(pet.toMap());
      await fetchPets();
    } catch (error) {
      print('Error adding contact: $error');
    }
  }

  Future<void> addUser(UserDetails user) async {
    try {
      await supabase.from('userDetails').insert(user.toMap());
    } catch (error) {
      print('Error adding user: $error');
    }
  }

  Future<void> updatePet(Pet pet) async {
    try {
      await supabase.from('pets').update(pet.toMap()).eq('id', pet.id!);
      await fetchPets();
    } catch (error) {
      print('Error updating contact: $error');
    }
  }

  // Delete a contact
  Future<void> deletePet(int id) async {
    try {
      await supabase.from('pets').delete().eq('id', id);
      await fetchPets();
      await deleteRequestAfterPet(id);
      await deletePetFromFriends(id);
    } catch (error) {
      print('Error deleting pets: $error');
    }
  }


  Future<void> deletePetFromFriends(int petId) async {
    final user_id = supabase.auth.currentUser?.id ?? -1;

    try {
      final data = await supabase
          .from('friends')
          .select('referredFriends')
          .eq('owner_Id', user_id)
          .single();

      if (data != null && data['referredFriends'] != null) {
        List<String> friendCollection =
            List<String>.from(data['referredFriends']);

        for (String friend in friendCollection) {
          final record = await supabase
              .from('friends')
              .select('referredPets')
              .eq('owner_Id', friend)
              .single();

          List<String> existing = record['referredPets'] != null
              ? List<String>.from(record['referredPets'])
              : [];

              print('does pet id exist in friend ?');
              print(existing.contains(petId.toString()));

          if (existing.contains(petId.toString())) {
            existing.remove(petId.toString());

            print('contents of existing');
            print(existing);

            await supabase.from('friends').update({
              'referredPets': existing,
            }).eq('owner_Id', friend);
          }


        }
      } 
      else {}
    } catch (error) {
      print('Error while deleting pet from friends: $error');
    }
  }

  fetchRecentPet() {
    return recentPet;
  }

  setRecentPet(int? new_pet_id) {
    recentPet = new_pet_id;
  }

  Future<void> fetchSnacks(int? petId) async {
    setRecentPet(petId);
    isLoading = true;

    try {
      final data =
          await supabase.from('foods').select().eq('pet_id', fetchRecentPet());
      snacks = (data as List).map((foodMap) => Food.fromMap(foodMap)).toList();
      notifyListeners();
      isLoading = false;
    } catch (error) {
      print('Error fetching snacks: $error');
    }
  }

  Future<void> fetchMood(int? petId) async {
    setRecentPet(petId);
    isLoading = true;

    try {
      final data = await supabase.from('moods').select();
      snacks = (data as List).map((foodMap) => Food.fromMap(foodMap)).toList();
      notifyListeners();
      isLoading = false;
    } catch (error) {
      print('Error fetching snacks: $error');
    }
  }

  Future<void> addFood(Food food) async {
    try {
      await supabase.from('foods').insert(food.toMap());
      await fetchSnacks(fetchRecentPet());
      await fetchSnacks(fetchRecentPet());
    } catch (error) {
      print('Error adding food: $error');
    }
  }

  Future<void> deleteFood(int? snackId) async {
    if (snackId == null) {
      print('deleteFood: snackId is null. Skipping delete.');
      return;
    }
    try {
      await supabase.from('foods').delete().eq('id', snackId as Object);
      // await fetchSnacks(fetchRecentPet());
      print('deleteSnack: $snackId');
    } catch (error) {
      print('Error deleting foods: $error');
    }
  }

  Future<void> deleteMultipleFoods(List<int> snackIds) async {
    if (snackIds.isEmpty) {
      print('No snackIds to delete.');
      return;
    }
    try {
      await supabase.from('foods').delete().inFilter('id', snackIds);
      print('Deleted multiple food entries: $snackIds');
    } catch (error) {
      print('Error deleting multiple foods: $error');
    }
  }

  Future<void> addFoodLog(FoodLog snack) async {
    try {
      await supabase.from('foodLogs').insert(snack.toMap());
    } catch (error) {
      print('Error adding food: $error');
    }
  }

  Future<void> fetchFoodLogs(int? petId) async {
    setRecentPet(petId);
    isLoading = true;

    try {
      final data = await supabase
          .from('foodLogs')
          .select()
          .eq('pet_id', fetchRecentPet())
          .order('id', ascending: false)
          .limit(20);
      snackLogs = (data as List)
          .map((snackLogMap) => FoodLog.fromMap(snackLogMap))
          .toList();
      notifyListeners();
      isLoading = false;
    } catch (error) {
      print('Error fetching foodLogs: $error');
    }
  }

  bool isDecimal(double? value) {
    if (value != null) {
      return value % 1 != 0;
    }
    return false;
  }

  double? modifyNum(String val) {
    final parsed = double.tryParse(val);
    if (parsed == null) return null;

    return isDecimal(parsed) ? parsed : parsed + 0.009;
  }

  // determaxes if value is close to whole number
  bool isCloseToInteger(double? value) {
    if (isDecimal(value)) {
      final stringValue = value.toString();
      final decimalIndex = stringValue.indexOf('.');
      final valAfterDot = int.tryParse(stringValue[decimalIndex + 1]);

      return valAfterDot == 0;
    }
    return true;
  }

  String? doubleToInteger(double? value) {
    if (isCloseToInteger(value)) {
      return (value?.toInt()).toString();
    }
    return value.toString();
  }

  Future<void> addRequest(Pet pet) async {
    try {
      await supabase.from('pets').insert(pet.toMap());
      await fetchPets();
    } catch (error) {
      print('Error adding contact: $error');
    }
  }

  Future<Pet?> fetchPetDetails(int petId) async {
    try {
      final data = await supabase
          .from('pets')
          .select()
          .eq('id', petId)
          .single(); // Fetch a single pet based on ID

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

  Future<void> logMood(List<MoodCardModel> moodCollection, String? observationNote, int? petId) async {

    List<String> moodTitleCollection = [];

    for (var mood in moodCollection) {
      moodTitleCollection.add(mood.widget!.title ?? 'empty');
    }

    MoodLog moodLog = MoodLog(
      mood: moodTitleCollection,
      petId: petId,
      observation: observationNote,
    );

    try {
      await supabase.from('moods').insert(moodLog.toMap());
    } catch (error) {
      print('Error adding contact: $error');
    }
    
  }


  Future<void> fetchMoodLogs(int? petId) async {
    setRecentPet(petId);
    isLoading = true;

    try {
      final data = await supabase
          .from('moods')
          .select()
          .eq('petId', fetchRecentPet())
          .order('id', ascending: false)
          .limit(20);

      moodLogs = (data as List)
          .map((moodLogMap) => MoodLog.fromMap(moodLogMap))
          .toList();

      notifyListeners();
      isLoading = false;
    } catch (error) {
      print('Error fetching foodLogs: $error');
    }
  }

  
  Future<void> deleteRequestAfterPet(petId) async {
    try {
      await supabase.from('requests').delete().eq('pet_id', petId);
    } catch (error) {
      print('Error deleting pets: $error');
    }
  }




  Future<void> addActivity(Activity activity) async {
    try {
      await supabase.from('activities').insert(activity.toMap());
      fetchActivities(fetchRecentPet());
    } catch (error) {
      print('Error adding activity: $error');
    }
  }



  Future<void> fetchActivities(int? petId) async {
    setRecentPet(petId);
    isLoading = true;

    try {
      final data = await supabase.from('activities').select().eq('pet_id', fetchRecentPet());
      activities = (data as List).map((activityMap) => Activity.fromMap(activityMap)).toList();
      notifyListeners();
      isLoading = false;
    } catch (error) {
      print('Error fetching activities: $error');
    }
  }



  Future<void> logActivity(List<ActivityCardModel> activityCollection, String? observationNote, int? petId) async {

    List<String> activityTitleCollection = [];

    for (var mood in activityCollection) {
      activityTitleCollection.add(mood.widget!.title ?? 'empty');
    }

    ActivityLog activityLog = ActivityLog(
      activityLogs: activityTitleCollection,
      petId: petId,
      observation: observationNote,
    );

    try {
      await supabase.from('activityLog').insert(activityLog.toMap());
    } catch (error) {
      print('Error adding activity: $error');
    }
    
  }


  Future<void> deleteMultipleActivity(List<int> activityIds) async {
    if (activityIds.isEmpty) {
      print('No snackIds to delete.');
      return;
    }
    try {
      await supabase.from('activities').delete().inFilter('id', activityIds);
      print('Deleted multiple food entries: $activityIds');
    } catch (error) {
      print('Error deleting multiple foods: $error');
    }
  }


  Future<void> fetchActivityLogs(int? petId) async {
    setRecentPet(petId);
    print('recent pet id: {$petId}');
    isLoading = true;

    try {
      final data = await supabase
          .from('activityLog')
          .select()
          .eq('petId', fetchRecentPet())
          .order('created_at', ascending: false)
          .limit(20);

      activityLogs = (data as List)
          .map((activityLogMap) => ActivityLog.fromMap(activityLogMap))
          .toList();

      notifyListeners();
      isLoading = false;
    } catch (error) {
      print('Error fetching activityLog: $error');
    }
  }




  Future<String?> fetchFriend(String referralCode) async {
    try {
      final data = await supabase
        .from('userDetails')
        .select('userId')
        .eq('referenceCode', referralCode)
        .single(); // Fetch a single pet based on ID

      final ownerId = data['userId'];

      if (data != null) {
        return ownerId;
      } else {
        return null; // No pet found with that ID
      }
    } catch (error) {
      print('Error fetching friend: $error');
      return null;
    }
  }

  
}
