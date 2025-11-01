import 'package:flutter/material.dart';
import 'package:water_tracker/features/water_tracker/models/water_intake.dart';
import 'package:water_tracker/features/water_tracker/widgets/intake_list_view.dart';
import 'package:water_tracker/features/water_tracker/widgets/smart_water_button.dart';
import 'package:water_tracker/features/water_tracker/widgets/water_level_indicator.dart';
import 'package:water_tracker/features/water_tracker/widgets/progress_circle.dart';

class WaterTrackerScreen extends StatelessWidget {
  final List<WaterIntake> intakes;
  final int dailyGoal;
  final VoidCallback onAdd;
  final ValueChanged<String> onDelete;
  final ValueChanged<int> onGoalChange;
  final VoidCallback onShowStatistics;
  final VoidCallback onShowHistory;
  final VoidCallback onShowSettings;
  final VoidCallback onShowGallery;

  const WaterTrackerScreen({
    super.key,
    required this.intakes,
    required this.dailyGoal,
    required this.onAdd,
    required this.onDelete,
    required this.onGoalChange,
    required this.onShowStatistics,
    required this.onShowHistory,
    required this.onShowSettings,
    required this.onShowGallery,
  });

  @override
  Widget build(BuildContext context) {
    final totalIntake = intakes.fold(0, (sum, intake) => sum + intake.effectiveVolume);
    final progress = dailyGoal > 0 ? totalIntake / dailyGoal : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Водный баланс'),
        actions: [
          // Иконки в AppBar - вертикальная навигация (push)
          IconButton(
            icon: const Icon(Icons.photo_library),
            onPressed: onShowGallery,
            tooltip: 'Галерея напитков',
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: onShowStatistics,
            tooltip: 'Статистика',
          ),
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: onShowHistory,
            tooltip: 'История',
          ),
          // Иконка настроек - горизонтальная навигация (pushReplacement)
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: onShowSettings,
            tooltip: 'Настройки',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProgressCircle(
                  progress: progress.toDouble(),
                  current: totalIntake,
                  goal: dailyGoal,
                ),
                WaterLevelIndicator(progress: progress.toDouble()),
              ],
            ),
            const SizedBox(height: 20),

            // Основная кнопка - вертикальная навигация
            SmartWaterButton(
              currentVolume: totalIntake,
              dailyGoal: dailyGoal,
              onPressed: onAdd,
            ),
            const SizedBox(height: 10),

            // Кнопки навигации
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: onShowGallery, // Вертикальная
                        icon: const Icon(Icons.photo_library),
                        label: const Text('Галерея'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: onShowStatistics, // Вертикальная
                        icon: const Icon(Icons.bar_chart),
                        label: const Text('Статистика'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: onShowHistory, // Вертикальная
                        icon: const Icon(Icons.history),
                        label: const Text('История'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: onShowSettings, // Горизонтальная
                        icon: const Icon(Icons.settings),
                        label: const Text('Настройки'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),
            Expanded(
              child: IntakeListView(
                intakes: intakes,
                onDelete: onDelete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}