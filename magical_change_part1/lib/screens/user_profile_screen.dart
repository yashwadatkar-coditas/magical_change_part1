import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magical_change_part1/providers/users_list_provider.dart';

import 'package:magical_change_part1/widgets/list_of_custom_card.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userListProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text("Users List"),
          centerTitle: false,
        ),
        body: ListOfCustomard(
          users: users,
          onTapEdit: (index) {
            ref
                .read(userListProvider.notifier)
                .navigateToEditScreen(context, index);
          },
        ));
  }
}
