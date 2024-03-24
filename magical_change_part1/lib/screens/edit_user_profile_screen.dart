import 'package:flutter/material.dart';
import 'package:magical_change_part1/users_model.dart';
import 'package:magical_change_part1/widgets/custom_elevated_button.dart';

class EditUserProfileScreen extends StatefulWidget {
  final UserModels user;
  const EditUserProfileScreen({super.key, required this.user});

  @override
  State<EditUserProfileScreen> createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  late var nameController = TextEditingController();
  late var emailController = TextEditingController();
  late var phoneNumberController = TextEditingController();
  late var addressController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    nameController = TextEditingController(text: widget.user.name);
    emailController = TextEditingController(text: widget.user.email);
    phoneNumberController =
        TextEditingController(text: widget.user.phoneNumber.toString());
    addressController = TextEditingController(text: widget.user.address);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit User Profile"),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: 'Name', border: OutlineInputBorder()),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                  labelText: 'Phone Number', border: OutlineInputBorder()),
            ),
            SizedBox(height: 15),
            TextFormField(
              maxLength: 50,
              maxLines: 5,
              controller: addressController,
              decoration: InputDecoration(
                  labelText: 'Address', border: OutlineInputBorder()),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customElevatedButton(
                    buttonName: 'Save',
                    onpress: () {
                      Navigator.pop(
                        context,
                        UserModels(
                          name: nameController.text,
                          email: emailController.text,
                          phoneNumber: int.parse(phoneNumberController.text),
                          address: addressController.text,
                          avatar: widget.user.avatar,
                        ),
                      );
                    }),
                SizedBox(width: 16.0),
                customElevatedButton(
                    buttonName: 'Cancel',
                    onpress: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
