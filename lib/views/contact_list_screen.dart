import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/contact_view_model.dart';

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the view model
    final contactVM = Provider.of<ContactViewModel>(context, listen: false);

    // Fetch contacts when the screen loads
    contactVM.fetchContacts();

    return Scaffold(
      appBar: AppBar(title: const Text('Phonebook')),
      body: Consumer<ContactViewModel>(
        builder: (context, vm, child) {
          if (vm.contacts.isEmpty) {
            return const Center(child: Text('No contacts found.'));
          }
          return ListView.builder(
            itemCount: vm.contacts.length,
            itemBuilder: (context, index) {
              final contact = vm.contacts[index];
              return ListTile(
                title: Text(contact.name),
                subtitle: Text(contact.phone),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => vm.deleteContact(contact.id!),
                ),
                onTap: () {
                  // Navigate to an edit screen (not shown here)
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Navigate to an "Add Contact" screen (not shown here)
          Navigator.pushNamed(context, '/addPet');
        },
      ),
    );
  }
}
