// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:prayer_schedule_app/core/screens/home_page.dart';
import 'package:prayer_schedule_app/core/screens/test.dart';
import 'package:prayer_schedule_app/core/widgets/bottom_nav_bar.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBarWidget(),
    );
  }
}
