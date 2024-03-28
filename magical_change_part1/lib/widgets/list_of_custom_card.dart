import 'package:flutter/material.dart';
import 'package:magical_change_part1/users_model.dart';
import 'package:magical_change_part1/widgets/custom_card.dart';

class ListOfCustomard extends StatelessWidget {
  List<UserModels> users;
  Function(int) onTapEdit;
  ListOfCustomard({super.key, required this.users, required this.onTapEdit});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return CustomCard(
            user: users[index],
            ontap: () {
              onTapEdit(index);
            });
      },
    );
  }
}
