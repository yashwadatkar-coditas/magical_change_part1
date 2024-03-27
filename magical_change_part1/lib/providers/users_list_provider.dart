import 'package:flutter/material.dart';
import 'package:magical_change_part1/screens/edit_user_profile_screen.dart';
import 'package:magical_change_part1/users_model.dart';

class UserListProvider extends ChangeNotifier {
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

  void navigateToEditScreen(BuildContext context, int index) async {
    final updatedUser = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditUserProfileScreen(user: users[index]),
      ),
    );

    if (updatedUser != null) {
      updateUser(index, updatedUser);
    }
    notifyListeners();
  }

  void updateUser(int index, UserModels updatedUser) {
    users[index] = updatedUser;
    notifyListeners();
  }

  void removeUsersFromList(int index) {
    if (index >= 0 && index < users.length) {
      users.removeAt(index);
      notifyListeners();
    }
  }
}
