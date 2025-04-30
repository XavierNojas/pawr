import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/pet_view_model.dart';

import 'view_pet_screen.dart';
import 'logout_button.dart';

class PetListScreen extends StatelessWidget {
  const PetListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final petVM = Provider.of<PetViewModel>(context, listen: false);

    petVM.fetchPets();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Petbook'),
          actions: const [
            LogoutButton(),
          ],
        ),
        body: Consumer<PetViewModel>(
          builder: (Context, vm, child) {
            if (vm.pets.isEmpty) {
              return const Center(child: Text('No pets found.'));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: vm.pets.length,
              itemBuilder: (context, index) {
                final pet = vm.pets[index];
                return ListTile(
                  title: Text(pet.name),
                  subtitle: Text(pet.breed),
                  trailing: IconButton(
                    color: Colors.red,
                    icon: const Icon(Icons.delete),
                    onPressed: () => vm.deletePet(pet.id!),
                  ),
                  onTap: () {
                    // Navigate to an edit screen (not shown here)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewPetScreen(pet: pet),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/addPet');
            }));
  }
}
