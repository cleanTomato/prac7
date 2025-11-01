import 'package:flutter/material.dart';
import 'package:water_tracker/features/water_tracker/state/water_tracker_state.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Трекер водного баланса',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const WaterTrackerState(),
    );
  }
}