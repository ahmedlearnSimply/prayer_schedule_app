// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:prayer_schedule_app/components/app_fonts.dart';
import 'package:prayer_schedule_app/components/app_images.dart';
import 'package:prayer_schedule_app/components/prayer_calculate.dart';
import 'package:prayer_schedule_app/core/widgets/left_time.dart';
import 'package:prayer_schedule_app/core/widgets/prayer_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  String? formattedDate;
  String? formattedTime;
  Map<String, String>? prayerTimes;
  @override
  void initState() {
    super.initState();
    _calculatePrayerTimes();
    _updateDateTime(); // Fetch and format the current date and time
  }

  // Method to calculate prayer times
  void _calculatePrayerTimes() {
    final times = PrayerTimeCalculator.getPrayerTimes();
    setState(() {
      prayerTimes = times;
    });
  }

  // Method to update the date and time
  void _updateDateTime() {
    final now = DateTime.now();
    setState(() {
      formattedDate = DateFormat('dd MMMM, yyyy').format(now); // Format date
      formattedTime = DateFormat('h:mm a').format(now); // Format time
    });
  }

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
                const Gap(40),
                // Date and time
                Padding(
                  padding: const EdgeInsets.only(top: 14.0, left: 20),
                  child: Text(
                    formattedDate!,
                    style: AppFonts.get20Font(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1, left: 20),
                  child: Text(
                    formattedTime!,
                    style: AppFonts.get20Font(),
                  ),
                ),
                const Gap(16),

                // Prayer times - First row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PrayerBox(
                        text: "Fajr", time: prayerTimes!['fajr'] ?? '/na'),
                    PrayerBox(
                        text: "Shuruk", time: prayerTimes!['shuruk'] ?? '/na'),
                    PrayerBox(
                        text: "Dhuhr", time: prayerTimes!['dhuhr'] ?? '/na'),
                  ],
                ),
                const Gap(30),

                // Prayer times - Second row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PrayerBox(text: "Asr", time: prayerTimes!['asr'] ?? '/na'),
                    PrayerBox(
                        text: "Maghrib",
                        time: prayerTimes!['maghrib'] ?? '/na'),
                    PrayerBox(
                        text: "Isha", time: prayerTimes!['isha'] ?? '/na'),
                  ],
                ),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LeftTime(padding: 10),
                      Gap(15),
                      LeftTime(padding: 30),
                      Gap(10),
                      LeftTime(padding: 30),
                      Gap(90),
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
