import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magical_change_part1/providers/users_list_provider.dart';
import 'package:magical_change_part1/users_model.dart';

class CustomCard extends ConsumerWidget {
  UserModels user;
  VoidCallback ontap;
  int index;
  CustomCard(
      {super.key,
      required this.user,
      required this.ontap,
      required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userListProvider);
    return Card(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(users[index].avatar),
                  maxRadius: 25,
                ),
                SizedBox(width: 20),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Flexible(
                                child: Text(
                              users[index].name,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                          ),
                          SizedBox(width: 80),
                          SizedBox(
                            width: 100,
                            child: Flexible(
                              child: Text(
                                users[index].phoneNumber.toString(),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                        users[index].email,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 20,
                        width: 300,
                        child: SingleChildScrollView(
                            child: Text(users[index].address)),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          IconButton(
                            onPressed: ontap,
                            icon: Icon(Icons.edit),
                          ),
                          SizedBox(width: 200),
                          IconButton(
                            onPressed: () {
                              ref
                                  .read(userListProvider.notifier)
                                  .removeUsersFromList(index);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}
