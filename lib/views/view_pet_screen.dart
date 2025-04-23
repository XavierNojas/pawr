// import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/pet.dart';
import '../view_models/pet_view_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ViewPetScreen extends StatefulWidget {
  final Pet pet;

  const ViewPetScreen({Key? key, required this.pet}) : super(key: key);

  @override
  _ViewPetScreenState createState() => _ViewPetScreenState();
}

class _ViewPetScreenState extends State<ViewPetScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _breedController;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.pet.name);
    _breedController = TextEditingController(text: widget.pet.breed);
  }

  Future<void> _updatePet() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        loading = true;
      });

      final updatedPet = Pet(
        id: widget.pet.id,
        name: _nameController.text.trim(),
        user_id: Supabase.instance.client.auth.currentUser?.id ?? 'failed_user_authentication',
        breed: _breedController.text.trim(),
        age: widget.pet.age,
        weight: widget.pet.weight,
      );
      
      try {
        await Provider.of<PetViewModel>(context, listen: false)
            .updatePet(updatedPet);
        Navigator.pop(context);
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error updating contact: $error")),
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
  _breedController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Product")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Product Name",
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
              // Phone Field
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
                  if (double.tryParse(value.trim()) == null) {
                    return "Breed must be a number";
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
                        onPressed: _updatePet,
                        child: const Text("Update Product"),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
