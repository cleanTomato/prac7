import 'package:flutter/material.dart';
import 'package:water_tracker/demo_app.dart';
import 'package:water_tracker/features/navigation_choice/models/navigation_type.dart';

class NavigationChoiceScreen extends StatelessWidget {
  const NavigationChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбор навигации'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Выберите тип навигации',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DemoApp(navigationType: NavigationType.pageBased),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
              ),
              child: const Text(
                'СТРАНИЧНАЯ НАВИГАЦИЯ\n(Вертикальная + Горизонтальная)',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DemoApp(navigationType: NavigationType.routeBased),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
              ),
              child: const Text(
                'МАРШРУТИЗИРОВАННАЯ НАВИГАЦИЯ\n(GoRouter + BottomNavigation)',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'В этом демо приложении показаны:\n\n'
                  '• Страничная навигация (push/pop)\n'
                  '• Маршрутизированная навигация (GoRouter)\n'
                  '• Вертикальная навигация (сохранение стека)\n'
                  '• Горизонтальная навигация (замена экрана)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}