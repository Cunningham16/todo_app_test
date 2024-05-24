import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_test/screens/auth_screen.dart';
import 'package:todo_app_test/screens/settings_screen.dart';
import 'package:todo_app_test/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String get route => "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  leading: IconButton(
                      onPressed: () {
                        context.go(SettingsScreen.route);
                      },
                      icon: const Icon(Icons.settings)),
                  actions: [
                    IconButton(
                        onPressed: () async {
                          AuthService authService = AuthService();
                          authService.logout();
                          context.go(AuthScreen.route);
                        },
                        icon: const Icon(Icons.person))
                  ],
                  surfaceTintColor: Colors.white,
                  centerTitle: true,
                  pinned: true,
                  floating: true,
                  snap: true,
                  forceElevated: innerBoxIsScrolled,
                  title: const Text("Todo app test"),
                  bottom: const TabBar(
                    tabs: [
                      Tab(
                        text: "All tasks",
                      ),
                      Tab(
                        text: "Active",
                      ),
                      Tab(
                        text: "Completed",
                      )
                    ],
                  ),
                )
              ];
            },
            body: TabBarView(
              children: [
                Center(
                    child: Text(FirebaseAuth.instance.currentUser.toString())),
                Center(child: Text("Active tasks")),
                Center(
                  child: Text("Completed tasks"),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.swap_vert)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_horiz))
                ],
              ),
              Spacer(),
              FloatingActionButton(
                onPressed: () {},
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ));
  }
}
