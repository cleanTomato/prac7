import 'package:flutter/material.dart';
import 'package:water_tracker/features/water_tracker/models/water_intake.dart';
import 'package:water_tracker/features/water_tracker/widgets/intake_list_view.dart';

class HistoryScreen extends StatelessWidget {
  final List<WaterIntake> intakes;
  final ValueChanged<String> onDelete;

  const HistoryScreen({
    super.key,
    required this.intakes,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final sortedIntakes = List<WaterIntake>.from(intakes)
      ..sort((a, b) => b.time.compareTo(a.time));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Вертикальный возврат - pop
        ),
        title: const Text('История записей'),
      ),
      body: IntakeListView(
        intakes: sortedIntakes,
        onDelete: onDelete,
      ),
    );
  }
}