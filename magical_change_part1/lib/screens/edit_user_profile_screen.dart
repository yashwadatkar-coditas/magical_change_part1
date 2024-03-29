import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magical_change_part1/providers/users_list_provider.dart';
import 'package:magical_change_part1/users_model.dart';
import 'package:magical_change_part1/widgets/custom_elevated_button.dart';

class EditUserProfileScreen extends ConsumerWidget {
  final int index;
  const EditUserProfileScreen({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userListProvider);

    late final TextEditingController nameController =
        TextEditingController(text: users[index].name);
    late final TextEditingController emailController =
        TextEditingController(text: users[index].email);
    late final TextEditingController phoneNumberController =
        TextEditingController(text: users[index].phoneNumber.toString());
    late final TextEditingController addressController =
        TextEditingController(text: users[index].address);

    bool _inputValidator() {
      if (nameController.text.isEmpty ||
          emailController.text.isEmpty ||
          phoneNumberController.text.isEmpty ||
          addressController.text.isEmpty) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Field is empty'),
            content: const Text('Please fill all fields'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Okay'),
              ),
            ],
          ),
        );

        return false;
      }

      if (int.tryParse(phoneNumberController.text) == null) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Invalid Phone Number'),
            content: const Text('Please enter a valid phone number'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Okay'),
              ),
            ],
          ),
        );
        return false;
      }

      return true;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit User Profile"),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: phoneNumberController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              maxLength: 50,
              maxLines: 5,
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customElevatedButton(
                  buttonName: 'Save',
                  onpress: () {
                    if (_inputValidator()) {
                      Navigator.pop(
                        context,
                        UserModels(
                          name: nameController.text,
                          email: emailController.text,
                          phoneNumber: int.parse(phoneNumberController.text),
                          address: addressController.text,
                          avatar: users[index].avatar,
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(width: 16.0),
                customElevatedButton(
                  buttonName: 'Cancel',
                  onpress: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
