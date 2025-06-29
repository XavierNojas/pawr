import 'package:flutter/material.dart';
import 'package:paw_r_app/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/pet.dart';
import '../models/food.dart';

import '../models/foodLog.dart';

class PetViewModel extends ChangeNotifier {
  List<Pet> pets = [];
  List<Food> snacks = [];
  List<FoodLog> snackLogs = [];
  final supabase = Supabase.instance.client;
  bool isLoading = false;

  int? recentPet = -1;

  // Fetch all pets from the "pets" table
  Future<void> fetchPets() async {
    final userId = supabase.auth.currentUser?.id ?? -1;

    isLoading = true;

    try {
      final data = await supabase.from('pets').select().eq('user_id', userId);
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
    } catch (error) {
      print('Error deleting pets: $error');
    }
  }

  fetchRecentPet() {
    return recentPet;
  }

  setRecentPet(int? newPetId) {
    recentPet = newPetId;
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

      return Pet.fromMap(data);
    } catch (error) {
      print('Error fetching pet details: $error');
      return null;
    }
  }
}
