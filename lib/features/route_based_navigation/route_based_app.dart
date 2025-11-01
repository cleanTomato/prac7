import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:water_tracker/features/water_tracker/screens/water_tracker_screen.dart';
import 'package:water_tracker/features/water_tracker/screens/add_intake_screen.dart';
import 'package:water_tracker/features/statistics/screens/statistics_screen.dart';
import 'package:water_tracker/features/gallery/screens/network_images_screen.dart';
import 'package:water_tracker/features/history/screens/history_screen.dart';
import 'package:water_tracker/features/settings/screens/settings_screen.dart';

class RouteBasedApp extends StatelessWidget {
  RouteBasedApp({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return RouteBasedScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/tracker',
                builder: (context, state) => const WaterTrackerScreen(),
                routes: [
                  GoRoute(
                    path: 'add-intake',
                    builder: (context, state) => const AddIntakeScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/statistics',
                builder: (context, state) => const StatisticsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/gallery',
                builder: (context, state) => const NetworkImagesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/history',
                builder: (context, state) => const HistoryScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
    initialLocation: '/tracker',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Маршрутизированная навигация',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

class RouteBasedScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const RouteBasedScaffold({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Маршрутизированная навигация'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Маршрутизированная навигация'),
                  content: const Text(
                    'Используется GoRouter с StatefulShellRoute\n\n'
                        '• Навигация через context.go()/context.push()\n'
                        '• Сохранение состояния каждого раздела\n'
                        '• Горизонтальная навигация через goBranch\n'
                        '• Вертикальная навигация через push',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.water_drop),
            label: 'Трекер',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Статистика',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Галерея',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'История',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}