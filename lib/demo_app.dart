import 'package:flutter/material.dart';
import 'package:water_tracker/features/navigation_choice/models/navigation_type.dart';
import 'package:water_tracker/features/route_based_navigation/route_based_app.dart';
import 'package:water_tracker/features/page_based_navigation/page_based_app.dart';

class DemoApp extends StatelessWidget {
  final NavigationType navigationType;

  const DemoApp({
    super.key,
    required this.navigationType,
  });

  @override
  Widget build(BuildContext context) {
    return navigationType == NavigationType.pageBased
        ? PageBasedApp()
        : RouteBasedApp();
  }
}