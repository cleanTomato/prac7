import 'package:flutter/material.dart';
import 'package:water_tracker/features/navigation_choice/screens/navigation_choice_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Демо навигации',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const NavigationChoiceScreen(),
    );
  }
}