// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:math'; // Import for pi constant
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:prayer_schedule_app/components/app_fonts.dart';
import 'package:prayer_schedule_app/components/app_images.dart';
import 'package:prayer_schedule_app/core/widgets/left_time.dart';
import 'package:prayer_schedule_app/core/widgets/prayer_box.dart';

class CompassPage extends StatefulWidget {
  CompassPage({super.key});

  @override
  State<CompassPage> createState() => _CompassPageState();
}

class _CompassPageState extends State<CompassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use SafeArea to avoid system UI overlaps
      body: SafeArea(
        child: Stack(
          children: [
            // Background image (takes up the entire screen)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        AppImages.fajr), // Replace with your image path
                    fit: BoxFit.cover, // Cover the entire screen
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
