import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magical_change_part1/screens/edit_user_profile_screen.dart';
import 'package:magical_change_part1/users_model.dart';

final userListProvider =
    StateNotifierProvider<UserListProvider, List<UserModels>>(
        (ref) => UserListProvider());

class UserListProvider extends StateNotifier<List<UserModels>> {
  UserListProvider()
      : super([
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
        ]);

  void navigateToEditScreen(BuildContext context, int index) async {
    final updatedUser = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditUserProfileScreen(index: index),
      ),
    );

    if (updatedUser != null) {
      updateUser(index, updatedUser);
    }
  }

  void updateUser(int index, UserModels updatedUser) {
    state[index] = updatedUser;
  }

  void removeUsersFromList(int index) {
    if (index >= 0 && index < state.length) {
      state.removeAt(index);
    }
  }
}
