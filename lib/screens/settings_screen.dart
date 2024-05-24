import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_test/screens/home_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static String get route => "/settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        leading: IconButton(
          onPressed: () {
            context.go(HomeScreen.route);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: const Center(
        child: Text("Settings"),
      ),
    );
  }
}
