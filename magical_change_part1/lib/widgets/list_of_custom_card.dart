import 'package:flutter/material.dart';
import 'package:magical_change_part1/providers/users_list_provider.dart';
import 'package:magical_change_part1/users_model.dart';
import 'package:magical_change_part1/widgets/custom_card.dart';
import 'package:provider/provider.dart';

class ListOfCustomard extends StatelessWidget {
  List<UserModels> users;
  Function(int) onTapEdit;
  ListOfCustomard({super.key, required this.users, required this.onTapEdit});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserListProvider>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.users.length,
          itemBuilder: (context, index) {
            return CustomCard(
              user: value.users[index],
              ontap: () {
                onTapEdit(index);
              },
              index: index,
            );
          },
        );
      },
    );
  }
}
