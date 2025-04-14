import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/pet.dart';
import '../view_models/pet_view_model.dart';
import '../view_models/contact_view_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({Key? key}) : super(key: key);

  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _userController = TextEditingController();
  final _breedController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();

  bool loading = false;

  bool isDecimal(double? value) { 
    if (value != null) {
      return value % 1 == 0;
    }
    print('value is null');
    return false;
  }

  Future<void> _savePet() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        loading = true;
      });

      String _weightString = _weightController.text.trim();

      // verify if weight has decimal
      if (isDecimal(double.tryParse(_weightController.text.trim()))) {
        _weightString = _weightString + '.0009';
        print('age has decimal');
      } else {
        _weightString = _weightString;
        print('age does not have decimal');
      }

      double? age = double.tryParse(_ageController.text.trim());
      double? weight = double.tryParse(_weightString);

      // fill user_id with user.id
      // age converts from double to int
      final newPet = Pet(
        name: _nameController.text.trim(),
        user_id: Supabase.instance.client.auth.currentUser?.id ?? 'failed_user_authentication',
        breed: _breedController.text.trim(),
        age: age?.toInt() ?? -1,
        weight: weight,
      );

      try {
        await Provider.of<PetViewModel>(context, listen: false)
            .addPet(newPet);
        Navigator.pop(context);
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error adding contact: $error")),
        );
      } finally {
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _userController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add pet")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Name is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _breedController,
                decoration: const InputDecoration(
                  labelText: "Breed",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Breed is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: "Age",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Age is required";
                  }
                  if (double.tryParse(value.trim()) == null) {
                    return "Age must be a number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _weightController,
                decoration: const InputDecoration(
                  labelText: "Weight",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Weight is required";
                  }
                  if (double.tryParse(value.trim()) == null) {
                    return "Weight must be a number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              loading
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _savePet,
                        child: const Text("Save Contact"),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
