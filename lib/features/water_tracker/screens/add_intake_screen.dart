import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddIntakeScreen extends StatelessWidget {
  const AddIntakeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить запись'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add_circle, size: 64, color: Colors.green),
            const SizedBox(height: 16),
            const Text(
              'Экран добавления записи',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // ДЕМОНСТРАЦИЯ: Вертикальная навигация pop
                context.pop();
              },
              child: const Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}