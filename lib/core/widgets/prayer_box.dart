// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:prayer_schedule_app/components/app_fonts.dart';

class PrayerBox extends StatelessWidget {
  final String text;
  final String time;
  PrayerBox({
    required this.text,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(0.4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              text,
              style: AppFonts.get20Font(),
            ),
            Gap(2),
            Text(
              time,
              style: AppFonts.get20Font(),
            ),
          ],
        ),
      ),
    );
  }
}
