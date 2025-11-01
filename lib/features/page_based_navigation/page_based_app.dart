import 'package:flutter/material.dart';
import 'package:water_tracker/features/water_tracker/screens/water_tracker_screen.dart';
import 'package:water_tracker/features/statistics/screens/statistics_screen.dart';
import 'package:water_tracker/features/gallery/screens/network_images_screen.dart';
import 'package:water_tracker/features/history/screens/history_screen.dart';
import 'package:water_tracker/features/settings/screens/settings_screen.dart';

class PageBasedApp extends StatefulWidget {
  const PageBasedApp({super.key});

  @override
  State<PageBasedApp> createState() => _PageBasedAppState();
}

class _PageBasedAppState extends State<PageBasedApp> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> _screens = [
    const WaterTrackerScreen(),
    const StatisticsScreen(),
    const NetworkImagesScreen(),
    const HistoryScreen(),
    const SettingsScreen(),
  ];

  final List<String> _screenTitles = [
    'Трекер',
    'Статистика',
    'Галерея',
    'История',
    'Настройки',
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final newIndex = _pageController.page?.round() ?? 0;
    if (newIndex != _currentIndex) {
      setState(() {
        _currentIndex = newIndex;
      });
    }
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Страничная навигация',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_screenTitles[_currentIndex]),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.info),
              onPressed: _showNavigationInfo,
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.blue,
              child: const Text(
                'СТРАНИЧНАЯ НАВИГАЦИЯ (Navigator.push/pop + PageView)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                children: _screens,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onBottomNavTap,
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Демо вертикальной навигации'),
                  ),
                  body: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, size: 64, color: Colors.amber),
                        SizedBox(height: 16),
                        Text(
                          'Это новый экран в стеке навигации!',
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Использован Navigator.push()',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _showNavigationInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Страничная навигация'),
        content: const Text(
          'Используется Navigator с MaterialPageRoute\n\n'
              '• BottomNavigationBar с setState\n'
              '• PageView со свайпами между экранами\n'
              '• Вертикальная навигация: Navigator.push/pop\n'
              '• Горизонтальная навигация: смена индекса + свайпы\n\n'
              'Демо методов:\n'
              '• push - FAB кнопка\n'
              '• pop - автоматическая кнопка в AppBar\n'
              '• PageView - свайпы между экранами',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}