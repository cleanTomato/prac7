import 'package:flutter/material.dart';
import 'package:water_tracker/shared/constants/app_constants.dart';

class SettingsScreen extends StatelessWidget {
  final int dailyGoal;
  final ValueChanged<int> onGoalChange;
  final Function(BuildContext) onNavigateToMain;

  const SettingsScreen({
    super.key,
    required this.dailyGoal,
    required this.onGoalChange,
    required this.onNavigateToMain,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: dailyGoal.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Дневная цель',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Объем в мл',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        final newGoal = int.tryParse(controller.text) ?? AppConstants.defaultDailyGoal;
                        onGoalChange(newGoal);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Цель обновлена')),
                        );
                      },
                      child: const Text('Сохранить цель'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Навигация',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => onNavigateToMain(context), // Горизонтальная навигация - pushReplacement
                      child: const Text('Вернуться на главную'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'О приложении',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Трекер водного баланса'),
                    Text('Версия 1.0.0'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}