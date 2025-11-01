import 'package:flutter/material.dart';
import 'package:water_tracker/features/water_tracker/models/water_intake.dart';
import 'package:water_tracker/features/water_tracker/screens/water_tracker_screen.dart';
import 'package:water_tracker/features/water_tracker/screens/add_intake_screen.dart';
import 'package:water_tracker/features/water_tracker/screens/statistics_screen.dart';
import 'package:water_tracker/features/water_tracker/screens/history_screen.dart';
import 'package:water_tracker/features/water_tracker/screens/settings_screen.dart';
import 'package:water_tracker/features/water_tracker/screens/network_images_screen.dart';
import 'package:water_tracker/shared/constants/app_constants.dart';

class WaterTrackerState extends StatefulWidget {
  const WaterTrackerState({super.key});

  @override
  State<WaterTrackerState> createState() => _WaterTrackerStateState();
}

class _WaterTrackerStateState extends State<WaterTrackerState> {
  final List<WaterIntake> _intakes = [];
  int _dailyGoal = AppConstants.defaultDailyGoal;

  void _addIntake(int volume, String drinkType) {
    setState(() {
      final newIntake = WaterIntake(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        volume: volume,
        drinkType: drinkType,
        time: DateTime.now(),
      );
      _intakes.add(newIntake);
    });
  }

  void _deleteIntake(String id) {
    setState(() {
      _intakes.removeWhere((intake) => intake.id == id);
    });
  }

  void _updateDailyGoal(int newGoal) {
    setState(() {
      _dailyGoal = newGoal;
    });
  }

  // ВЕРТИКАЛЬНАЯ НАВИГАЦИЯ - push (сохраняет историю)
  void _navigateToAddScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddIntakeScreen(
          onSave: _addIntake,
        ),
      ),
    );
  }

  void _navigateToStatisticsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StatisticsScreen(
          intakes: _intakes,
          dailyGoal: _dailyGoal,
        ),
      ),
    );
  }

  void _navigateToHistoryScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HistoryScreen(
          intakes: _intakes,
          onDelete: _deleteIntake,
        ),
      ),
    );
  }

  void _navigateToGalleryScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NetworkImagesScreen(),
      ),
    );
  }

  // ГОРИЗОНТАЛЬНАЯ НАВИГАЦИЯ - pushReplacement (заменяет экран)
  void _navigateToSettingsScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsScreen(
          dailyGoal: _dailyGoal,
          onGoalChange: _updateDailyGoal,
          onNavigateToMain: _navigateToMainScreen,
        ),
      ),
    );
  }

  void _navigateToMainScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => WaterTrackerScreen(
          intakes: _intakes,
          dailyGoal: _dailyGoal,
          onAdd: () => _navigateToAddScreen(context),
          onDelete: _deleteIntake,
          onGoalChange: _updateDailyGoal,
          onShowStatistics: () => _navigateToStatisticsScreen(context),
          onShowHistory: () => _navigateToHistoryScreen(context),
          onShowSettings: () => _navigateToSettingsScreen(context),
          onShowGallery: () => _navigateToGalleryScreen(context),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WaterTrackerScreen(
      intakes: _intakes,
      dailyGoal: _dailyGoal,
      onAdd: () => _navigateToAddScreen(context),
      onDelete: _deleteIntake,
      onGoalChange: _updateDailyGoal,
      onShowStatistics: () => _navigateToStatisticsScreen(context),
      onShowHistory: () => _navigateToHistoryScreen(context),
      onShowSettings: () => _navigateToSettingsScreen(context),
      onShowGallery: () => _navigateToGalleryScreen(context),
    );
  }
}