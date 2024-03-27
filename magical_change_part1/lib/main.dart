import 'package:flutter/material.dart';
import 'package:magical_change_part1/providers/users_list_provider.dart';
import 'package:magical_change_part1/screens/user_profile_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => UserListProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          cardTheme:
              const CardTheme().copyWith(margin: const EdgeInsets.all(12)),
        ),
        home: UserProfileScreen());
  }
}
