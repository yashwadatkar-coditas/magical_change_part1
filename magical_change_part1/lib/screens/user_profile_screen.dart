import 'package:flutter/material.dart';
import 'package:magical_change_part1/providers/users_list_provider.dart';

import 'package:magical_change_part1/widgets/list_of_custom_card.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
        centerTitle: false,
      ),
      body: Consumer<UserListProvider>(
        builder: (context, value, child) {
          return ListOfCustomard(
            users: value.users,
            onTapEdit: (index) {
              value.navigateToEditScreen(context, index);
            },
          );
        },
      ),
    );
  }
}
