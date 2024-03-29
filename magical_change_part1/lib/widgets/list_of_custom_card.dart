import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magical_change_part1/providers/users_list_provider.dart';
import 'package:magical_change_part1/users_model.dart';
import 'package:magical_change_part1/widgets/custom_card.dart';

class ListOfCustomard extends ConsumerWidget {
  List<UserModels> users;
  Function(int) onTapEdit;
  ListOfCustomard({super.key, required this.users, required this.onTapEdit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userListProvider);
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return CustomCard(
          user: users[index],
          ontap: () {
            onTapEdit(index);
          },
          index: index,
        );
      },
    );
  }
}
