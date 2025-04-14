import 'package:flutter/material.dart';
import 'package:paw_r_app/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/contact.dart';
import '../models/pet.dart';

class PetViewModel extends ChangeNotifier {
  List<Contact> contacts = [];
  List<Pet> pets = [];
  final supabase = Supabase.instance.client;

  // Fetch all contacts from the "contacts" table
  Future<void> fetchContacts() async {
    try {
      final data = await supabase.from('contacts').select();
      contacts = (data as List)
          .map((contactMap) => Contact.fromMap(contactMap))
          .toList();
      notifyListeners();
    } catch (error) {
      print('Error fetching contacts: $error');
    }
  }

  // Fetch all pets from the "pets" table
  Future<void> fetchPets() async {
    try {
      final data = await supabase.from('pets').select().eq('user_id', supabase.auth.currentUser?.id ?? -1);
      pets = (data as List)
          .map((petMap) => Pet.fromMap(petMap))
          .toList();
      notifyListeners();
      print('pets fetched succesfully');
    } catch (error) {
      print('Error fetching pets: $error');
    }
  }

  // Create a new contact
  Future<void> addContact(Contact contact) async {
    try {
      await supabase.from('contacts').insert(contact.toMap());
      await fetchContacts();
    } catch (error) {
      print('Error adding contact: $error');
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

  // Update an existing contact
  Future<void> updateContact(Contact contact) async {
    try {
      await supabase
          .from('contacts')
          .update(contact.toMap())
          .eq('id', contact.id!);
      await fetchContacts();
    } catch (error) {
      print('Error updating contact: $error');
    }
  }

  Future<void> updatePet(Pet pet) async {
    try {
      await supabase
          .from('contacts')
          .update(pet.toMap())
          .eq('id', pet.id!);
      await fetchPets();
    } catch (error) {
      print('Error updating contact: $error');
    }
  }

  // Delete a contact
  Future<void> deleteContact(int id) async {
    try {
      await supabase.from('contacts').delete().eq('id', id);
      await fetchContacts();
    } catch (error) {
      print('Error deleting contact: $error');
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

}




