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


class FriendsViewModel extends ChangeNotifier {

  List<Friends> friends = [];
  List<UserDetails> myFriendsDetails = [];
  List<Pet> myPetsDetails = [];

  List<Pet> friendsPetsDetails = [];
  
  final supabase = Supabase.instance.client;

  bool isLoading = false;
  bool hasAddedUser = false;


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


  Future<void> insertNewFriend(String insertFriend) async {
    final user_id = supabase.auth.currentUser?.id ?? -1;

    try {
      final record = await supabase
          .from('friends')
          .select('referredFriends')
          .eq('owner_Id', user_id)
          .single();

      List<String> existing = record['referredFriends'] != null
          ? List<String>.from(record['referredFriends'])
          : [];

      if (existing.contains(insertFriend)) {
        hasAddedUser = true;
        return;
      }
      hasAddedUser = false;

      existing.add(insertFriend);

      await supabase.from('friends').update({
        'referredFriends': existing,
      }).eq('owner_Id', user_id);
    } catch (error) {
      print('Error inserting Friend: $error');
    }
  }

  
    Future<void> insertNewPet(String friendId, String petId) async {

    try {
      final record = await supabase
          .from('friends')
          .select('referredPets')
          .eq('owner_Id', friendId)
          .single();

      List<String> existing = record['referredPets'] != null
          ? List<String>.from(record['referredPets'])
          : [];

      if (existing.contains(petId)) {
        hasAddedUser = true;
        return;
      }
      hasAddedUser = false;

      existing.add(petId);

      await supabase.from('friends').update({
        'referredPets': existing,
      }).eq('owner_Id', friendId);

      await fetchMultiplePets(friendId);

    } catch (error) {
      print('Error inserting Friend: $error');
    }
  }



  Future<void> fetchMultipleFriends() async {

    final user_id = supabase.auth.currentUser?.id ?? -1;
    if (user_id == null) return;

    isLoading = true;
    notifyListeners();

    try {
      final data = await supabase
        .from('friends')
        .select('referredFriends')
        .eq('owner_Id', user_id)
        .single();

      if (data != null && data['referredFriends'] != null) {

        myFriendsDetails.clear();
        if (myFriendsDetails.isEmpty) {

          List<String> friendCollection = List<String>.from(data['referredFriends']);
          print(friendCollection);

          for (String friend in friendCollection) {
            final fetchOwnerDetails = await supabase
              .from('userDetails')
              .select()
              .eq('userId', friend)
              .single();
              
            myFriendsDetails.add(UserDetails.fromMap(fetchOwnerDetails));
          }
        }

      }

      // for (String friend in data['referredFriends']) {
      //   myFriendsDetails.add(UserDetails(username: friend, userType: 'userType', userId: '1', phone: 'phone', email: 'email@gmail.com', referenceCode: 'reaf-aege-ar23'));
      // }

      // myFriendsDetails.add(UserDetails(
      //   username: 'username', 
      //   userType: 'owner', 
      //   userId: 'fafeirieo-fafag-hahr', 
      //   email: 'email', 
      //   phone: 'phone',
      //   referenceCode: 'reference'));
      
      notifyListeners();
      isLoading = false;

    } catch (error) {
      print('Error fetching friends: $error');
    } finally {
    }
  }



  Future<void> fetchMultiplePets(String friendId) async {

    if (friendId == null) return;

    isLoading = true;
    notifyListeners();

    try {
      final data = await supabase
        .from('friends')
        .select('referredPets')
        .eq('owner_Id', friendId)
        .single();

      if (data != null && data['referredPets'] != null) {

        myPetsDetails.clear();
        if (myPetsDetails.isEmpty) {

          List<String> petCollection = List<String>.from(data['referredPets']);
          print(petCollection);

          for (String pet in petCollection) {
            final fetchPetDetails = await supabase
              .from('pets')
              .select()
              .eq('id', pet)
              .single();
              
            myPetsDetails.add(Pet.fromMap(fetchPetDetails));
          }
        }

      }
      notifyListeners();
      isLoading = false;

    } catch (error) {
      print('Error fetching pets: $error');
    } finally {
    }
  }


  Future<void> fetchFriendsPets() async {

        final user_id = supabase.auth.currentUser?.id ?? -1;


    if (user_id == null) return;

    isLoading = true;
    notifyListeners();

    try {
      final data = await supabase
        .from('friends')
        .select('referredPets')
        .eq('owner_Id', user_id)
        .single();

      if (data != null && data['referredPets'] != null) {

        friendsPetsDetails.clear();
        if (friendsPetsDetails.isEmpty) {

          List<String> petCollection = List<String>.from(data['referredPets']);
          print(petCollection);

          for (String pet in petCollection) {
            final fetchPetDetails = await supabase
              .from('pets')
              .select()
              .eq('id', pet)
              .single();
              
            friendsPetsDetails.add(Pet.fromMap(fetchPetDetails));
          }
        }

      }
      notifyListeners();
      isLoading = false;

    } catch (error) {
      print('Error fetching pets: $error');
    } finally {
    }
  }


}
