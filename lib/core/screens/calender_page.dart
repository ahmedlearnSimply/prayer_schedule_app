// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:prayer_schedule_app/components/app_fonts.dart';
import 'package:prayer_schedule_app/components/app_images.dart';
import 'package:prayer_schedule_app/core/widgets/left_time.dart';
import 'package:prayer_schedule_app/core/widgets/prayer_box.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _HomePageState();
}

class _HomePageState extends State<CalenderPage> {
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

            // Main content column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(90),

                // Prayer times - First row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PrayerBox(text: "Fajr", time: "06:00"),
                    PrayerBox(text: "Shuruk", time: "07:18"),
                    PrayerBox(text: "Dhuhr", time: "06:00"),
                  ],
                ),
                const Gap(30),

                // Prayer times - Second row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PrayerBox(text: "Asr", time: "06:00"),
                    PrayerBox(text: "Maghrib", time: "06:00"),
                    PrayerBox(text: "Isha", time: "06:00"),
                  ],
                ),

                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 400,
                        child: DatePicker(
                          leadingDateTextStyle: TextStyle(
                            color: Colors.white,
                          ),
                          daysOfTheWeekTextStyle: TextStyle(
                            color: Colors.white,
                          ),
                          currentDateTextStyle: TextStyle(
                            color: Colors.white,
                          ),
                          highlightColor: Colors.white,
                          centerLeadingDate: true,
                          minDate: DateTime(2025),
                          maxDate: DateTime(2030),
                          initialDate: DateTime(2025, 1),
                          disabledCellsDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          enabledCellsDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          splashColor: Colors.white,
                          slidersColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // Bottom navigation bar (sits on top of the background)
    );
  }
}
