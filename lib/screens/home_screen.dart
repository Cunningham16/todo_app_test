import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_test/models/task_model.dart';
import 'package:todo_app_test/screens/auth_screen.dart';
import 'package:todo_app_test/screens/settings_screen.dart';
import 'package:todo_app_test/services/auth_service.dart';
import 'package:todo_app_test/services/task_service.dart';
import 'package:todo_app_test/widgets/task_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String get route => "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
          length: 3,
          child: StreamBuilder<List<TaskModel>>(
              stream: TaskService().watchTasks(),
              builder: (context, snapshot) {
                return NestedScrollView(
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
                  body: snapshot.hasData
                      ? TabBarView(
                          children: [
                            TaskListView(taskList: snapshot.data!),
                            TaskListView(
                                taskList: snapshot.data!
                                    .where((element) => !element.isCompleted)
                                    .toList()),
                            TaskListView(
                                taskList: snapshot.data!
                                    .where((element) => element.isCompleted)
                                    .toList())
                          ],
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                );
              }),
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
