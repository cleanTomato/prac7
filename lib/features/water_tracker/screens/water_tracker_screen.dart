import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WaterTrackerScreen extends StatelessWidget {
  const WaterTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Трекер воды'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // ДЕМОНСТРАЦИЯ: Вертикальная навигация в маршрутизированном режиме
              context.push('/route-based/add-intake');
            },
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.water_drop, size: 64, color: Colors.blue),
            SizedBox(height: 16),
            Text(
              'Главный экран трекера',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}