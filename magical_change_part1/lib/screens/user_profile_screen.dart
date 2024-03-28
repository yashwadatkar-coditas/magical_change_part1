import 'package:flutter/material.dart';
import 'package:magical_change_part1/screens/edit_user_profile_screen.dart';
import 'package:magical_change_part1/users_model.dart';
import 'package:magical_change_part1/widgets/custom_card.dart';
import 'package:magical_change_part1/widgets/list_of_custom_card.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _navigateToEditScreen(BuildContext context, int index) async {
    final updatedUser = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditUserProfileScreen(user: users[index]),
      ),
    );

    if (updatedUser != null) {
      setState(() {
        users[index] = updatedUser;
      });
    }
  }

  List<UserModels> users = [
    UserModels(
      name: 'Yash Wadatkar',
      email: 'yash@gmail.com',
      phoneNumber: 9988776655,
      address: 'Nyati tech park wadgao sheri',
      avatar: 'assets/images/yash_profile_avatar.jpg',
    ),
    UserModels(
      name: 'Bhavesh',
      email: 'Bhavesh@gmail.com',
      phoneNumber: 9988776655,
      address: 'Nyati tech park wadgao sheri',
      avatar: 'assets/images/bhavesh_profile_avatar.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Users List"),
          centerTitle: false,
        ),
        body: ListOfCustomard(
            users: users,
            onTapEdit: (index) {
              _navigateToEditScreen(context, index);
            }));
  }
}
